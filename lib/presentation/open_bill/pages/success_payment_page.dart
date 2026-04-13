import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/core/services/printer_service.dart';
import 'package:avis_pos/data/model/responses/order_model/order_model.dart';
import 'package:avis_pos/presentation/settings/bloc/printer/printer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SuccessPaymentPage extends StatefulWidget {
  final OrderModel order;
  final double amountPaid;

  const SuccessPaymentPage({
    super.key,
    required this.order,
    required this.amountPaid,
  });

  @override
  State<SuccessPaymentPage> createState() => _SuccessPaymentPageState();
}

class _SuccessPaymentPageState extends State<SuccessPaymentPage> {
  @override
  void initState() {
    super.initState();
    // Lakukan Auto-Print saat halaman sukses terbuka (Background process)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _executePrint();
    });
  }

  // --- Fungsi Eksekusi Printer (Multi-Printer Routing) ---
  Future<void> _executePrint() async {
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
                widget.order,
                amountPaid: widget.amountPaid,
              );
            } catch (e) {
              debugPrint('Gagal cetak struk utama: $e');
            }
          }
          // Opsional: Untuk Dine-In, cetak label cup saat dibayar
          if (labelPrinter != null) {
            try {
              await ps.printCupLabel(labelPrinter, widget.order);
            } catch (e) {
              debugPrint('Gagal cetak label: $e');
            }
          }
        },
        orElse: () => debugPrint('Data pengaturan printer belum siap.'),
      );
    } catch (e) {
      debugPrint('Fatal Printer error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    final double change = widget.amountPaid > (widget.order.totalPrice ?? 0)
        ? widget.amountPaid - widget.order.totalPrice!
        : 0;
    final bool isCash = widget.order.paymentMethod?.toLowerCase() == 'cash';

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Container(
            width: 500,
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryLight,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_circle,
                    color: AppColors.primary,
                    size: 72,
                  ),
                ),
                const SizedBox(height: 24),

                const Text(
                  'Pembayaran Berhasil!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'No. Referensi: ${widget.order.orderNumber}',
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                ),
                const SizedBox(height: 32),

                // --- HIGHLIGHT KEMBALIAN / LUNAS ---
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: isCash ? Colors.green.shade50 : Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isCash
                          ? Colors.green.shade200
                          : Colors.blue.shade200,
                    ),
                  ),
                  child: Column(
                    children: [
                      _buildDetailRow(
                        isCash ? 'Uang Diterima' : 'Nominal Dibayar',
                        currencyFormatter.format(widget.amountPaid),
                        isBold: true,
                      ),
                      if (isCash) ...[
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Divider(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'KEMBALIAN',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            Text(
                              change > 0
                                  ? currencyFormatter.format(change)
                                  : 'Uang Pas',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
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
                const SizedBox(height: 40),

                // --- TOMBOL AKSI ---
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          _executePrint(); // Re-Print Manual
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Mencetak struk kasir...'),
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
                        onPressed: () => Navigator.popUntil(
                          context,
                          (route) => route.isFirst,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            'Selesai',
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
          style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
            fontSize: 16,
            color: isBold ? AppColors.textPrimary : Colors.grey.shade800,
          ),
        ),
      ],
    );
  }
}
