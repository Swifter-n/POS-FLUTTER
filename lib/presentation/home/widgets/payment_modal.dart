import 'dart:io';
import 'package:avis_pos/core/components/buttons.dart';
import 'package:avis_pos/core/components/form_fields.dart';
import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/data/model/payloads/cart_item_payload/cart_item_payload.dart';
import 'package:avis_pos/data/model/payloads/quick_checkout_payload/quick_checkout_payload.dart';
import 'package:avis_pos/data/model/payloads/open_bill_payload/open_bill_payload.dart';
import 'package:avis_pos/data/model/responses/member_model/member_model.dart';
import 'package:avis_pos/data/model/responses/member_voucher_model/member_voucher_model.dart';
import 'package:avis_pos/data/model/responses/order_model/order_model.dart';
import 'package:avis_pos/presentation/home/bloc/cart/cart_bloc.dart';
import 'package:avis_pos/presentation/home/pages/payment_camera_page.dart';
import 'package:avis_pos/presentation/home/widgets/table_map_picker.dart';
import 'package:avis_pos/presentation/member/bloc/member/member_bloc.dart';
import 'package:avis_pos/presentation/open_bill/bloc/open_bill/open_bill_bloc.dart';
import 'package:avis_pos/presentation/settings/bloc/printer/printer_bloc.dart';
import 'package:avis_pos/presentation/settings/bloc/table/table_bloc.dart';
import 'package:avis_pos/core/services/printer_service.dart';
import 'package:avis_pos/presentation/open_bill/pages/qr_scanner_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class _CurrencyFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) return newValue;
    final intValue = int.tryParse(
      newValue.text.replaceAll(RegExp(r'[^0-9]'), ''),
    );
    if (intValue == null) return oldValue;
    final newString = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(intValue);
    return TextEditingValue(
      text: newString,
      selection: TextSelection.collapsed(offset: newString.length),
    );
  }
}

class PaymentModal extends StatefulWidget {
  final double subtotal;
  final double tax;
  final double discount;
  final List<dynamic> cartItems;
  final List<String> appliedPromos;

  const PaymentModal({
    super.key,
    required this.subtotal,
    required this.tax,
    required this.discount,
    required this.cartItems,
    this.appliedPromos = const [],
  });

  @override
  State<PaymentModal> createState() => _PaymentModalState();
}

class _PaymentModalState extends State<PaymentModal> {
  final TextEditingController _amountPaidController = TextEditingController();
  final TextEditingController _guestNameController = TextEditingController();

  String _orderType = 'Takeaway';
  String _paymentMethod = 'cash';

  int? _selectedTableId;
  String? _selectedTableCode;
  bool _isContextLocked = false;

  File? _proofImage;

  int? _selectedMemberId;
  String? _selectedMemberName;
  MemberVoucherModel? _appliedVoucher;
  String? _ignoredVoucherName;

  bool _usePoints = false;
  int _memberPoints = 0;
  String _memberTier = 'Basic';
  String? _memberLastVisit;
  String? _memberFavorite;
  double _memberTotalSpend = 0.0;

  bool _isSuccess = false;
  OrderModel? _completedOrder;
  double _finalAmountPaid = 0;
  double _submittedAmountPaid = 0;

  final currencyFormatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  @override
  void initState() {
    super.initState();
    _amountPaidController.addListener(() {
      setState(() {});
    });
    context.read<TableBloc>().add(const TableEvent.fetch());

    final cartState = context.read<CartBloc>().state;
    cartState.maybeWhen(
      loaded:
          (
            items,
            subtotal,
            discount,
            tax,
            promos,
            ignored,
            tableNumber,
            activeOrder,
            cartOrderType,
            cartCustomerName,
          ) {
            // 1. Set Table
            if (tableNumber != null) {
              _selectedTableCode = tableNumber;
              _isContextLocked = true;
            }

            // 2. Handle State jika ada activeOrder (Tagihan Aktif / Open Bill)
            if (activeOrder != null) {
              String dbType = activeOrder.typeOrder ?? 'Open Bill';
              _orderType =
                  [
                    'Takeaway',
                    'Dine In',
                    'Open Bill',
                    'Reservasi',
                  ].contains(dbType)
                  ? dbType
                  : 'Open Bill';
              _selectedMemberId = activeOrder.memberId;

              _selectedMemberName = activeOrder.customerName ?? 'Guest';
              _guestNameController.text = activeOrder.customerName ?? '';

              if (activeOrder.member != null) {
                _selectedMemberName =
                    activeOrder.member!.name ?? _selectedMemberName;
                _memberPoints = activeOrder.member!.currentPoints ?? 0;
                _memberTier = activeOrder.member!.tier ?? 'Basic';
                _memberLastVisit = activeOrder.member!.lastVisit;
                _memberFavorite = activeOrder.member!.favoriteProduct;
                _memberTotalSpend = activeOrder.member!.totalSpend ?? 0.0;
              }

              if (_selectedMemberId != null &&
                  activeOrder.customerName != null &&
                  activeOrder.customerName != 'Guest') {
                context.read<MemberBloc>().add(
                  MemberEvent.checkMember(activeOrder.customerName!),
                );
              }

              final cName = activeOrder.customerName ?? '';
              if (cName != 'Guest' && cName != _selectedMemberName) {
                _guestNameController.text = cName;
              }
            } else {
              // 3. Pesanan Baru (Belum ada activeOrder)
              _selectedMemberId = null;

              // 🔥 BACA MURNI DARI CART STATE, Tanpa lagi menebak status fisik meja!
              // Jika kasir mengklik "Tambah Pesanan", isinya PASTI "Dine In"
              // Jika kasir mengklik "Isi Pesanan Reservasi", isinya PASTI "Reservasi"
              _orderType = cartOrderType ?? 'Dine In';
              _guestNameController.text = cartCustomerName ?? '';
            }
          },
      orElse: () {},
    );
  }

