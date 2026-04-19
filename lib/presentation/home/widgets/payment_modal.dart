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
  final TextEditingController _guestCountController = TextEditingController(
    text: '1',
  ); // TAMBAHAN: Untuk kapasitas pax

  String _orderType = 'Takeaway';
  String _paymentMethod = 'cash';

  int? _selectedTableId;
  String? _selectedTableCode;
  int?
  _selectedTableCapacity; // TAMBAHAN: Menyimpan kapasitas meja yang dipilih
  bool _isContextLocked = false;

  File? _proofImage;

  int? _selectedMemberId;
  String? _selectedMemberName;
  MemberVoucherModel? _appliedVoucher;
  String? _ignoredVoucherName;

  bool _usePoints = false;
  double _memberPoints = 0;
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
            if (tableNumber != null) {
              _selectedTableCode = tableNumber;
              _isContextLocked = true;

              final tableState = context.read<TableBloc>().state;
              tableState.maybeWhen(
                loaded: (tables, _) {
                  try {
                    final t = tables.firstWhere(
                      (tbl) => tbl.code == tableNumber,
                    );
                    _selectedTableId = t.id;
                    _selectedTableCapacity = t.capacity;
                  } catch (_) {}
                },
                orElse: () {},
              );
            }

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
              _guestCountController.text = (activeOrder.guestCount ?? 1)
                  .toString();

              if (activeOrder.member != null) {
                _selectedMemberName =
                    activeOrder.member!.name ?? _selectedMemberName;
                _memberPoints = activeOrder.member!.currentPoints ?? 0.0;
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
              _selectedMemberId = null;
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
    _guestCountController.dispose();
    super.dispose();
  }

  // =========================================================================
  // MODAL CINEMA SEAT PICKER
  // =========================================================================
  void _showCinemaTablePicker(BuildContext context) {
    final int currentGuestCount = int.tryParse(_guestCountController.text) ?? 1;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (modalContext) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.75,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Pilih Meja (Cinema Seat)",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(modalContext),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<TableBloc, TableState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loaded: (tables, _) {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 1.0,
                              ),
                          itemCount: tables.length,
                          itemBuilder: (context, index) {
                            final table = tables[index];

                            // Visual State Logic (Synced with 4-State Logic)
                            final bool isOccupiedFisik =
                                table.isOccupied ?? false;
                            final String resStatus =
                                table.reservationStatus?.toLowerCase() ?? '';
                            final bool isReserved =
                                resStatus == 'booked' || resStatus == 'seated';
                            final bool hasActiveOrder =
                                (table.activeOrderId != null &&
                                table.activeOrderId! > 0);

                            Color cardColor = Colors.white;
                            Color borderColor = Colors.green.shade300;
                            Color textColor = Colors.green.shade700;
                            String badgeText = 'AVAIL';

                            if (hasActiveOrder) {
                              cardColor = Colors.red.shade50;
                              borderColor = Colors.red.shade300;
                              badgeText = 'OPEN';
                              textColor = Colors.red.shade700;
                            } else if (isOccupiedFisik && !isReserved) {
                              cardColor = Colors.blue.shade50;
                              borderColor = Colors.blue.shade300;
                              badgeText = 'LUNAS';
                              textColor = Colors.blue.shade700;
                            } else if (isReserved) {
                              cardColor = Colors.orange.shade50;
                              borderColor = Colors.orange.shade300;
                              badgeText = 'RSVD';
                              textColor = Colors.orange.shade700;
                            }

                            final bool isSelected =
                                _selectedTableCode == table.code;

                            return InkWell(
                              onTap: () {
                                // --- VALIDASI KAPASITAS ---
                                if (table.capacity != null &&
                                    currentGuestCount > table.capacity!) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Meja ${table.code} kapasitasnya hanya ${table.capacity} pax!',
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }

                                // --- VALIDASI MEJA TERSEDIA ---
                                if (badgeText != 'AVAIL' && !isSelected) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Meja ${table.code} sedang berstatus $badgeText.',
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }

                                setState(() {
                                  _selectedTableCode = table.code;
                                  _selectedTableId = table.id;
                                  _selectedTableCapacity = table.capacity;
                                });
                                Navigator.pop(modalContext);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColors.primary
                                      : cardColor,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: isSelected
                                        ? AppColors.primaryDark
                                        : borderColor,
                                    width: isSelected ? 3 : 1,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      table.code,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black87,
                                      ),
                                    ),
                                    Text(
                                      "${table.capacity ?? 0} Pax",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: isSelected
                                            ? Colors.white70
                                            : Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      badgeText,
                                      style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.bold,
                                        color: isSelected
                                            ? Colors.white
                                            : textColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      orElse: () =>
                          const Center(child: CircularProgressIndicator()),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
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
    final int currentGuestCount = int.tryParse(_guestCountController.text) ?? 1;

    // VALIDASI KAPASITAS AKHIR SEBELUM SUBMIT
    if (['Dine In', 'Reservasi', 'Open Bill'].contains(_orderType)) {
      if (_selectedTableCapacity != null &&
          currentGuestCount > _selectedTableCapacity!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Gagal! Jumlah tamu ($currentGuestCount) melebihi kapasitas Meja $_selectedTableCode ($_selectedTableCapacity pax).',
            ),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
    }

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

    if (['qris', 'card', 'transfer'].contains(_paymentMethod) &&
        _proofImage == null) {
      String label = 'pembayaran';
      if (_paymentMethod == 'qris') label = 'QRIS';
      if (_paymentMethod == 'card') label = 'Kartu (EDC)';
      if (_paymentMethod == 'transfer') label = 'Transfer';

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Wajib melampirkan foto bukti $label!'),
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
      tableId: ['Dine In', 'Reservasi', 'Open Bill'].contains(_orderType)
          ? _selectedTableId
          : null,
      tableNumber: ['Dine In', 'Reservasi', 'Open Bill'].contains(_orderType)
          ? _selectedTableCode
          : null,
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

    final int currentGuestCount = int.tryParse(_guestCountController.text) ?? 1;

    // VALIDASI KAPASITAS AKHIR SEBELUM SUBMIT
    if (_selectedTableCapacity != null &&
        currentGuestCount > _selectedTableCapacity!) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Gagal! Jumlah tamu ($currentGuestCount) melebihi kapasitas Meja $_selectedTableCode ($_selectedTableCapacity pax).',
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

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
        guestCount: currentGuestCount, // TAMBAHAN: Menyertakan guest count
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
        BlocListener<MemberBloc, MemberState>(
          listener: (context, state) {
            state.maybeWhen(
              memberFound: (member) {
                setState(() {
                  _selectedMemberId = member.id;
                  _selectedMemberName = member.name;
                  _memberPoints = member.currentPoints ?? 0.0;
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
        BlocListener<TableBloc, TableState>(
          listener: (context, state) {
            state.maybeWhen(
              loaded: (tables, _) {
                if (_selectedTableCode != null && _selectedTableId == null) {
                  setState(() {
                    try {
                      final t = tables.firstWhere(
                        (tbl) => tbl.code == _selectedTableCode,
                      );
                      _selectedTableId = t.id;
                      _selectedTableCapacity = t.capacity;
                    } catch (_) {}
                  });
                }
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
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 850,
                maxHeight: MediaQuery.of(context).size.height * 0.9,
              ),
              child: SingleChildScrollView(
                child: Padding(
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
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.grey,
                                ),
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

                                    // --- FIX 1: Menggunakan Wrap agar tidak Overflow di layar kecil ---
                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: [
                                        _orderTypeChip('Takeaway'),
                                        _orderTypeChip('Dine In'),
                                        _orderTypeChip('Open Bill'),
                                        _orderTypeChip('Reservasi'),
                                      ],
                                    ),

                                    // --- FIX 2: Layout Cinema Seat & Input Kapasitas Pax ---
                                    if (_orderType == 'Dine In' ||
                                        _orderType == 'Open Bill') ...[
                                      const SizedBox(height: 16),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: AppTextField(
                                              label: 'Jumlah Orang',
                                              controller: _guestCountController,
                                              keyboardType:
                                                  TextInputType.number,
                                              hint: 'Cth: 2',
                                              readOnly: _isContextLocked,
                                              onChanged: (value) => setState(() {
                                                final int newCount =
                                                    int.tryParse(value) ?? 1;
                                                // --- FIX 3: Auto-Reset Jika Tamu melebihi Meja ---
                                                if (_selectedTableCapacity !=
                                                        null &&
                                                    newCount >
                                                        _selectedTableCapacity!) {
                                                  _selectedTableCode = null;
                                                  _selectedTableId = null;
                                                  _selectedTableCapacity = null;
                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                        'Pilihan meja dibatalkan otomatis karena melebihi kapasitas.',
                                                      ),
                                                      backgroundColor:
                                                          Colors.orange,
                                                    ),
                                                  );
                                                }
                                              }),
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Alokasi Meja',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                BlocBuilder<
                                                  TableBloc,
                                                  TableState
                                                >(
                                                  builder: (context, tableState) {
                                                    return tableState.maybeWhen(
                                                      loaded: (tables, _) {
                                                        if (_selectedTableId ==
                                                                null &&
                                                            _selectedTableCode !=
                                                                null) {
                                                          try {
                                                            final t = tables
                                                                .firstWhere(
                                                                  (tbl) =>
                                                                      tbl.code ==
                                                                      _selectedTableCode,
                                                                );
                                                            _selectedTableId =
                                                                t.id;
                                                            _selectedTableCapacity =
                                                                t.capacity;
                                                          } catch (_) {}
                                                        }

                                                        return InkWell(
                                                          onTap:
                                                              _isContextLocked
                                                              ? null
                                                              : () =>
                                                                    _showCinemaTablePicker(
                                                                      context,
                                                                    ),
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets.symmetric(
                                                                  vertical: 14,
                                                                  horizontal:
                                                                      12,
                                                                ),
                                                            decoration: BoxDecoration(
                                                              border: Border.all(
                                                                color:
                                                                    _selectedTableCode !=
                                                                        null
                                                                    ? AppColors
                                                                          .primary
                                                                    : AppColors
                                                                          .stroke,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    8,
                                                                  ),
                                                              color:
                                                                  _isContextLocked
                                                                  ? Colors
                                                                        .grey
                                                                        .shade100
                                                                  : (_selectedTableCode !=
                                                                            null
                                                                        ? Colors
                                                                              .blue
                                                                              .shade50
                                                                        : Colors
                                                                              .white),
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .table_restaurant,
                                                                  size: 18,
                                                                  color:
                                                                      _selectedTableCode !=
                                                                          null
                                                                      ? AppColors
                                                                            .primary
                                                                      : Colors
                                                                            .grey,
                                                                ),
                                                                const SizedBox(
                                                                  width: 8,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    _selectedTableCode !=
                                                                            null
                                                                        ? 'Meja: $_selectedTableCode'
                                                                        : 'Ketuk Pilih Meja',
                                                                    style: TextStyle(
                                                                      fontWeight:
                                                                          _selectedTableCode !=
                                                                              null
                                                                          ? FontWeight.bold
                                                                          : FontWeight.normal,
                                                                      color:
                                                                          _selectedTableCode !=
                                                                              null
                                                                          ? AppColors.primaryDark
                                                                          : Colors.grey,
                                                                    ),
                                                                  ),
                                                                ),
                                                                if (!_isContextLocked)
                                                                  const Icon(
                                                                    Icons
                                                                        .chevron_right,
                                                                    size: 18,
                                                                    color: Colors
                                                                        .grey,
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
                                            ),
                                          ),
                                        ],
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
                                              borderRadius:
                                                  BorderRadius.circular(12),
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
                                                Expanded(
                                                  child: Text(
                                                    _selectedMemberName ??
                                                        'Member',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                              onPressed:
                                                  _showMemberSearchDialog,
                                            ),
                                          ),

                                    if (_selectedMemberId != null)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 12.0,
                                        ),
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
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
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
                                                        color: Colors
                                                            .blue
                                                            .shade900,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Saldo: ${currencyFormatter.format(_memberPoints)} pts',
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                        color: Colors
                                                            .blue
                                                            .shade800,
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
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
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
                                                    color:
                                                        Colors.green.shade800,
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
                                                        backgroundColor: Colors
                                                            .green
                                                            .shade100,
                                                        deleteIconColor: Colors
                                                            .green
                                                            .shade900,
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
                                                      color: Colors
                                                          .orange
                                                          .shade300,
                                                    ),
                                                    onDeleted: () {
                                                      setState(() {
                                                        _ignoredVoucherName =
                                                            _appliedVoucher!
                                                                .name;
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
                                          _summaryRow(
                                            'Pajak (PB1)',
                                            currentTax,
                                          ),
                                          if (pointsDiscount > 0)
                                            _summaryRow(
                                              'Tukar Poin',
                                              -pointsDiscount,
                                              isRed: true,
                                              colorOverride:
                                                  Colors.blue.shade700,
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
    } else if (['qris', 'card', 'transfer'].contains(_paymentMethod)) {
      String proofLabel = 'Bukti Pembayaran QRIS';
      String hintLabel = 'Ambil Foto Bukti Transfer';

      if (_paymentMethod == 'card') {
        proofLabel = 'Bukti Pembayaran Kartu (EDC)';
        hintLabel = 'Ambil Foto Struk EDC';
      } else if (_paymentMethod == 'transfer') {
        proofLabel = 'Bukti Transfer Bank';
        hintLabel = 'Ambil Foto Bukti Transfer';
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_paymentMethod == 'qris')
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
                  size: 80,
                  color: Colors.black87,
                ),
              ),
            ),
          if (_paymentMethod == 'card' || _paymentMethod == 'transfer')
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.orange.shade200),
              ),
              child: Row(
                children: [
                  Icon(
                    _paymentMethod == 'card'
                        ? Icons.credit_card
                        : Icons.account_balance,
                    color: Colors.orange.shade700,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      _paymentMethod == 'card'
                          ? 'Gunakan Mesin EDC untuk pembayaran kartu.'
                          : 'Pastikan dana sudah masuk ke rekening bank.',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.orange.shade900,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Text(proofLabel, style: const TextStyle(fontWeight: FontWeight.bold)),
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
                          hintLabel,
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
      return const SizedBox.shrink();
    }
  }

  Widget _orderTypeChip(String type) {
    return ChoiceChip(
      label: Text(type),
      selected: _orderType == type,
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

  Widget _paymentMethodCard(String value, String title, IconData icon) {
    final isSelected = _paymentMethod == value;
    return InkWell(
      onTap: () => setState(() {
        final double oldPaid =
            double.tryParse(
              _amountPaidController.text.replaceAll(RegExp(r'[^0-9]'), ''),
            ) ??
            0;

        _paymentMethod = value;

        // Reset proof image hanya jika pindah ke cash.
        // Jika pindah antar QRIS/Card/Transfer, biarkan proof image (memudahkan jika salah pilih method)
        if (value == 'cash') {
          _proofImage = null;
        }

        // Auto-fill amount paid jika bukan cash
        if (value != 'cash') {
          // Trigger build untuk update amount paid sesuai grandTotal
        }
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
