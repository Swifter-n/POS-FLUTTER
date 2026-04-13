import 'package:avis_pos/core/components/buttons.dart';
import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/presentation/home/bloc/cart/cart_bloc.dart';
import 'package:avis_pos/presentation/home/widgets/cart_item_card.dart';
import 'package:avis_pos/presentation/home/widgets/payment_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class QuickCartView extends StatelessWidget {
  const QuickCartView({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const QuickCartView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return state.maybeWhen(
                // ✅ FIX: Parameter ke-6 (ignoredRules)
                loaded:
                    (
                      items,
                      subTotal,
                      discountAmount,
                      taxAmount,
                      appliedPromos,
                      ignoredRules,
                      tableNumber,
                      activeOrder,
                    ) {
                      double grandTotal = subTotal + taxAmount - discountAmount;
                      if (grandTotal < 0) grandTotal = 0;

                      return Column(
                        children: [
                          if (tableNumber != null)
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 16,
                              ),
                              color: Colors.blue.shade50,
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.table_restaurant,
                                    size: 16,
                                    color: Colors.blue,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Melayani Meja: ',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.blue.shade900,
                                    ),
                                  ),
                                  Text(
                                    tableNumber,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue.shade900,
                                    ),
                                  ),
                                  const Spacer(),
                                  // Tombol untuk reset konteks jika salah pilih
                                  InkWell(
                                    onTap: () => context.read<CartBloc>().add(
                                      const CartEvent.clearCart(),
                                    ),
                                    child: Icon(
                                      Icons.cancel,
                                      size: 16,
                                      color: Colors.red.shade300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Column(
                              children: [
                                Container(
                                  width: 40,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Keranjang Pesanan',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      if (items.isNotEmpty)
                                        InkWell(
                                          onTap: () {
                                            context.read<CartBloc>().add(
                                              const CartEvent.clearCart(),
                                            );
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'Kosongkan',
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(height: 1),

                          Expanded(
                            child: items.isEmpty
                                ? Center(
                                    child: Text(
                                      'Keranjang kosong',
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    controller: scrollController,
                                    padding: const EdgeInsets.all(20),
                                    itemCount: items.length,
                                    itemBuilder: (context, index) {
                                      final item = items[index];
                                      return CartItemCard(
                                        item: item,
                                        onIncrease: () =>
                                            context.read<CartBloc>().add(
                                              CartEvent.updateQuantity(
                                                item.productId,
                                                item.uom ?? 'PCS',
                                                item.quantity + 1,
                                              ),
                                            ),
                                        onDecrease: () =>
                                            context.read<CartBloc>().add(
                                              CartEvent.updateQuantity(
                                                item.productId,
                                                item.uom ?? 'PCS',
                                                item.quantity - 1,
                                              ),
                                            ),
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

                          if (items.isNotEmpty)
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 10,
                                    offset: const Offset(0, -5),
                                  ),
                                ],
                              ),
                              child: SafeArea(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    // ✅ BADGE PROMO INTERAKTIF
                                    if (appliedPromos.isNotEmpty)
                                      Container(
                                        margin: const EdgeInsets.only(
                                          bottom: 16,
                                        ),
                                        padding: const EdgeInsets.all(12),
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
                                                            .replaceAll(
                                                              '_',
                                                              ' ',
                                                            ),
                                                        style: const TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      backgroundColor:
                                                          Colors.green.shade600,
                                                      deleteIconColor:
                                                          Colors.white,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              6,
                                                            ),
                                                        side: BorderSide(
                                                          color: Colors
                                                              .green
                                                              .shade700,
                                                        ),
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
                                            ),
                                          ],
                                        ),
                                      ),

                                    _buildPriceRow(
                                      'Subtotal',
                                      currencyFormatter.format(subTotal),
                                    ),
                                    if (discountAmount > 0)
                                      _buildPriceRow(
                                        'Diskon',
                                        '- ${currencyFormatter.format(discountAmount)}',
                                        isDiscount: true,
                                      ),
                                    _buildPriceRow(
                                      'Pajak (PB1)',
                                      currencyFormatter.format(taxAmount),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 12,
                                      ),
                                      child: Divider(),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Total Bayar',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          currencyFormatter.format(grandTotal),
                                          style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.primary,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    AppButton(
                                      label: 'Lanjutkan ke Pembayaran',
                                      onPressed: () {
                                        Navigator.pop(context);
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (context) => PaymentModal(
                                            subtotal: subTotal,
                                            tax: taxAmount,
                                            discount: discountAmount,
                                            cartItems: items,
                                            appliedPromos: appliedPromos,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
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
      },
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