  @override
  void dispose() {
    _amountPaidController.dispose();
    _guestNameController.dispose();
    super.dispose();
  }

  double _calculateTotalDiscount(double baseDiscount, double currentSubtotal) {
    double discount = baseDiscount;
    if (_appliedVoucher != null) {
      double minPurchase =
          double.tryParse(_appliedVoucher!.minPurchase.toString()) ?? 0;
      if (currentSubtotal >= minPurchase) {
        double discVal =
            double.tryParse(_appliedVoucher!.discountValue.toString()) ?? 0;
        if (_appliedVoucher!.discountType == 'percent' ||
            _appliedVoucher!.discountType == 'percentage') {
          discount += currentSubtotal * (discVal / 100);
        } else {
          discount += discVal;
        }
      }
    }
    return discount;
  }

  Future<void> _takePicture() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Scaffold(body: PaymentCameraPage()),
      ),
    );
    if (result != null && mounted) {
      setState(() {
        _proofImage = result is File ? result : File(result as String);
      });
    }
  }

  void _submitQuickCheckout(
    double grandTotal,
    List<dynamic> currentCartItems,
    List<String> currentIgnoredRules,
  ) {
    double amountPaid = grandTotal;

    if (_paymentMethod == 'cash') {
      amountPaid =
          double.tryParse(
            _amountPaidController.text.replaceAll(RegExp(r'[^0-9]'), ''),
          ) ??
          0;
      if (amountPaid < grandTotal) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Nominal uang tunai kurang!'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
    }

    if (_paymentMethod == 'qris' && _proofImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Wajib melampirkan foto bukti pembayaran QRIS!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _submittedAmountPaid = amountPaid;
    });

    List<String> finalIgnoredRules = List.from(currentIgnoredRules);
    if (_ignoredVoucherName != null)
      finalIgnoredRules.add(_ignoredVoucherName!);

    final payload = QuickCheckoutPayload(
      typeOrder: _orderType,
      tableId: _orderType == 'Dine In' ? _selectedTableId : null,
      tableNumber: _orderType == 'Dine In' ? _selectedTableCode : null,
      paymentMethod: _paymentMethod,
      amountPaid: amountPaid,
      items: currentCartItems.cast(),
      memberId: _selectedMemberId,
      usePoints: _usePoints,
      promoCodeInput: null,
      ignoredRules: finalIgnoredRules,
      customerName: _selectedMemberId != null
          ? _selectedMemberName
          : (_guestNameController.text.isNotEmpty
                ? _guestNameController.text
                : 'Guest'),
    );

    context.read<CartBloc>().add(CartEvent.checkout(payload));
  }

  void _submitOpenBill(
    List<dynamic> currentCartItems,
    List<String> currentIgnoredRules,
  ) {
    if (_selectedTableCode == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pilih meja terlebih dahulu untuk Open Bill!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Ambil context meja yang sedang aktif
    final cartState = context.read<CartBloc>().state;
    OrderModel? activeOrder;
    cartState.maybeWhen(
      loaded:
          (
            _,
            __,
            ___,
            ____,
            _____,
            ______,
            _______,
            order,
            ________,
            _________,
          ) => activeOrder = order,
      orElse: () {},
    );

    final itemsPayload = currentCartItems.whereType<CartItemPayload>().toList();

    if (activeOrder != null) {
      context.read<OpenBillBloc>().add(
        OpenBillEvent.addItemsToBill(activeOrder!.id, itemsPayload),
      );
    } else {
      final payload = OpenBillPayload(
        typeOrder: _orderType,
        tableNumber: _selectedTableCode,
        customerName: _selectedMemberId != null
            ? _selectedMemberName
            : (_guestNameController.text.isNotEmpty
                  ? _guestNameController.text
                  : 'Guest'),
        memberId: _selectedMemberId,
        items: itemsPayload,
      );
      context.read<OpenBillBloc>().add(OpenBillEvent.createOpenBill(payload));
    }

    context.read<TableBloc>().add(const TableEvent.fetch());
    context.read<CartBloc>().add(const CartEvent.clearCart());
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Open Bill berhasil disimpan / diperbarui!'),
        backgroundColor: Colors.green,
      ),
    );
  }
  // void _submitOpenBill(
  //   List<dynamic> currentCartItems,
  //   List<String> currentIgnoredRules,
  // ) {
  //   if (_selectedTableCode == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('Pilih meja terlebih dahulu untuk Open Bill!'),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //     return;
  //   }

  //   final payload = OpenBillPayload(
  //     typeOrder: _orderType,
  //     tableNumber: _selectedTableCode,
  //     customerName: _selectedMemberId != null
  //         ? _selectedMemberName
  //         : (_guestNameController.text.isNotEmpty
  //               ? _guestNameController.text
  //               : 'Guest'),
  //     memberId: _selectedMemberId,
  //     items: currentCartItems.whereType<CartItemPayload>().toList(),
  //   );

  //   context.read<OpenBillBloc>().add(OpenBillEvent.createOpenBill(payload));
  //   context.read<TableBloc>().add(const TableEvent.fetch());
  //   context.read<CartBloc>().add(const CartEvent.clearCart());
  //   Navigator.pop(context);

  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(
  //       content: Text('Open Bill berhasil disimpan / diperbarui!'),
  //       backgroundColor: Colors.green,
  //     ),
  //   );
  // }

  Future<void> _executePrint(OrderModel order, double amountPaid) async {
    try {
      final printerState = context.read<PrinterBloc>().state;
      final ps = PrinterService();
      printerState.maybeWhen(
        loaded: (printerData) async {
          final receiptPrinter = printerData.defaultPrinter;
          final labelPrinter = printerData.allPrinters?.firstWhere(
            (p) =>
                p.name!.toLowerCase().contains('label') ||
                p.name!.toLowerCase().contains('stiker'),
            orElse: () => printerData.defaultPrinter!,
          );
          if (receiptPrinter != null) {
            try {
              await ps.printReceipt(
                receiptPrinter,
                order,
                amountPaid: amountPaid,
              );
              await ps.printChecker(receiptPrinter, order);
            } catch (e) {}
          }
          if (labelPrinter != null) {
            try {
              await ps.printCupLabel(labelPrinter, order);
            } catch (e) {}
          }
        },
        orElse: () {},
      );
    } catch (e) {}
  }

  void _showMemberSearchDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (dialogContext) {
        String searchInput = '';
        return AlertDialog(
          title: const Text('Cari / Scan Member'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'No. HP atau Kode',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      ),
                      onChanged: (val) => searchInput = val,
                      autofocus: true,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.qr_code_scanner,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        final code = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const QRScannerPage(),
                          ),
                        );
                        if (code != null && context.mounted) {
                          context.read<MemberBloc>().add(
                            MemberEvent.checkMember(code),
                          );
                          // Hanya pop jika dialogContext masih valid dan ini bukan aksi yang membatalkan segalanya
                          if (Navigator.canPop(dialogContext)) {
                            Navigator.pop(dialogContext);
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),
              onPressed: () {
                if (searchInput.isNotEmpty) {
                  context.read<MemberBloc>().add(
                    MemberEvent.checkMember(searchInput),
                  );
                  // Tutup dialog agar dihandle listener utama
                  if (Navigator.canPop(dialogContext)) {
                    Navigator.pop(dialogContext);
                  }
                }
              },
              child: const Text(
                'Cek Member',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // ✅ FIX 3: MultiBlocListener Pindah ke Level Teratas agar Silent Fetch berjalan sempurna!
    return MultiBlocListener(
      listeners: [
        BlocListener<CartBloc, CartState>(
          listener: (context, state) {
            state.maybeWhen(
              checkoutSuccess: (order) {
                setState(() {
                  _isSuccess = true;
                  _completedOrder = order;
                  final safeTotalPrice = order.totalPrice ?? 0.0;
                  _finalAmountPaid = _paymentMethod == 'cash'
                      ? (_submittedAmountPaid > safeTotalPrice
                            ? _submittedAmountPaid
                            : safeTotalPrice)
                      : safeTotalPrice;
                });
                _executePrint(order, _finalAmountPaid);
              },
              error: (msg) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(msg), backgroundColor: Colors.red),
              ),
              orElse: () {},
            );
          },
        ),
        // ✅ Listener MemberBloc mendengarkan dari Background (Silent Fetch)
        BlocListener<MemberBloc, MemberState>(
          listener: (context, state) {
            state.maybeWhen(
              memberFound: (member) {
                setState(() {
                  _selectedMemberId = member.id;
                  _selectedMemberName = member.name;
                  _memberPoints = member.currentPoints ?? 0;
                  _memberTier = member.tier ?? 'Basic';
                  _memberLastVisit = member.lastVisit;
                  _memberFavorite = member.favoriteProduct;
                  _memberTotalSpend = member.totalSpend ?? 0.0;
                  _usePoints = false;
                  _ignoredVoucherName = null;
                  _appliedVoucher = null;

                  if (member.vouchers.isNotEmpty) {
                    for (var v in member.vouchers) {
                      bool isUsed = false;
                      if (v.isUsed == true || v.isUsed == 1 || v.isUsed == '1')
                        isUsed = true;
                      if (!isUsed) {
                        _appliedVoucher = v;
                        break;
                      }
                    }
                    if (_appliedVoucher != null)
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Member $_memberTier! Promo otomatis diterapkan.',
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                  }
                });
              },
              error: (msg) {
                // Jika auto-fetch gagal, jangan crashkan UI.
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (_isSuccess && _completedOrder != null)
            return _buildSuccessScreen();
          bool isLoading = false;

          double currentSubtotal = widget.subtotal,
              currentTax = widget.tax,
              currentDiscount = widget.discount;
          List<String> currentAppliedPromos = List.from(widget.appliedPromos);
          List<dynamic> currentCartItems = List.from(widget.cartItems);
          List<String> currentIgnoredRules = [];

          state.maybeWhen(
            loading: () => isLoading = true,
            loaded:
                (
                  items,
                  subtotal,
                  discount,
                  tax,
                  appliedPromos,
                  ignoredRules,
                  tableNumber,
                  activeOrder,
                  _cartOrderType,
                  _cartCustomerName,
                ) {
                  currentSubtotal = subtotal;
                  currentTax = tax;
                  currentDiscount = discount;
                  currentAppliedPromos = List.from(appliedPromos);
                  currentCartItems = List.from(items);
                  currentIgnoredRules = List.from(ignoredRules);
                },
            orElse: () {},
          );

          final double totalDiscount = _calculateTotalDiscount(
            currentDiscount,
            currentSubtotal,
          );
          double baseTotal = currentSubtotal + currentTax - totalDiscount;
          double pointsDiscount = 0;
          if (_usePoints && _memberPoints > 0) {
            pointsDiscount = _memberPoints.toDouble();
            if (pointsDiscount > baseTotal) pointsDiscount = baseTotal;
          }
          double grandTotal = baseTotal - pointsDiscount;
          if (grandTotal < 0) grandTotal = 0;
          final double inputAmount =
              double.tryParse(
                _amountPaidController.text.replaceAll(RegExp(r'[^0-9]'), ''),
              ) ??
              0;
          final double changeAmount = inputAmount > grandTotal
              ? inputAmount - grandTotal
              : 0;

          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: SingleChildScrollView(
              child: Container(
                width: 850,
                padding: const EdgeInsets.all(32),
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Selesaikan Pembayaran',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close, color: Colors.grey),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                        const Divider(height: 32),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Tipe Pesanan',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),

                                  Row(
                                    children: [
                                      _orderTypeChip('Takeaway'),
                                      const SizedBox(width: 8),
                                      _orderTypeChip('Dine In'),
                                      const SizedBox(width: 8),
                                      _orderTypeChip('Open Bill'),
                                    ],
                                  ),

                                  if (_orderType == 'Dine In' ||
                                      _orderType == 'Open Bill') ...[
                                    const SizedBox(height: 16),
                                    const Text(
                                      'Pilih Meja',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),

                                    const SizedBox(height: 16),
                                    const Text(
                                      'Pemilihan Meja',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),

                                    BlocBuilder<TableBloc, TableState>(
                                      builder: (context, tableState) {
                                        return tableState.maybeWhen(
                                          loaded: (tables, _) {
                                            // Fallback pencocokan ID
                                            if (_selectedTableId == null &&
                                                _selectedTableCode != null) {
                                              try {
                                                _selectedTableId = tables
                                                    .firstWhere(
                                                      (t) =>
                                                          t.code ==
                                                          _selectedTableCode,
                                                    )
                                                    .id;
                                              } catch (_) {}
                                            }

                                            return InkWell(
                                              onTap: _isContextLocked
                                                  ? null
                                                  : () {
                                                      // --- BUKA MODAL CINEMA SEAT ---
                                                      showDialog(
                                                        barrierDismissible:
                                                            false,
                                                        context: context,
                                                        builder: (dialogContext) => AlertDialog(
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  24,
                                                                ),
                                                          ),
                                                          title: const Text(
                                                            'Pilih Meja Pelanggan',
                                                          ),
                                                          content: TableMapPicker(
                                                            tables: tables,
                                                            selectedTableId:
                                                                _selectedTableId,
                                                            onTableSelected: (table) {
                                                              if (table !=
                                                                  null) {
                                                                // Jika meja sedang terisi, beri peringatan atau tetap izinkan (tergantung kebutuhan bisnis)
                                                                if (table.isOccupied ==
                                                                        true &&
                                                                    table.id !=
                                                                        _selectedTableId) {
                                                                  ScaffoldMessenger.of(
                                                                    context,
                                                                  ).showSnackBar(
                                                                    const SnackBar(
                                                                      content: Text(
                                                                        'Perhatian: Meja ini sedang terisi!',
                                                                      ),
                                                                    ),
                                                                  );
                                                                }

                                                                setState(() {
                                                                  _selectedTableId =
                                                                      table.id;
                                                                  _selectedTableCode =
                                                                      table
                                                                          .code;
                                                                });
                                                                Navigator.pop(
                                                                  dialogContext,
                                                                ); // Tutup modal setelah pilih
                                                              }
                                                            },
                                                          ),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  _selectedTableId =
                                                                      null;
                                                                  _selectedTableCode =
                                                                      null;
                                                                });
                                                                Navigator.pop(
                                                                  dialogContext,
                                                                );
                                                              },
                                                              child: const Text(
                                                                'Hapus Pilihan (Tanpa Meja)',
                                                                style: TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                ),
                                                              ),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                    dialogContext,
                                                                  ),
                                                              child: const Text(
                                                                'Tutup',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                              child: Container(
                                                padding: const EdgeInsets.all(
                                                  16,
                                                ),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: AppColors.stroke,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color: _isContextLocked
                                                      ? Colors.grey.shade100
                                                      : Colors.white,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.grid_view_rounded,
                                                      color:
                                                          _selectedTableCode !=
                                                              null
                                                          ? AppColors.primary
                                                          : Colors.grey,
                                                    ),
                                                    const SizedBox(width: 12),
                                                    Expanded(
                                                      child: Text(
                                                        _selectedTableCode !=
                                                                null
                                                            ? 'Meja: $_selectedTableCode'
                                                            : 'Ketuk untuk Pilih Meja (Opsional)',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              _selectedTableCode !=
                                                                  null
                                                              ? FontWeight.bold
                                                              : FontWeight
                                                                    .normal,
                                                          color:
                                                              _selectedTableCode !=
                                                                  null
                                                              ? Colors.black87
                                                              : Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                    if (!_isContextLocked)
                                                      const Icon(
                                                        Icons.chevron_right,
                                                        color: Colors.grey,
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          orElse: () =>
                                              const LinearProgressIndicator(),
                                        );
                                      },
                                    ),
                                  ],

                                  const SizedBox(height: 24),
                                  const Text(
                                    'Pelanggan & Promo',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  _selectedMemberId != null
                                      ? Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 12,
                                            horizontal: 16,
                                          ),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: AppColors.primary,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.account_circle,
                                                color: AppColors.primary,
                                                size: 28,
                                              ),
                                              const SizedBox(width: 12),
                                              // ✅ FIX 4: Hapus operator "!" yang berbahaya. Pakai fallback ??
                                              Expanded(
                                                child: Text(
                                                  _selectedMemberName ??
                                                      'Member',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color:
                                                        AppColors.primaryDark,
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () => setState(() {
                                                  _selectedMemberId = null;
                                                  _selectedMemberName = null;
                                                  _appliedVoucher = null;
                                                  _memberPoints = 0;
                                                  _memberLastVisit = null;
                                                  _memberFavorite = null;
                                                  _memberTotalSpend = 0.0;
                                                  _ignoredVoucherName = null;
                                                  _usePoints = false;
                                                }),
                                                child: Icon(
                                                  Icons.cancel,
                                                  size: 24,
                                                  color: Colors.red.shade400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : SizedBox(
                                          width: double.infinity,
                                          child: OutlinedButton.icon(
                                            icon: const Icon(
                                              Icons.person_add_alt_1,
                                              color: Colors.black87,
                                              size: 20,
                                            ),
                                            label: const Text(
                                              'Pilih Member',
                                              style: TextStyle(
                                                color: Colors.black87,
                                              ),
                                            ),
                                            style: OutlinedButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    vertical: 14,
                                                  ),
                                              side: const BorderSide(
                                                color: AppColors.stroke,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                            onPressed: _showMemberSearchDialog,
                                          ),
                                        ),

                                  if (_selectedMemberId != null)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: Wrap(
                                        spacing: 8,
                                        runSpacing: 8,
                                        children: [
                                          _buildCrmBadge(
                                            Icons.workspace_premium,
                                            'Tier: $_memberTier',
                                            Colors.orange,
                                          ),
                                          _buildCrmBadge(
                                            Icons.favorite,
                                            'Fav: ${_memberFavorite ?? '-'}',
                                            Colors.pink,
                                          ),
                                          _buildCrmBadge(
                                            Icons.history,
                                            'Visit: ${_memberLastVisit ?? '-'}',
                                            Colors.blue,
                                          ),
                                          _buildCrmBadge(
                                            Icons.monetization_on,
                                            'Spend: ${currencyFormatter.format(_memberTotalSpend)}',
                                            Colors.green,
                                          ),
                                        ],
                                      ),
                                    ),

                                  if (_selectedMemberId == null) ...[
                                    const SizedBox(height: 12),
                                    AppTextField(
                                      label: 'Nama Customer',
                                      hint: 'Ketik nama customer...',
                                      controller: _guestNameController,
                                      prefixIcon: const Icon(
                                        Icons.person_outline,
                                      ),
                                      // 👇 Kunci field jika sedang Tambah Pesanan (Open Bill aktif)
                                      readOnly:
                                          _isContextLocked &&
                                          context
                                              .read<CartBloc>()
                                              .state
                                              .maybeWhen(
                                                loaded:
                                                    (
                                                      _,
                                                      __,
                                                      ___,
                                                      ____,
                                                      _____,
                                                      ______,
                                                      _______,
                                                      activeOrder,
                                                      ________,
                                                      _________,
                                                    ) => activeOrder != null,
                                                orElse: () => false,
                                              ),
                                    ),
                                  ],

                                  if (_selectedMemberId != null &&
                                      _memberPoints > 0)
                                    Container(
                                      margin: const EdgeInsets.only(top: 16),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade50,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: Colors.blue.shade200,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.stars,
                                                color: Colors.blue.shade700,
                                                size: 28,
                                              ),
                                              const SizedBox(width: 12),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Tukarkan Poin',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Colors.blue.shade900,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Saldo: ${currencyFormatter.format(_memberPoints)} pts',
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      color:
                                                          Colors.blue.shade800,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Switch(
                                            value: _usePoints,
                                            activeColor: Colors.blue.shade700,
                                            onChanged: (val) {
                                              setState(() {
                                                _usePoints = val;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),

                                  if (currentAppliedPromos.isNotEmpty ||
                                      _appliedVoucher != null)
                                    Container(
                                      margin: const EdgeInsets.only(top: 16),
                                      padding: const EdgeInsets.all(12),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.green.shade50,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: Colors.green.shade200,
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.check_circle,
                                                size: 16,
                                                color: Colors.green.shade700,
                                              ),
                                              const SizedBox(width: 6),
                                              Text(
                                                'Promo Diterapkan:',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green.shade800,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 12),
                                          Wrap(
                                            spacing: 8,
                                            runSpacing: 8,
                                            children: [
                                              ...currentAppliedPromos
                                                  .map(
                                                    (promoName) => InputChip(
                                                      label: Text(
                                                        promoName
                                                            .toUpperCase()
                                                            .replaceAll(
                                                              '_',
                                                              ' ',
                                                            ),
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                          color: Colors
                                                              .green
                                                              .shade900,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      backgroundColor:
                                                          Colors.green.shade100,
                                                      deleteIconColor:
                                                          Colors.green.shade900,
                                                      side: BorderSide(
                                                        color: Colors
                                                            .green
                                                            .shade300,
                                                      ),
                                                      onDeleted: () {
                                                        context
                                                            .read<CartBloc>()
                                                            .add(
                                                              CartEvent.ignorePromo(
                                                                promoName,
                                                              ),
                                                            );
                                                      },
                                                    ),
                                                  )
                                                  .toList(),
                                              if (_appliedVoucher != null)
                                                InputChip(
                                                  label: Text(
                                                    _appliedVoucher!.name
                                                        .toUpperCase(),
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors
                                                          .orange
                                                          .shade900,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  backgroundColor:
                                                      Colors.orange.shade100,
                                                  deleteIconColor:
                                                      Colors.orange.shade900,
                                                  side: BorderSide(
                                                    color:
                                                        Colors.orange.shade300,
                                                  ),
                                                  onDeleted: () {
                                                    setState(() {
                                                      _ignoredVoucherName =
                                                          _appliedVoucher!.name;
                                                      _appliedVoucher = null;
                                                    });
                                                  },
                                                ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                  const SizedBox(height: 24),
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: AppColors.stroke,
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        _summaryRow(
                                          'Subtotal',
                                          currentSubtotal,
                                        ),
                                        if (_appliedVoucher != null &&
                                            currentSubtotal <
                                                (double.tryParse(
                                                      _appliedVoucher!
                                                          .minPurchase
                                                          .toString(),
                                                    ) ??
                                                    0))
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 4,
                                            ),
                                            child: Text(
                                              'Minimal belanja ${_appliedVoucher!.minPurchase} untuk voucher ini!',
                                              style: const TextStyle(
                                                color: Colors.red,
                                                fontSize: 10,
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                          ),
                                        if (totalDiscount > 0)
                                          _summaryRow(
                                            'Diskon Tambahan',
                                            -totalDiscount,
                                            isRed: true,
                                          ),
                                        _summaryRow('Pajak (PB1)', currentTax),
                                        if (pointsDiscount > 0)
                                          _summaryRow(
                                            'Tukar Poin',
                                            -pointsDiscount,
                                            isRed: true,
                                            colorOverride: Colors.blue.shade700,
                                          ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 8,
                                          ),
                                          child: Divider(),
                                        ),
                                        _summaryRow(
                                          'GRAND TOTAL',
                                          grandTotal,
                                          isBold: true,
                                          fontSize: 18,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 32),

                            // --- PANEL KANAN ---
                            Expanded(
                              flex: 1,
                              child:
                                  (_orderType == 'Open Bill' ||
                                      _orderType == 'Reservasi')
                                  ? _buildOpenBillRightPanel(
                                      currentCartItems,
                                      currentIgnoredRules,
                                      isLoading,
                                    )
                                  : _buildPaymentRightPanel(
                                      grandTotal,
                                      changeAmount,
                                      currentCartItems,
                                      currentIgnoredRules,
                                      isLoading,
                                    ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (isLoading)
                      Positioned.fill(
                        child: Container(
                          color: Colors.white.withOpacity(0.5),
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),

                    // Indikator Loading Background Fetch CRM
                    BlocBuilder<MemberBloc, MemberState>(
                      builder: (context, memberState) {
                        final isMemberLoading = memberState.maybeWhen(
                          loading: () => true,
                          orElse: () => false,
                        );
                        if (isMemberLoading) {
                          return Positioned(
                            top: 16,
                            right: 16,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 12,
                                  height: 12,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Memuat CRM...',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPaymentRightPanel(
    double grandTotal,
    double changeAmount,
    List<dynamic> currentCartItems,
    List<String> currentIgnoredRules,
    bool isLoading,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Metode Pembayaran',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _paymentMethodCard('cash', 'Tunai', Icons.money),
            _paymentMethodCard('qris', 'QRIS', Icons.qr_code_2),
            _paymentMethodCard('card', 'Kartu', Icons.credit_card),
            _paymentMethodCard('transfer', 'Transfer', Icons.account_balance),
          ],
        ),
        const SizedBox(height: 24),
        _buildDynamicPaymentInput(grandTotal, changeAmount),
        const SizedBox(height: 32),
        AppButton(
          label: isLoading ? 'Memproses...' : 'PROSES PEMBAYARAN',
          onPressed: isLoading
              ? () {}
              : () => _submitQuickCheckout(
                  grandTotal,
                  currentCartItems,
                  currentIgnoredRules,
                ),
        ),
      ],
    );
  }

  Widget _buildOpenBillRightPanel(
    List<dynamic> currentCartItems,
    List<String> currentIgnoredRules,
    bool isLoading,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Simpan Tagihan',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.blue.shade200),
          ),
          child: Column(
            children: [
              Icon(Icons.receipt_long, size: 64, color: Colors.blue.shade400),
              const SizedBox(height: 16),
              const Text(
                'Pesanan ini akan disimpan sebagai Open Bill. Pelanggan dapat menambah pesanan dan melakukan pembayaran di akhir melalui Table Management.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 48),
        AppButton(
          label: isLoading ? 'Menyimpan...' : 'SIMPAN TAGIHAN',
          color: Colors.blue.shade700,
          onPressed: isLoading
              ? () {}
              : () => _submitOpenBill(currentCartItems, currentIgnoredRules),
        ),
      ],
    );
  }

  Widget _buildSuccessScreen() {
    final order = _completedOrder!;
    final safeTotalPrice = order.totalPrice ?? 0.0;
    final double change = _finalAmountPaid > safeTotalPrice
        ? _finalAmountPaid - safeTotalPrice
        : 0;
    bool isCash = order.paymentMethod?.toLowerCase() == 'cash';

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 80),
            const SizedBox(height: 16),
            const Text(
              'Pembayaran Berhasil!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'No. Order: ${order.orderNumber}',
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Divider(thickness: 2),
            ),
            _buildInfoRow(
              'Total Tagihan',
              currencyFormatter.format(safeTotalPrice),
            ),
            const SizedBox(height: 8),
            _buildInfoRow(
              'Metode Pembayaran',
              order.paymentMethod?.toUpperCase() ?? 'CASH',
            ),
            if ((order.pointsRedeemed ?? 0) > 0) ...[
              const SizedBox(height: 8),
              _buildInfoRow(
                'Poin Digunakan',
                '- ${order.pointsRedeemed} Poin',
                valueColor: Colors.orange.shade800,
              ),
            ],
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isCash ? Colors.green.shade50 : Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isCash ? Colors.green.shade200 : Colors.blue.shade200,
                ),
              ),
              child: Column(
                children: [
                  _buildInfoRow(
                    isCash ? 'Uang Diterima' : 'Nominal Dibayar',
                    currencyFormatter.format(_finalAmountPaid),
                    isBold: true,
                  ),
                  if (isCash) ...[
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Divider(),
                    ),
                    _buildInfoRow(
                      'KEMBALIAN',
                      change > 0
                          ? currencyFormatter.format(change)
                          : 'Uang Pas',
                      isBold: true,
                      valueSize: 24,
                      valueColor: change > 0
                          ? Colors.green.shade700
                          : Colors.black87,
                    ),
                  ] else ...[
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Divider(),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Status Tagihan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'LUNAS',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 24,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      _executePrint(order, _finalAmountPaid);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Mencetak ulang struk...'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.print),
                    label: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Cetak Struk',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(
                        color: AppColors.primary,
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, {
                        'order': order,
                        'amountPaid': _finalAmountPaid,
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Pesanan Baru',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCrmBadge(IconData icon, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: color.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    String label,
    String value, {
    bool isBold = false,
    double? valueSize,
    Color? valueColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: Colors.grey.shade700,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: valueSize ?? 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
            color: valueColor ?? Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildDynamicPaymentInput(double grandTotal, double changeAmount) {
    if (_paymentMethod == 'cash') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _amountPaidController,
            keyboardType: TextInputType.number,
            inputFormatters: [_CurrencyFormatter()],
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              labelText: 'Uang Diterima',
              hintText: 'Rp 0',
              prefixIcon: const Icon(
                Icons.payments,
                color: AppColors.primary,
                size: 28,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 16,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                const Text(
                  'KEMBALIAN',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(
                  currencyFormatter.format(changeAmount),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDark,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else if (_paymentMethod == 'qris') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.stroke, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.qr_code_2,
                size: 100,
                color: Colors.black87,
              ),
            ),
          ),
          const Text(
            'Bukti Pembayaran QRIS',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: _takePicture,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: _proofImage != null
                      ? AppColors.primary
                      : AppColors.stroke,
                  style: BorderStyle.solid,
                ),
              ),
              child: _proofImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(_proofImage!, fit: BoxFit.cover),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt,
                          size: 40,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Ambil Foto Bukti Transfer',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ],
                    ),
            ),
          ),
          if (_proofImage != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextButton.icon(
                onPressed: _takePicture,
                icon: const Icon(Icons.refresh, size: 16),
                label: const Text('Foto Ulang'),
                style: TextButton.styleFrom(foregroundColor: AppColors.primary),
              ),
            ),
        ],
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(24),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.orange.shade50,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.orange.shade200),
        ),
        child: Column(
          children: [
            Icon(
              _paymentMethod == 'card'
                  ? Icons.credit_card
                  : Icons.account_balance,
              size: 40,
              color: Colors.orange,
            ),
            const SizedBox(height: 12),
            Text(
              'Pembayaran via ${_paymentMethod == 'card' ? 'Mesin EDC' : 'Transfer Bank'}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Pastikan pelanggan telah membayar sejumlah\n${currencyFormatter.format(grandTotal)}',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ],
        ),
      );
    }
  }

  Widget _orderTypeChip(String type) {
    return ChoiceChip(
      label: Text(type),
      selected: _orderType == type,
      // 🔥 KUNCI PERBAIKAN: Hapus pembatasan _isContextLocked.
      // Biarkan kasir BEBAS memilih tipe "Dine In" atau "Reservasi" kapan saja!
      onSelected: (val) {
        setState(() {
          _orderType = type;
        });
      },
      selectedColor: AppColors.primary,
      labelStyle: TextStyle(
        color: _orderType == type ? Colors.white : Colors.black,
      ),
    );
  }

  // Widget _orderTypeChip(String type) {
  //   return ChoiceChip(
  //     label: Text(type),
  //     selected: _orderType == type,
  //     onSelected: _isContextLocked
  //         ? null
  //         : (val) => setState(() => _orderType = type),
  //     selectedColor: AppColors.primary,
  //     labelStyle: TextStyle(
  //       color: _orderType == type
  //           ? Colors.white
  //           : (_isContextLocked ? Colors.grey : Colors.black),
  //     ),
  //   );
  // }

  Widget _paymentMethodCard(String value, String title, IconData icon) {
    final isSelected = _paymentMethod == value;
    return InkWell(
      onTap: () => setState(() {
        _paymentMethod = value;
        if (value != 'qris') _proofImage = null;
      }),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 85,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryLight : AppColors.background,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.stroke,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.primary : Colors.grey.shade500,
              size: 24,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: isSelected
                    ? AppColors.primaryDark
                    : Colors.grey.shade600,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryRow(
    String label,
    double value, {
    bool isRed = false,
    bool isBold = false,
    double fontSize = 14,
    Color? colorOverride,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: fontSize)),
          Text(
            currencyFormatter.format(value),
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: colorOverride ?? (isRed ? Colors.red : Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
