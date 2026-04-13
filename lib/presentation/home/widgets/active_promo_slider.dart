import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/presentation/home/bloc/promo/promo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivePromoSlider extends StatelessWidget {
  const ActivePromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PromoBloc, PromoState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (promos) {
            // Sembunyikan slider jika tidak ada promo aktif
            if (promos.isEmpty) return const SizedBox.shrink();

            return SizedBox(
              height: 120, // Tinggi slider
              child: PageView.builder(
                controller: PageController(
                  viewportFraction: 0.9,
                ), // Agar preview kartu selanjutnya terlihat
                itemCount: promos.length,
                itemBuilder: (context, index) {
                  final promo = promos[index];

                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColors.primary, AppColors.primaryDark],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors
                                      .tertiary, // Mustard Gold dari AppColors
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Text(
                                  'PROMO SPESIAL',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                promo.name ?? 'Promo Spesial',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        // Icon Dekorasi di sebelah kanan banner
                        const Icon(
                          Icons.local_offer,
                          color: Colors.white54,
                          size: 56,
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
