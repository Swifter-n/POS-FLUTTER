import 'package:avis_pos/core/components/buttons.dart';
import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/presentation/member/bloc/member/member_bloc.dart';
import 'package:avis_pos/presentation/member/widgets/member_register_dialog.dart';
import 'package:avis_pos/presentation/member/widgets/reward_catalog_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MemberListPage extends StatefulWidget {
  const MemberListPage({super.key});

  @override
  State<MemberListPage> createState() => _MemberListPageState();
}

class _MemberListPageState extends State<MemberListPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<MemberBloc>().add(const MemberEvent.fetchMembers());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _openRegisterDialog() async {
    final result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const MemberRegisterDialog(),
    );

    // Jika dialog return true (sukses daftar), refresh list
    if (result == true) {
      context.read<MemberBloc>().add(const MemberEvent.fetchMembers());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Manajemen Member',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // --- HEADER SEARCH ---
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Cari nama atau nomor HP member...',
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear, size: 20),
                        onPressed: () {
                          _searchController.clear();
                          context.read<MemberBloc>().add(
                            const MemberEvent.fetchMembers(),
                          );
                        },
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    ),
                    onSubmitted: (value) {
                      context.read<MemberBloc>().add(
                        MemberEvent.fetchMembers(search: value),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                AppButton(
                  label: '+ Tambah Member',
                  onPressed: _openRegisterDialog,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // --- LIST KONTEN MEMBER ---
            Expanded(
              child: BlocBuilder<MemberBloc, MemberState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    ),
                    error: (msg) => Center(
                      child: Text(
                        msg,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                    loaded: (members) {
                      if (members.isEmpty) {
                        return const Center(
                          child: Text('Belum ada data member.'),
                        );
                      }

                      return ListView.separated(
                        itemCount: members.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final member = members[index];

                          // Badge Tier Color
                          Color tierColor = Colors.grey.shade600;
                          if (member.tier.toLowerCase() == 'gold')
                            tierColor = Colors.amber.shade600;
                          if (member.tier.toLowerCase() == 'platinum')
                            tierColor = Colors.deepPurple.shade400;

                          return Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: AppColors.stroke),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 28,
                                  backgroundColor: AppColors.primaryLight,
                                  child: Text(
                                    member.name.isNotEmpty
                                        ? member.name[0].toUpperCase()
                                        : '?',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: AppColors.primaryDark,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            member.name,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: tierColor.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color: tierColor,
                                              ),
                                            ),
                                            child: Text(
                                              member.tier,
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: tierColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.phone,
                                            size: 14,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            member.phone,
                                            style: TextStyle(
                                              color: Colors.grey.shade700,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.stars,
                                          color: Colors.orange,
                                          size: 18,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '${member.currentPoints} Poin',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.orange,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),

                                    OutlinedButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) =>
                                              RewardCatalogDialog(
                                                member: member,
                                              ),
                                        );
                                      },
                                      style: OutlinedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 0,
                                        ),
                                        minimumSize: const Size(0, 32),
                                        side: const BorderSide(
                                          color: AppColors.primary,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        'Tukar Poin',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ),

                                    const SizedBox(height: 4),
                                    if (member.lastVisit != null)
                                      Text(
                                        'Visit: ${member.lastVisit}',
                                        style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontSize: 11,
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    orElse: () => const Center(child: Text('Tidak ada data.')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
