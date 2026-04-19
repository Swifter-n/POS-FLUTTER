import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/presentation/home/bloc/cart/cart_bloc.dart';
import 'package:avis_pos/presentation/home/widgets/cart_item_card.dart';
import 'package:avis_pos/presentation/home/widgets/payment_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CartBottomSheetMobile extends StatelessWidget {
  const CartBottomSheetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return state.maybeWhen(
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
                  final bool isEmpty = items.isEmpty;
                  double grandTotal = subtotal - discount + tax;
                  if (grandTotal < 0) grandTotal = 0;

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // --- HANDLE BAR ---
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 12),
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),

                      // --- HEADER ---
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Detail Pesanan',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                if (tableNumber != null)
                                  Text(
                                    'Meja $tableNumber',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.orange.shade800,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                              ],
                            ),
                            if (!isEmpty)
                              TextButton.icon(
                                onPressed: () {
                                  context.read<CartBloc>().add(
                                    const CartEvent.clearCart(),
                                  );
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.delete_sweep, size: 18),
                                label: const Text('Hapus Semua'),
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.red,
                                ),
                              ),
                          ],
                        ),
                      ),

                      const Divider(height: 1),

                      // --- LIST ITEM ---
                      Flexible(
                        child: isEmpty
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 40,
                                ),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.shopping_cart_outlined,
                                      size: 48,
                                      color: Colors.grey.shade300,
                                    ),
                                    const SizedBox(height: 16),
                                    const Text(
                                      'Keranjang masih kosong',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                itemCount: items.length,
                                itemBuilder: (context, index) {
                                  final item = items[index];
                                  return CartItemCard(
                                    item: item,
                                    onQuantityChanged: (newQty) =>
                                        context.read<CartBloc>().add(
                                          CartEvent.updateQuantity(
                                            item.productId,
                                            item.uom ?? 'PCS',
                                            newQty,
                                          ),
                                        ),
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

                      // --- PROMO APPLIED (Matching Tablet Layout) ---
                      if (appliedPromos.isNotEmpty)
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.green.shade200),
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
                                          promoName.toUpperCase().replaceAll(
                                            '_',
                                            ' ',
                                          ),
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        backgroundColor: Colors.green.shade600,
                                        deleteIconColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                          side: BorderSide(
                                            color: Colors.green.shade700,
                                          ),
                                        ),
                                        onDeleted: () {
                                          context.read<CartBloc>().add(
                                            CartEvent.ignorePromo(promoName),
                                          );
                                        },
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                        ),

                      // --- SUMMARY FOOTER ---
                      if (!isEmpty)
                        Container(
                          padding: const EdgeInsets.all(20),
                          color: Colors.grey.shade50,
                          child: Column(
                            children: [
                              _buildSummaryRow(
                                'Subtotal',
                                subtotal,
                                currencyFormatter,
                              ),
                              if (discount > 0)
                                _buildSummaryRow(
                                  'Diskon',
                                  -discount,
                                  currencyFormatter,
                                  isRed: true,
                                ),
                              _buildSummaryRow(
                                'Pajak (10%)',
                                tax,
                                currencyFormatter,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                child: Divider(),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'TOTAL BAYAR',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    currencyFormatter.format(grandTotal),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context); // Close sheet
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (dialogContext) => PaymentModal(
                                        subtotal: subtotal,
                                        tax: tax,
                                        discount: discount,
                                        cartItems: items,
                                        appliedPromos: appliedPromos,
                                      ),
                                    );
                                  },
                                  child: Text(
                                    activeOrder != null
                                        ? 'SIMPAN TAMBAHAN'
                                        : (tableNumber != null
                                              ? 'LANJUTKAN PESANAN'
                                              : 'PROSES PEMBAYARAN'),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                    ],
                  );
                },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildSummaryRow(
    String label,
    double value,
    NumberFormat formatter, {
    bool isRed = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
          ),
          Text(
            formatter.format(value),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isRed ? Colors.red : AppColors.textPrimary,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
