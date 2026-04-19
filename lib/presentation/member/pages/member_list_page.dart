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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // ✅ Tetap pakai Future.microtask (sudah benar dari fix sebelumnya)
    Future.microtask(() {
      if (mounted) {
        context.read<MemberBloc>().add(const MemberEvent.fetchMembers());
      }
    });
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

    if (result == true && mounted) {
      context.read<MemberBloc>().add(const MemberEvent.fetchMembers());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
      body: CustomScrollView(
        slivers: [
          // --- STICKY / STATIC HEADER ---
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Cari nama atau nomor HP member...',
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
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
                  Flexible(
                    child: AppButton(
                      label: '+ Member',
                      onPressed: _openRegisterDialog,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // --- LIST KONTEN MEMBER ---
          BlocBuilder<MemberBloc, MemberState>(
            buildWhen: (previous, current) {
              return current.maybeMap(
                loaded: (_) => true,
                loading: (_) => true,
                error: (_) => true,
                initial: (_) => true,
                orElse: () => false,
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => const SliverFillRemaining(
                  hasScrollBody: false,
                  child: ExcludeSemantics(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                error: (msg) => SliverFillRemaining(
                  hasScrollBody: false,
                  child: ExcludeSemantics(
                    child: Center(
                      child: Text(
                        msg,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ),
                loaded: (members) {
                  if (members.isEmpty) {
                    return const SliverFillRemaining(
                      hasScrollBody: false,
                      child: ExcludeSemantics(
                        child: Center(child: Text('Belum ada data member.')),
                      ),
                    );
                  }

                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        // Gunakan index untuk separator logic secara manual di SliverList
                        // Atau gunakan SliverList.separated jika Flutter versi terbaru
                        final member = members[index];

                        Color tierColor = Colors.grey.shade600;
                        if (member.tier.toLowerCase() == 'gold') {
                          tierColor = Colors.amber.shade600;
                        }
                        if (member.tier.toLowerCase() == 'platinum') {
                          tierColor = Colors.deepPurple.shade400;
                        }

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: RepaintBoundary(
                            child: Material(
                              color: Colors.transparent,
                              child: Container(
                                key: ValueKey('member_${member.id}'),
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
                                              Flexible(
                                                child: Text(
                                                  member.name,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 2,
                                                    ),
                                                decoration: BoxDecoration(
                                                  color: tierColor.withOpacity(
                                                    0.1,
                                                  ),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
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
                                                fontSize: 14,
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
                                              builder: (ctx) =>
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
                                              borderRadius:
                                                  BorderRadius.circular(8),
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
                              ),
                            ),
                          ),
                        );
                      }, childCount: members.length),
                    ),
                  );
                },
                orElse: () => const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(child: Text('Tidak ada data.')),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
