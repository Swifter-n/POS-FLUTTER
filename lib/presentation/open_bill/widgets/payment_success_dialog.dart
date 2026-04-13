import 'package:avis_pos/core/components/buttons.dart';
import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/core/services/printer_service.dart';
import 'package:avis_pos/data/model/responses/order_model/order_model.dart';
import 'package:avis_pos/presentation/settings/bloc/printer/printer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PaymentSuccessDialog extends StatelessWidget {
  final OrderModel order;
  final double amountPaid;

  const PaymentSuccessDialog({
    super.key,
    required this.order,
    required this.amountPaid,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    final double change = amountPaid > order.totalPrice
        ? amountPaid - order.totalPrice
        : 0;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      backgroundColor: Colors.white,
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // --- SUCCESS ICON ANIMATION ---
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle,
                color: AppColors.primary,
                size: 60,
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Pembayaran Berhasil!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Order #${order.orderNumber}',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
            ),
            const Divider(height: 32),

            // --- PAYMENT DETAILS ---
            _buildDetailRow(
              'Total Tagihan',
              currencyFormatter.format(order.totalPrice),
              isBold: true,
            ),
            const SizedBox(height: 8),
            _buildDetailRow(
              'Metode Bayar',
              order.paymentMethod?.toUpperCase() ?? '',
            ),
            const SizedBox(height: 8),
            _buildDetailRow(
              'Uang Diterima',
              currencyFormatter.format(amountPaid),
            ),

            if (change > 0) ...[
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Divider(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Kembalian',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    currencyFormatter.format(change),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.tertiary,
                    ),
                  ),
                ],
              ),
            ],

            const SizedBox(height: 32),

            // --- ACTIONS ---
            AppButton(
              label: 'Cetak Struk Kasir',
              onPressed: () {
                // Eksekusi print struk (Pastikan PrinterBloc disediakan di context atas)

                final printerState = context.read<PrinterBloc>().state;
                PrinterService().printReceipt(printerState, order);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Mencetak struk...')),
                );
              },
            ),
            const SizedBox(height: 12),
            AppButton(
              label: 'Tutup & Kembali',
              isOutlined: true,
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: 14,
            color: isBold ? AppColors.textPrimary : Colors.grey.shade800,
          ),
        ),
      ],
    );
  }
}
