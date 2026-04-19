import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/data/model/responses/member_model/member_model.dart';
import 'package:avis_pos/presentation/reward/bloc/reward/reward_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class RewardCatalogDialog extends StatefulWidget {
  final MemberModel member;

  const RewardCatalogDialog({super.key, required this.member});

  @override
  State<RewardCatalogDialog> createState() => _RewardCatalogDialogState();
}

class _RewardCatalogDialogState extends State<RewardCatalogDialog> {
  late double _currentPoints;

  @override
  void initState() {
    super.initState();
    _currentPoints = widget.member.currentPoints ?? 0.0;

    // ✅ FIX: Gunakan Future.microtask agar tidak memicu
    // semantics dirty saat dialog pertama kali dirender
    Future.microtask(() {
      if (mounted) {
        context.read<RewardBloc>().add(const RewardEvent.fetchCatalog());
      }
    });
  }

  void _showRedeemConfirmation(
    BuildContext context,
    int rewardId,
    String rewardName,
    int pointsRequired,
  ) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text(
          'Konfirmasi Penukaran',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(
          'Apakah pelanggan ingin menukarkan $pointsRequired poin untuk mendapatkan "$rewardName"?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.read<RewardBloc>().add(
                RewardEvent.redeemReward(rewardId, widget.member.id),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            child: const Text(
              'Ya, Tukarkan',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: 800,
        height: 600,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- HEADER ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Katalog Tukar Poin',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Pelanggan: ${widget.member.name}',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.orange.shade200),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.stars, color: Colors.orange),
                      const SizedBox(width: 8),
                      Text(
                        'Poin Aktif: ${NumberFormat.decimalPattern('id').format(_currentPoints)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.orange.shade800,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 32),

            // --- KONTEN ---
            Expanded(
              child: BlocConsumer<RewardBloc, RewardState>(
                listener: (context, state) {
                  state.maybeWhen(
                    redeemSuccess: (voucherCode, remainingPoints) {
                      if (!mounted) return;
                      setState(() {
                        _currentPoints = (remainingPoints as num).toDouble();
                      });

                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 80,
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'Penukaran Berhasil!',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Kode Voucher Pelanggan:',
                                style: TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: SelectableText(
                                  voucherCode,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'Voucher otomatis masuk ke akun pelanggan dan bisa dipakai saat pembayaran.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(ctx);
                                  // ✅ FIX: Juga pakai microtask saat refresh setelah redeem
                                  Future.microtask(() {
                                    if (mounted) {
                                      context.read<RewardBloc>().add(
                                        const RewardEvent.fetchCatalog(),
                                      );
                                    }
                                  });
                                },
                                child: const Text('Tutup'),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    error: (msg) {
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(msg),
                          backgroundColor: Colors.red,
                        ),
                      );
                    },
                    orElse: () {},
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    catalogLoaded: (rewards) {
                      if (rewards.isEmpty) {
                        return const Center(
                          child: Text('Belum ada katalog hadiah yang aktif.'),
                        );
                      }

                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 0.85,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                        itemCount: rewards.length,
                        itemBuilder: (context, index) {
                          final reward = rewards[index];
                          final bool isEnoughPoints =
                              _currentPoints >= reward.pointsRequired;

                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: isEnoughPoints
                                    ? AppColors.primary
                                    : Colors.grey.shade300,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: isEnoughPoints
                                          ? AppColors.primaryLight
                                          : Colors.grey.shade100,
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(16),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.card_giftcard,
                                      size: 64,
                                      color: isEnoughPoints
                                          ? AppColors.primary
                                          : Colors.grey.shade400,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    children: [
                                      Text(
                                        reward.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        '${NumberFormat.decimalPattern('id').format(reward.pointsRequired)} Poin',
                                        style: TextStyle(
                                          color: Colors.orange.shade800,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: isEnoughPoints
                                              ? () => _showRedeemConfirmation(
                                                  context,
                                                  reward.id,
                                                  reward.name,
                                                  reward.pointsRequired,
                                                )
                                              : null,
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.primary,
                                            disabledBackgroundColor:
                                                Colors.grey.shade300,
                                          ),
                                          child: Text(
                                            isEnoughPoints
                                                ? 'Tukar Poin'
                                                : 'Poin Kurang',
                                            style: TextStyle(
                                              color: isEnoughPoints
                                                  ? Colors.white
                                                  : Colors.grey.shade600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    orElse: () =>
                        const Center(child: Text('Memuat katalog hadiah...')),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Tutup Jendela',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
