import 'package:avis_pos/data/model/payloads/cart_item_payload/cart_item_payload.dart';
import 'package:avis_pos/presentation/home/bloc/cart/cart_bloc.dart';
import 'package:avis_pos/presentation/home/bloc/product/product_bloc.dart';
import 'package:avis_pos/presentation/home/widgets/addon_selection_dialog.dart';
import 'package:avis_pos/presentation/home/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (message) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  message,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          loaded: (products) {
            if (products.isEmpty) {
              return _buildEmptyState();
            }

            return GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 220,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return ProductCard(
                  product: product,
                  onTap: () async {
                    print('✅ >>> TOMBOL PRODUCT DITEKAN: ${product.name}');
                    // 1. Tampilkan Dialog dan tunggu hasilnya (CartItemPayload)
                    final CartItemPayload? result =
                        await showDialog<CartItemPayload>(
                          context: context,
                          barrierDismissible: false,
                          builder: (dialogContext) =>
                              AddonSelectionDialog(product: product),
                        );

                    // 2. Jika kasir mengklik "Tambah ke Keranjang" (result tidak null)
                    if (result != null && context.mounted) {
                      // 3. Masukkan ke dalam CartBloc
                      context.read<CartBloc>().add(CartEvent.addItem(result));

                      // 4. Notifikasi sukses
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${product.name ?? 'Produk'} ditambahkan!',
                          ),
                          backgroundColor: Colors.green,
                          duration: const Duration(milliseconds: 800),
                        ),
                      );
                    }
                  },
                );
              },
            );
          },
          orElse: () => _buildEmptyState(),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: 64,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 16),
          Text(
            'Tidak ada produk di kategori ini',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
