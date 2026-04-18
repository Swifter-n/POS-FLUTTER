import 'package:avis_pos/core/components/buttons.dart';
import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/presentation/home/bloc/cart/cart_bloc.dart';
import 'package:avis_pos/presentation/home/widgets/cart_item_card.dart';
import 'package:avis_pos/presentation/home/widgets/payment_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Container(
      width: 380,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(left: BorderSide(color: Colors.grey.shade200, width: 1)),
      ),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
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
                  orderType,
                  customerName,
                ) {
                  double grandTotal = subtotal - discount + tax;
                  if (grandTotal < 0) grandTotal = 0;
                  final bool isEmpty = items.isEmpty;

                  return Column(
                    children: [
                      // --- HEADER KERANJANG ---
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Current Order',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // 👇 Tampilkan Nomor Meja jika sedang mode Tambah Pesanan 👇
                                if (tableNumber != null)
                                  Text(
                                    'Menambah pesanan: Meja $tableNumber',
                                    style: TextStyle(
                                      color: Colors.orange.shade700,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                              ],
                            ),

                            // 👇 Tombol X (Batal Tambah Pesanan / Clear Cart) 👇
                            Row(
                              children: [
                                if (tableNumber != null)
                                  IconButton(
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    ),
                                    tooltip: 'Batal Tambah Pesanan',
                                    onPressed: () {
                                      // Reset konteks meja dan kosongkan cart
                                      context.read<CartBloc>().add(
                                        const CartEvent.setContext(
                                          tableNumber: null,
                                          activeOrder: null,
                                        ),
                                      );
                                      context.read<CartBloc>().add(
                                        const CartEvent.clearCart(),
                                      );

                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Batal menambah pesanan.',
                                          ),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    },
                                  ),
                                if (tableNumber ==
                                    null) // Tampilkan tombol hapus biasa jika pesanan baru
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete_outline,
                                      color: Colors.grey.shade400,
                                    ),
                                    onPressed: () => context
                                        .read<CartBloc>()
                                        .add(const CartEvent.clearCart()),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(24),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       const Text(
                      //         'Pesanan Saat Ini',
                      //         style: TextStyle(
                      //           fontSize: 18,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //       if (!isEmpty)
                      //         InkWell(
                      //           onTap: () => context.read<CartBloc>().add(
                      //             const CartEvent.clearCart(),
                      //           ),
                      //           child: Text(
                      //             'Kosongkan',
                      //             style: TextStyle(
                      //               color: Colors.red.shade500,
                      //               fontWeight: FontWeight.bold,
                      //               fontSize: 13,
                      //             ),
                      //           ),
                      //         ),
                      //     ],
                      //   ),
                      // ),

                      // --- LIST ITEM KERANJANG ---
                      Expanded(
                        child: isEmpty
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.shopping_cart_outlined,
                                      size: 64,
                                      color: Colors.grey.shade300,
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'Keranjang masih kosong',
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : ListView.builder(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                ),
                                itemCount: items.length,
                                itemBuilder: (context, index) {
                                  final item = items[index];
                                  return CartItemCard(
                                    item: item,
                                    // 👇 TAMBAHKAN BARIS INI
                                    onQuantityChanged: (newQty) =>
                                        context.read<CartBloc>().add(
                                          CartEvent.updateQuantity(
                                            item.productId,
                                            item.uom ?? 'PCS',
                                            newQty,
                                          ),
                                        ),
                                    // 👆 BATAS PENAMBAHAN
                                    onIncrease: () =>
                                        context.read<CartBloc>().add(
                                          CartEvent.updateQuantity(
                                            item.productId,
                                            item.uom ?? 'PCS',
                                            item.quantity + 1,
                                          ),
                                        ),
                                    onDecrease: () {
                                      if (item.quantity > 1) {
                                        context.read<CartBloc>().add(
                                          CartEvent.updateQuantity(
                                            item.productId,
                                            item.uom ?? 'PCS',
                                            item.quantity - 1,
                                          ),
                                        );
                                      } else {
                                        context.read<CartBloc>().add(
                                          CartEvent.removeItem(
                                            item.productId,
                                            item.uom ?? 'PCS',
                                          ),
                                        );
                                      }
                                    },
                                    onRemove: () =>
                                        context.read<CartBloc>().add(
                                          CartEvent.removeItem(
                                            item.productId,
                                            item.uom ?? 'PCS',
                                          ),
                                        ),
                                  );
                                },
                              ),
                      ),

                      // --- BAGIAN SUMMARY & TOMBOL BAYAR ---
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 15,
                              offset: const Offset(0, -4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // ✅ BADGE PROMO INTERAKTIF
                            if (appliedPromos.isNotEmpty)
                              Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.green.shade50,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.green.shade200,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    const SizedBox(height: 8),
                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: appliedPromos
                                          .map(
                                            (promoName) => InputChip(
                                              label: Text(
                                                promoName
                                                    .toUpperCase()
                                                    .replaceAll('_', ' '),
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              backgroundColor:
                                                  Colors.green.shade600,
                                              deleteIconColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                side: BorderSide(
                                                  color: Colors.green.shade700,
                                                ),
                                              ),
                                              onDeleted: () {
                                                // Silang promo dari sini
                                                context.read<CartBloc>().add(
                                                  CartEvent.ignorePromo(
                                                    promoName,
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ],
                                ),
                              ),

                            _buildPriceRow(
                              'Subtotal',
                              currencyFormatter.format(subtotal),
                            ),
                            if (discount > 0)
                              _buildPriceRow(
                                'Diskon',
                                '- ${currencyFormatter.format(discount)}',
                                isDiscount: true,
                              ),
                            _buildPriceRow(
                              'Pajak (PB1)',
                              currencyFormatter.format(tax),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Divider(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total Bayar',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                Text(
                                  currencyFormatter.format(grandTotal),
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            AppButton(
                              // ✅ MODIFIKASI LABEL TOMBOL
                              label: state.maybeWhen(
                                loaded:
                                    (
                                      _,
                                      __,
                                      ___,
                                      ____,
                                      _____,
                                      ______,
                                      tableNumber,
                                      activeOrder,
                                      orderType,
                                      customerName,
                                    ) {
                                      if (activeOrder != null)
                                        return 'SIMPAN TAMBAHAN';
                                      if (tableNumber != null)
                                        return 'LANJUTKAN PESANAN';
                                      return 'PROSES PEMBAYARAN';
                                    },
                                orElse: () => 'PROSES PEMBAYARAN',
                              ),
                              onPressed: () {
                                if (items.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Keranjang masih kosong!'),
                                    ),
                                  );
                                  return;
                                }
                                showDialog(
                                  context: context,
                                  barrierDismissible: false, // Mencegah modal tertutup saat area luar diklik
                                  builder: (dialogContext) => PaymentModal(
                                    subtotal: subtotal,
                                    tax: tax,
                                    discount: discount,
                                    cartItems: items,
                                    appliedPromos: appliedPromos,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
            orElse: () => const SizedBox(),
          );
        },
      ),
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isDiscount = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isDiscount ? Colors.red.shade600 : Colors.grey.shade600,
              fontSize: 14,
              fontWeight: isDiscount ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isDiscount ? FontWeight.w800 : FontWeight.bold,
              color: isDiscount ? Colors.red.shade600 : AppColors.textPrimary,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
