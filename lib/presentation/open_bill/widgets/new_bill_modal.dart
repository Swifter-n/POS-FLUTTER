import 'package:avis_pos/core/components/buttons.dart';
import 'package:avis_pos/core/components/form_fields.dart';
import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/data/model/payloads/open_bill_payload/open_bill_payload.dart';
import 'package:avis_pos/presentation/member/bloc/member/member_bloc.dart';
import 'package:avis_pos/presentation/open_bill/bloc/open_bill/open_bill_bloc.dart';
import 'package:avis_pos/presentation/open_bill/pages/qr_scanner_page.dart';
import 'package:avis_pos/presentation/settings/bloc/table/table_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class NewBillModal extends StatefulWidget {
  final String? initialTableCode;
  const NewBillModal({super.key, this.initialTableCode});

  @override
  State<NewBillModal> createState() => _NewBillModalState();
}

class _NewBillModalState extends State<NewBillModal> {
  final _guestNameController = TextEditingController();
  final _guestCountController = TextEditingController(text: '1');
  String? _selectedTableCode;

  // State Member
  int? _selectedMemberId;
  String? _selectedMemberName;

  @override
  void initState() {
    super.initState();
    _selectedTableCode = widget.initialTableCode;
  }

  void _showMemberSearchDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        String searchInput = '';
        return BlocConsumer<MemberBloc, MemberState>(
          listener: (context, state) {
            state.maybeWhen(
              memberFound: (member) {
                if (!context.mounted) return;
                setState(() {
                  _selectedMemberId = member.id;
                  _selectedMemberName = member.name;
                  _guestNameController.text =
                      member.name; // Otomatis isi nama tamu
                });
                // Pastikan pop hanya terjadi jika dialog ini memang yang aktif
                if (Navigator.canPop(dialogContext)) {
                  Navigator.pop(dialogContext);
                }
              },
              error: (msg) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(msg), backgroundColor: Colors.red),
              ),
              orElse: () {},
            );
          },
          builder: (context, state) {
            final isLoading = state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            );
            return AlertDialog(
              title: const Text('Cari / Scan Member'),
              content: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'No. HP / Kode',
                      ),
                      onChanged: (val) => searchInput = val,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.qr_code_scanner,
                      color: AppColors.primary,
                    ),
                    onPressed: () async {
                      final code = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const QRScannerPage(),
                        ),
                      );
                      if (code != null && context.mounted)
                        context.read<MemberBloc>().add(
                          MemberEvent.checkMember(code),
                        );
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: const Text('Batal'),
                ),
                ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () => context.read<MemberBloc>().add(
                          MemberEvent.checkMember(searchInput),
                        ),
                  child: Text(isLoading ? 'Mencari...' : 'Cek'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: 450,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Buka Meja Baru',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            // --- BAGIAN MEMBER ---
            const Text(
              'Pelanggan (Opsional)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 8),
            _selectedMemberId != null
                ? Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primary),
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.account_circle,
                              color: AppColors.primary,
                              size: 32,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _selectedMemberName!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Text(
                                    'Member Loyal',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.cancel, color: Colors.red),
                              onPressed: () => setState(() {
                                _selectedMemberId = null;
                                _selectedMemberName = null;
                              }),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      BlocBuilder<MemberBloc, MemberState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            memberFound: (member) => Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                _buildCrmBadge(
                                  Icons.workspace_premium,
                                  'Tier: ${member.tier ?? "Basic"}',
                                  Colors.orange,
                                ),
                                _buildCrmBadge(
                                  Icons.history,
                                  'Visit: ${member.lastVisit ?? "-"}',
                                  Colors.blue,
                                ),
                                _buildCrmBadge(
                                  Icons.favorite,
                                  'Fav: ${member.favoriteProduct ?? "-"}',
                                  Colors.pink,
                                ),
                                _buildCrmBadge(
                                  Icons.monetization_on,
                                  'Total Spend: ${currencyFormatter.format(member.totalSpend ?? 0)}',
                                  Colors.green,
                                ),
                              ],
                            ),
                            orElse: () => const SizedBox(),
                          );
                        },
                      ),
                    ],
                  )
                : OutlinedButton.icon(
                    onPressed: _showMemberSearchDialog,
                    icon: const Icon(Icons.person_search),
                    label: const Text('Scan / Cari Member'),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

            const SizedBox(height: 16),
            AppTextField(
              label: 'Nama Tamu',
              controller: _guestNameController,
              hint: 'Ketik nama tamu...',
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    label: 'Jumlah Orang',
                    controller: _guestCountController,
                    keyboardType: TextInputType.number,
                    hint: 'Jumlah orang...',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: BlocBuilder<TableBloc, TableState>(
                    builder: (context, state) {
                      final tables = state.maybeWhen(
                        loaded: (data, _) => data,
                        orElse: () => [],
                      );
                      return DropdownButtonFormField<String>(
                        value: _selectedTableCode,
                        decoration: const InputDecoration(
                          labelText: 'Pilih Meja',
                          border: OutlineInputBorder(),
                        ),
                        items: tables
                            .where((t) => t.status == 'available')
                            .map(
                              (t) => DropdownMenuItem<String>(
                                value: t.code,
                                child: Text(t.code),
                              ),
                            )
                            .toList(),
                        onChanged: (val) =>
                            setState(() => _selectedTableCode = val),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            AppButton(
              label: 'BUKA MEJA & ORDER',
              onPressed: () {
                if (_selectedTableCode == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Pilih meja dahulu!')),
                  );
                  return;
                }

                final payload = OpenBillPayload(
                  typeOrder: 'Open Bill',
                  tableNumber: _selectedTableCode,
                  customerName: _guestNameController.text.isEmpty
                      ? 'Guest'
                      : _guestNameController.text,
                  guestCount: int.tryParse(_guestCountController.text) ?? 1,
                  memberId: _selectedMemberId,
                );

                context.read<OpenBillBloc>().add(
                  OpenBillEvent.createOpenBill(payload),
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCrmBadge(IconData icon, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: color.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }
}
