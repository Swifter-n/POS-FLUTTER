import 'dart:io';
import 'package:avis_pos/core/components/buttons.dart';
import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/presentation/home/pages/payment_camera_page.dart';
import 'package:avis_pos/presentation/open_bill/bloc/open_bill/open_bill_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // WAJIB untuk TextInputFormatter
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// ✅ Tambahkan class Formatter Rupiah
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

class OpenBillPaymentModal extends StatefulWidget {
  const OpenBillPaymentModal({super.key});

  @override
  State<OpenBillPaymentModal> createState() => _OpenBillPaymentModalState();
}

class _OpenBillPaymentModalState extends State<OpenBillPaymentModal> {
  final TextEditingController _amountPaidController = TextEditingController();
  final TextEditingController _promoCodeController = TextEditingController();

  String _selectedPaymentMethod = 'cash';
  File? _proofImage;

  final currencyFormatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  @override
  void initState() {
    super.initState();
    // ✅ Tambahkan listener agar kotak kembalian merespons input ketikan
    _amountPaidController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _amountPaidController.dispose();
    _promoCodeController.dispose();
    super.dispose();
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
        if (result is File) {
          _proofImage = result;
        } else if (result is String) {
          _proofImage = File(result);
        }
      });
    }
  }

  void _processPayment(double grandTotal, int orderId, bool usePoints) {
    double amountPaid = grandTotal;

    if (_selectedPaymentMethod == 'cash') {
      final inputAmount = double.tryParse(
        _amountPaidController.text.replaceAll(RegExp(r'[^0-9]'), ''),
      );
      if (inputAmount != null && inputAmount >= grandTotal) {
        amountPaid = inputAmount;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Nominal uang tunai kurang dari tagihan!'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
    }

    // ✅ FIX: Wajibkan foto bukti untuk QRIS, Transfer, dan Card EDC
    if (_selectedPaymentMethod != 'cash' && _proofImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Wajib melampirkan foto bukti pembayaran/struk!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final paymentData = {
      'payment_method': _selectedPaymentMethod,
      'amount_paid': amountPaid,
      'use_points': usePoints,
    };

    if (_promoCodeController.text.trim().isNotEmpty) {
      paymentData['promo_code_input'] = _promoCodeController.text.trim();
    }

    context.read<OpenBillBloc>().add(
      OpenBillEvent.payBill(orderId, paymentData),
    );
    Navigator.pop(context, amountPaid);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      backgroundColor: Colors.white,
      child: Container(
        width: 550,
        padding: const EdgeInsets.all(24),
        child: BlocBuilder<OpenBillBloc, OpenBillState>(
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (orders, selectedOrder, usePoints, ignoredRules) {
                if (selectedOrder == null) {
                  return const Center(
                    child: Text('Tidak ada order yang dipilih.'),
                  );
                }
                final double grandTotal = selectedOrder.totalPrice ?? 0;

                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- HEADER ---
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Selesaikan Tagihan',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${selectedOrder.tableNumber ?? 'Meja -'} | ${selectedOrder.customerName ?? 'Guest'}',
                                style: const TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(Icons.close, color: Colors.grey),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                      const Divider(height: 32),

                      // --- HIGHLIGHT TOTAL ---
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.primaryLight,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppColors.primary.withOpacity(0.3),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total Tagihan',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryDark,
                              ),
                            ),
                            Text(
                              currencyFormatter.format(grandTotal),
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryDark,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // --- METODE PEMBAYARAN ---
                      const Text(
                        'Metode Pembayaran',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          _buildPaymentMethodCard('cash', 'Tunai', Icons.money),
                          _buildPaymentMethodCard(
                            'qris',
                            'QRIS',
                            Icons.qr_code,
                          ),
                          _buildPaymentMethodCard(
                            'card',
                            'Kartu',
                            Icons.credit_card,
                          ),
                          _buildPaymentMethodCard(
                            'transfer',
                            'Transfer',
                            Icons.account_balance,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // --- INPUT DINAMIS ---
                      _buildDynamicInput(grandTotal),
                      const SizedBox(height: 24),

                      // --- TOMBOL KONFIRMASI ---
                      AppButton(
                        label: 'Proses Pembayaran',
                        onPressed: () => _processPayment(
                          grandTotal,
                          selectedOrder.id,
                          usePoints,
                        ),
                      ),
                    ],
                  ),
                );
              },
              orElse: () => const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }

  // --- Widget Dinamis untuk Input dan Kamera ---
  Widget _buildDynamicInput(double grandTotal) {
    if (_selectedPaymentMethod == 'cash') {
      final double inputAmount =
          double.tryParse(
            _amountPaidController.text.replaceAll(RegExp(r'[^0-9]'), ''),
          ) ??
          0;
      final double changeAmount = inputAmount > grandTotal
          ? inputAmount - grandTotal
          : 0;

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
    } else if (_selectedPaymentMethod == 'qris') {
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
          _buildCameraUpload(),
        ],
      );
    } else {
      // Card EDC & Transfer
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.orange.shade200),
            ),
            child: Column(
              children: [
                Icon(
                  _selectedPaymentMethod == 'card'
                      ? Icons.credit_card
                      : Icons.account_balance,
                  size: 40,
                  color: Colors.orange,
                ),
                const SizedBox(height: 12),
                Text(
                  'Pembayaran via ${_selectedPaymentMethod == 'card' ? 'Mesin EDC' : 'Transfer Bank'}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
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
          ),
          const Text(
            'Upload Bukti Transaksi',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildCameraUpload(),
        ],
      );
    }
  }

  // --- Helper Widget Kamera ---
  Widget _buildCameraUpload() {
    return Column(
      children: [
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
                        'Ambil Foto Bukti Transfer/Struk',
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
  }

  Widget _buildPaymentMethodCard(String value, String title, IconData icon) {
    final isSelected = _selectedPaymentMethod == value;
    return InkWell(
      onTap: () => setState(() {
        _selectedPaymentMethod = value;
        _proofImage = null; // Reset foto jika metode berubah
      }),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 110,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryLight : AppColors.background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.stroke,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.primary : AppColors.textSecondary,
              size: 28,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: isSelected
                    ? AppColors.primaryDark
                    : AppColors.textSecondary,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
