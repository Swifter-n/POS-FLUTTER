import 'dart:io';
import 'package:avis_pos/core/components/buttons.dart';
import 'package:avis_pos/core/components/form_fields.dart';
import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/data/model/payloads/quick_checkout_payload/quick_checkout_payload.dart';
import 'package:avis_pos/data/model/responses/member_model/member_model.dart';
import 'package:avis_pos/data/model/responses/member_voucher_model/member_voucher_model.dart';
import 'package:avis_pos/data/model/responses/order_model/order_model.dart';
import 'package:avis_pos/presentation/home/bloc/cart/cart_bloc.dart';
import 'package:avis_pos/presentation/home/pages/payment_camera_page.dart';
import 'package:avis_pos/presentation/member/bloc/member/member_bloc.dart';
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

  // ✅ LOCKING STATE: Variabel untuk mengunci nominal persis saat tombol bayar ditekan
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

  void _submitPayment(
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

    // ✅ MENGUNCI NOMINAL UANG SAAT TOMBOL DITEKAN
    setState(() {
      _submittedAmountPaid = amountPaid;
    });

    List<String> finalIgnoredRules = List.from(currentIgnoredRules);
    if (_ignoredVoucherName != null) {
      finalIgnoredRules.add(_ignoredVoucherName!);
    }

    final payload = QuickCheckoutPayload(
      typeOrder: _orderType,
      tableId: _orderType == 'Dine In' ? _selectedTableId : null,
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
      context: context,
      builder: (dialogContext) {
        String searchInput = '';
        return BlocConsumer<MemberBloc, MemberState>(
          listener: (context, state) {
            state.maybeWhen(
              memberFound: (memberFromApi) {
                setState(() {
                  _selectedMemberId = memberFromApi.id;
                  _selectedMemberName = memberFromApi.name;
                  _memberPoints = memberFromApi.currentPoints ?? 0;
                  _memberTier = memberFromApi.tier ?? 'Basic';
                  _memberLastVisit = memberFromApi.lastVisit;
                  _memberFavorite = memberFromApi.favoriteProduct;
                  _memberTotalSpend = memberFromApi.totalSpend ?? 0.0;
                  _usePoints = false;

                  _ignoredVoucherName = null;

                  _appliedVoucher = null;
                  if (memberFromApi.vouchers.isNotEmpty) {
                    for (var v in memberFromApi.vouchers) {
                      bool isUsed = false;
                      if (v.isUsed == true || v.isUsed == 1 || v.isUsed == '1')
                        isUsed = true;
                      if (!isUsed) {
                        _appliedVoucher = v;
                        break;
                      }
                    }
                    if (_appliedVoucher != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Member $_memberTier! Promo otomatis diterapkan.',
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  }
                });
                Navigator.pop(dialogContext);
              },
              error: (msg) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(msg), backgroundColor: Colors.red),
                );
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            bool isLoading = state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            );
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
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
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
                            if (code != null && context.mounted)
                              context.read<MemberBloc>().add(
                                MemberEvent.checkMember(code),
                              );
                          },
                        ),
                      ),
                    ],
                  ),
                  if (isLoading)
                    const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: CircularProgressIndicator(),
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
                  onPressed: isLoading
                      ? null
                      : () {
                          if (searchInput.isNotEmpty)
                            context.read<MemberBloc>().add(
                              MemberEvent.checkMember(searchInput),
                            );
                        },
                  child: Text(
                    isLoading ? 'Mencari...' : 'Cek Member',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        state.maybeWhen(
          checkoutSuccess: (order) {
            setState(() {
              _isSuccess = true;
              _completedOrder = order;
              final safeTotalPrice = order.totalPrice ?? 0.0;
              // ✅ FIX: Menggunakan nilai _submittedAmountPaid yang sudah di-"Lock" secara akurat!
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
      builder: (context, state) {
        if (_isSuccess && _completedOrder != null) return _buildSuccessScreen();
        bool isLoading = false;

        double currentSubtotal = widget.subtotal;
        double currentTax = widget.tax;
        double currentDiscount = widget.discount;
        List<String> currentAppliedPromos = List.from(widget.appliedPromos);
        List<dynamic> currentCartItems = List.from(widget.cartItems);
        List<String> currentIgnoredRules = [];

        state.maybeWhen(
          loading: () => isLoading = true,
          loaded:
              (items, subtotal, discount, tax, appliedPromos, ignoredRules) {
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
          if (pointsDiscount > baseTotal) {
            pointsDiscount = baseTotal;
          }
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

        return SingleChildScrollView(
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
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
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    _orderTypeChip('Takeaway'),
                                    const SizedBox(width: 8),
                                    _orderTypeChip('Dine In'),
                                  ],
                                ),
                                if (_orderType == 'Dine In') ...[
                                  const SizedBox(height: 16),
                                  const Text(
                                    'Pilih Meja',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  BlocBuilder<TableBloc, TableState>(
                                    builder: (context, tableState) {
                                      return tableState.maybeWhen(
                                        loaded: (tables, _) {
                                          final availables = tables
                                              .where(
                                                (t) => t.status == 'available',
                                              )
                                              .toList();
                                          return DropdownButtonFormField<int>(
                                            value: _selectedTableId,
                                            items: availables
                                                .map(
                                                  (t) => DropdownMenuItem(
                                                    value: t.id,
                                                    child: Text(t.code),
                                                  ),
                                                )
                                                .toList(),
                                            onChanged: (val) => setState(
                                              () => _selectedTableId = val,
                                            ),
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 16,
                                                    vertical: 12,
                                                  ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                            hint: const Text(
                                              'Pilih Meja Tersedia',
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
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
                                            Expanded(
                                              child: Text(
                                                _selectedMemberName ?? '',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: AppColors.primaryDark,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
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
                                            padding: const EdgeInsets.symmetric(
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
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue.shade900,
                                                  ),
                                                ),
                                                Text(
                                                  'Saldo: ${currencyFormatter.format(_memberPoints)} pts',
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.blue.shade800,
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
                                                          .replaceAll('_', ' '),
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
                                                      color:
                                                          Colors.green.shade300,
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
                                                    color:
                                                        Colors.orange.shade900,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                backgroundColor:
                                                    Colors.orange.shade100,
                                                deleteIconColor:
                                                    Colors.orange.shade900,
                                                side: BorderSide(
                                                  color: Colors.orange.shade300,
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
                                    border: Border.all(color: AppColors.stroke),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _summaryRow('Subtotal', currentSubtotal),
                                      if (_appliedVoucher != null &&
                                          currentSubtotal <
                                              (double.tryParse(
                                                    _appliedVoucher!.minPurchase
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

                          // --- KANAN: METODE PEMBAYARAN ---
                          Expanded(
                            flex: 1,
                            child: Column(
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
                                    _paymentMethodCard(
                                      'cash',
                                      'Tunai',
                                      Icons.money,
                                    ),
                                    _paymentMethodCard(
                                      'qris',
                                      'QRIS',
                                      Icons.qr_code_2,
                                    ),
                                    _paymentMethodCard(
                                      'card',
                                      'Kartu',
                                      Icons.credit_card,
                                    ),
                                    _paymentMethodCard(
                                      'transfer',
                                      'Transfer',
                                      Icons.account_balance,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                _buildDynamicPaymentInput(
                                  grandTotal,
                                  changeAmount,
                                ),
                                const SizedBox(height: 32),
                                AppButton(
                                  label: isLoading
                                      ? 'Memproses...'
                                      : 'PROSES PEMBAYARAN',
                                  onPressed: isLoading
                                      ? () {}
                                      : () => _submitPayment(
                                          grandTotal,
                                          currentCartItems,
                                          currentIgnoredRules,
                                        ),
                                ),
                              ],
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
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // =========================================================================
  // 2. LAYAR SUKSES
  // =========================================================================
  Widget _buildSuccessScreen() {
    final order = _completedOrder!;
    final safeTotalPrice = order.totalPrice ?? 0.0;

    // ✅ FIX: Kalkulasi kembalian mengandalkan nilai _finalAmountPaid yang sudah di-lock
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
    final isActive = _orderType == type;
    return ChoiceChip(
      label: Text(type),
      selected: isActive,
      onSelected: (val) => setState(() => _orderType = type),
      selectedColor: AppColors.primary,
      labelStyle: TextStyle(color: isActive ? Colors.white : Colors.black),
    );
  }

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
