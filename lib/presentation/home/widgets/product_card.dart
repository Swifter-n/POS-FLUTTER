import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/core/constants/variables.dart';
import 'package:avis_pos/data/model/responses/product/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  // --- FUNGSI UNTUK MENAMPILKAN MODAL DETAIL PROMO ---
  void _showPromoDetail(BuildContext context) {
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
                  color: Colors.red.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.local_offer,
                  color: Colors.red.shade700,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Promo Tersedia',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:
                    product.promotions?.map((promo) {
                      String name = '-';
                      String type = '';
                      if (promo is Map<String, dynamic>) {
                        name = promo['name']?.toString() ?? '-';
                        type = (promo['type']?.toString() ?? '')
                            .replaceAll('_', ' ')
                            .toUpperCase();
                      }
                      return _buildPromoRow(name, type);
                    }).toList() ??
                    [],
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

  // Helper UI untuk baris di dalam modal promo
  Widget _buildPromoRow(String name, String type) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.red.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.stars, color: Colors.orange.shade700, size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
          if (type.isNotEmpty) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                type,
                style: TextStyle(
                  color: Colors.red.shade800,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

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
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade50),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.inventory_2, size: 14, color: Colors.blue.shade300),
          const SizedBox(width: 10),
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.blue.shade900,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 16,
              color: Colors.blue.shade700,
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

    // --- LOGIKA PROMO DINAMIS (PREMIUM CLEANUP) ---
    final bool hasPromo =
        product.promotions != null && product.promotions!.isNotEmpty;
    String promoLabel = 'PROMO';
    int extraPromoCount = 0;

    if (hasPromo) {
      final promos = product.promotions!;
      extraPromoCount = promos.length - 1;
      final firstPromo = promos.first;

      if (firstPromo is Map<String, dynamic>) {
        final promoName = firstPromo['name']?.toString() ?? '';
        final ruleType = firstPromo['type']?.toString() ?? '';

        if (promoName.isNotEmpty) {
          promoLabel = promoName.toUpperCase();
        } else if (ruleType == 'bogo_same_item' || ruleType == 'bogo') {
          promoLabel = 'Beli 1 Gratis 1';
        } else if (ruleType.isNotEmpty) {
          promoLabel = ruleType.toUpperCase().replaceAll('_', ' ');
        }
      }
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      splashColor: AppColors.primary.withOpacity(0.1),
      highlightColor: AppColors.primary.withOpacity(0.05),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.grey.shade100, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            // --- AREA IMAGE & BADGES ---
            Expanded(
              flex: 5,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // --- GAMBAR PRODUK ---
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.grey.shade50,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: product.thumbnail != null
                          ? CachedNetworkImage(
                              imageUrl: product.thumbnail!.startsWith('http')
                                  ? product.thumbnail!
                                  : '${Variables.imageBaseUrl}${product.thumbnail}',
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: AppColors.primary.withOpacity(0.5),
                                ),
                              ),
                              errorWidget: (context, url, error) => Icon(
                                Icons.fastfood_rounded,
                                color: Colors.grey.shade300,
                                size: 40,
                              ),
                            )
                          : Icon(
                              Icons.fastfood_rounded,
                              color: Colors.grey.shade300,
                              size: 40,
                            ),
                    ),
                  ),

                  // --- BADGE FAVORITE (LEFT TOP) ---
                  if (product.isPopular == true)
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.pink.shade500,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.pink.withOpacity(0.3),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 12,
                        ),
                      ),
                    ),

                  // --- BADGE PROMO & TOPPING (RIGHT TOP) ---
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (hasPromo)
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              _showPromoDetail(context);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 6),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              constraints: const BoxConstraints(maxWidth: 130),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.red.shade600,
                                    Colors.orange.shade700,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.red.withOpacity(0.3),
                                    blurRadius: 6,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.local_offer_rounded,
                                    color: Colors.white,
                                    size: 10,
                                  ),
                                  const SizedBox(width: 4),
                                  Flexible(
                                    child: Text(
                                      extraPromoCount > 0
                                          ? "$promoLabel (+$extraPromoCount)"
                                          : promoLabel,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 9,
                                        fontWeight: FontWeight.w900,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
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
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withOpacity(0.2),
                                  blurRadius: 4,
                                ),
                              ],
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
            const SizedBox(height: 14),

            // --- AREA INFORMASI TEKS ---
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name ?? '-',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),

                  // TOMBOL INFO STOK ELEGANT
                  InkWell(
                    onTap: () => _showStockDetail(context),
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blue.shade100),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.inventory_2_outlined,
                            size: 13,
                            color: Colors.blue.shade700,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Cek Info Stok',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              color: Colors.blue.shade800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // HARGA
                  Text(
                    currencyFormatter.format(product.price ?? 0),
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w900,
                      fontSize: 17,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
