import 'package:avis_pos/core/components/buttons.dart';
import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/presentation/open_bill/bloc/open_bill/open_bill_bloc.dart';
import 'package:avis_pos/presentation/open_bill/pages/bill_product_selector_page.dart';
import 'package:avis_pos/presentation/open_bill/pages/success_payment_page.dart';
import 'package:avis_pos/presentation/open_bill/widgets/open_bill_payment_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Rincian Tagihan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        actions: [
          // Tombol Batal/Kosongkan Meja
          BlocBuilder<OpenBillBloc, OpenBillState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (_, selectedOrder, __, ___) {
                  if (selectedOrder == null) return const SizedBox.shrink();
                  return IconButton(
                    icon: const Icon(Icons.delete_forever, color: Colors.red),
                    tooltip: 'Batalkan Tagihan & Kosongkan Meja',
                    onPressed: () {
                      _showCancelConfirmation(context, selectedOrder.id);
                    },
                  );
                },
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
        ],
      ),
      body: BlocConsumer<OpenBillBloc, OpenBillState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (message) {
              // ✅ FIX 1: Jangan lakukan pop() otomatis saat pembayaran berhasil!
              // Biarkan modal yang tertutup dan mengembalikan amountPaid untuk membuka Halaman Sukses
              if (!message.contains('Pembayaran berhasil')) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: AppColors.primary,
                  ),
                );
              }
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message), backgroundColor: Colors.red),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
            loaded: (orders, selectedOrder, usePoints, ignoredRules) {
              if (selectedOrder == null) {
                return const Center(
                  child: Text('Data pesanan tidak ditemukan.'),
                );
              }

              return Column(
                children: [
                  // --- INFO MEJA & PELANGGAN ---
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedOrder.tableNumber ?? 'Meja -',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.orange.shade100,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                selectedOrder.status.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.orange.shade800,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Pelanggan: ${selectedOrder.customerName ?? 'Guest'} • ${selectedOrder.guestCount} Tamu',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'No. Order: ${selectedOrder.orderNumber}',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // --- DAFTAR ITEM PESANAN ---
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(20),
                      itemCount: selectedOrder.items.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        final item = selectedOrder.items[index];
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.primaryLight,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                '${item.quantity!.toInt()}x',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryDark,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.productName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  if (item.addons.isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: item.addons
                                            .map(
                                              (a) => Text(
                                                '+ ${a.name}',
                                                style: TextStyle(
                                                  color: Colors.grey.shade600,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                  if (item.note != null &&
                                      item.note!.isNotEmpty)
                                    Text(
                                      'Note: ${item.note}',
                                      style: TextStyle(
                                        color: Colors.orange.shade700,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 12,
                                      ),
                                    ),
                                ],
                              ),
                            ),

                            // --- BAGIAN KANAN: HARGA & TOMBOL HAPUS ---
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  currencyFormatter.format(item.price),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                // Tombol Hapus Item
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title: const Text('Hapus Menu?'),
                                        content: Text(
                                          'Hapus menu ${item.productName} dari tagihan ini?',
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(ctx),
                                            child: const Text('Batal'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(ctx);
                                              context.read<OpenBillBloc>().add(
                                                OpenBillEvent.removeItemFromBill(
                                                  selectedOrder.id,
                                                  item.id!,
                                                ),
                                              );
                                            },
                                            child: const Text(
                                              'Ya, Hapus',
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  // --- PANEL BAWAH (SUMMARY & ACTIONS) ---
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, -5),
                        ),
                      ],
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                    child: SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildSummaryRow(
                            'Subtotal',
                            currencyFormatter.format(selectedOrder.subTotal),
                          ),
                          if (selectedOrder.discount > 0)
                            _buildSummaryRow(
                              'Diskon',
                              '- ${currencyFormatter.format(selectedOrder.discount)}',
                              isDiscount: true,
                            ),
                          _buildSummaryRow(
                            'Pajak',
                            currencyFormatter.format(selectedOrder.tax),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Divider(height: 1),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Grand Total',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                currencyFormatter.format(
                                  selectedOrder.totalPrice,
                                ),
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              Expanded(
                                child: AppButton(
                                  label: 'Tambah Pesanan',
                                  isOutlined: true,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            const BillProductSelectorPage(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: AppButton(
                                  label: 'Bayar Tagihan',
                                  onPressed: () async {
                                    final amountPaid = await showDialog<double>(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (context) =>
                                          const OpenBillPaymentModal(),
                                    );

                                    if (amountPaid != null && context.mounted) {
                                      // ✅ FIX 2: Gunakan Navigator.push karena SuccessPaymentPage adalah Scaffold (halaman penuh)
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => SuccessPaymentPage(
                                            order: selectedOrder,
                                            amountPaid: amountPaid,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            orElse: () => const Center(child: Text('Data tidak tersedia')),
          );
        },
      ),
    );
  }

  Widget _buildSummaryRow(
    String label,
    String value, {
    bool isDiscount = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: isDiscount ? Colors.red : AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  void _showCancelConfirmation(BuildContext context, int orderId) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Batalkan Tagihan?'),
        content: const Text(
          'Seluruh pesanan akan dibatalkan dan meja akan dikosongkan. Lanjutkan?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Tidak', style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              context.read<OpenBillBloc>().add(
                OpenBillEvent.cancelBill(orderId),
              );
              Navigator.pop(context); // Kembali ke list Open Bill
            },
            child: const Text(
              'Ya, Batalkan',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
