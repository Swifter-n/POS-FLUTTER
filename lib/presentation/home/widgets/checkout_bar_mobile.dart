import 'package:avis_pos/core/components/buttons.dart';
import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/presentation/home/bloc/cart/cart_bloc.dart';
import 'package:avis_pos/presentation/home/widgets/payment_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CheckoutBarMobile extends StatelessWidget {
  const CheckoutBarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return state.maybeWhen(
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
                orderType,
                customerName,
              ) {
                if (items.isEmpty) return const SizedBox.shrink();

                final int totalItems = items.fold(
                  0,
                  (sum, item) => sum + item.quantity.toInt(),
                );
                double grandTotal = subTotal + taxAmount - discountAmount;
                if (grandTotal < 0) grandTotal = 0;

                // ✅ LOGIKA LABEL TOMBOL DINAMIS
                String buttonLabel = 'Bayar';
                if (activeOrder != null) {
                  buttonLabel = 'SIMPAN TAMBAHAN';
                } else if (tableNumber != null) {
                  buttonLabel = 'LANJUT PESANAN';
                }

                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
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
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '$totalItems Item',
                                    style: const TextStyle(
                                      color: AppColors.textSecondary,
                                      fontSize: 12,
                                    ),
                                  ),
                                  if (appliedPromos.isNotEmpty) ...[
                                    const SizedBox(width: 6),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 4,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.green.shade100,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        'PROMO',
                                        style: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green.shade800,
                                        ),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                              Text(
                                currencyFormatter.format(grandTotal),
                                style: const TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: activeOrder != null || tableNumber != null
                              ? 170
                              : 140, // Lebarkan sedikit jika label panjang
                          child: AppButton(
                            label: buttonLabel,
                            onPressed: () {
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
                        ),
                      ],
                    ),
                  ),
                );
              },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
