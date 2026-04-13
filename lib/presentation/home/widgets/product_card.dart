import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/data/model/responses/product/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  // --- FUNGSI UNTUK MENAMPILKAN MODAL INFO STOK (SUDAH RESPONSIVE) ---
  void _showStockDetail(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: const EdgeInsets.only(
            top: 20,
            left: 24,
            right: 24,
            bottom: 8,
          ),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.inventory_2_outlined,
                  color: Colors.blue.shade700,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              // ✅ FIX 1: Bungkus Judul dengan Expanded agar tidak overflow ke kanan
              const Expanded(
                child: Text(
                  'Detail Ketersediaan',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          // ✅ FIX 2: Beri batas lebar tegas (maxFinite) agar dialog tidak melebar tak terbatas
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:
                    (product.stockInfo == null || product.stockInfo!.isEmpty)
                    ? [_buildStockRow('STOK SISTEM', '${product.stock ?? 0}')]
                    : product.stockInfo!.entries.map((e) {
                        String cleanKey = e.key
                            .replaceAll('_', ' ')
                            .toUpperCase();
                        return _buildStockRow(cleanKey, '${e.value}');
                      }).toList(),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Tutup',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  // Helper UI untuk baris di dalam modal stok (SUDAH RESPONSIVE)
  Widget _buildStockRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment
            .start, // ✅ FIX 3: Rata atas jika teks terlipat ke bawah
        children: [
          // ✅ FIX 4: Bungkus Label dengan Expanded
          Expanded(
            flex: 3, // Porsi 60% untuk Label
            child: Text(
              label,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // ✅ FIX 5: Bungkus Value dengan Expanded agar turun ke bawah jika nilainya panjang
          Expanded(
            flex: 2, // Porsi 40% untuk Value
            child: Text(
              value,
              textAlign: TextAlign.right, // Rata kanan agar rapi
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    final bool hasAddons = product.addons != null && product.addons!.isNotEmpty;

    // --- LOGIKA PROMO DINAMIS ---
    final bool hasPromo =
        product.promotions != null && product.promotions!.isNotEmpty;
    String promoLabel = 'PROMO';

    if (hasPromo) {
      final firstPromo = product.promotions!.first;
      if (firstPromo is Map<String, dynamic>) {
        // Coba ambil NAMA promonya terlebih dahulu dari API
        final promoName = firstPromo['name']?.toString() ?? '';
        final ruleType = firstPromo['type']?.toString() ?? '';

        if (promoName.isNotEmpty) {
          promoLabel = promoName.toUpperCase();
        } else if (ruleType == 'bogo_same_item' || ruleType == 'bogo') {
          // Fallback jika tidak ada nama
          promoLabel = 'Beli 1 Gratis 1';
        } else if (ruleType.isNotEmpty) {
          // Fallback terakhir
          promoLabel = ruleType.toUpperCase().replaceAll('_', ' ');
        }
      }
    }

    return InkWell(
      onTap: onTap, // Selalu bisa diklik
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade100, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // --- GAMBAR PRODUK ---
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade100),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: product.thumbnail != null
                          ? CachedNetworkImage(
                              imageUrl: product.thumbnail!,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Center(
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.fastfood,
                                color: Colors.grey,
                                size: 32,
                              ),
                            )
                          : const Icon(
                              Icons.fastfood,
                              color: Colors.grey,
                              size: 32,
                            ),
                    ),
                  ),

                  // --- BADGE FAVORITE ---
                  if (product.isPopular == true)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.pink.shade500,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.favorite, color: Colors.white, size: 10),
                          ],
                        ),
                      ),
                    ),

                  // --- BADGE PROMO & TOPPING ---
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (hasPromo)
                          Container(
                            margin: const EdgeInsets.only(bottom: 4),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red.shade600,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.local_offer,
                                  color: Colors.white,
                                  size: 10,
                                ),
                                const SizedBox(width: 4),
                                // Teks Promo Name Akan Muncul di Sini!
                                Flexible(
                                  child: Text(
                                    promoLabel,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (hasAddons)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              '+ Topping',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9,
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
            const SizedBox(height: 12),

            // --- AREA INFORMASI TEKS ---
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name ?? '-',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),

                // --- TOMBOL INFO STOK ELEGAN ---
                GestureDetector(
                  onTap: () => _showStockDetail(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.blue.shade100),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: 12,
                          color: Colors.blue.shade700,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Cek Info Stok',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Harga
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    currencyFormatter.format(product.price ?? 0),
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
