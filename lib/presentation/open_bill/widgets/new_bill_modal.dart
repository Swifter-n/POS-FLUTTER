import 'package:avis_pos/core/components/buttons.dart';
import 'package:avis_pos/core/components/form_fields.dart';
import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/data/model/payloads/open_bill_payload/open_bill_payload.dart';
import 'package:avis_pos/data/model/responses/table_model/table_model.dart';
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
  int? _selectedTableId;
  int? _selectedTableCapacity;

  // State Member
  int? _selectedMemberId;
  String? _selectedMemberName;

  @override
  void initState() {
    super.initState();
    _selectedTableCode = widget.initialTableCode;
    // Inisialisasi data meja saat modal dibuka
    context.read<TableBloc>().add(const TableEvent.fetch());
  }

  // =========================================================================
  // MODAL CINEMA SEAT PICKER
  // =========================================================================
  void _showCinemaTablePicker(BuildContext context) {
    final int currentGuestCount = int.tryParse(_guestCountController.text) ?? 1;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (modalContext) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.75,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Pilih Meja (Cinema Seat)",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(modalContext),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<TableBloc, TableState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loaded: (tables, _) {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 1.0,
                              ),
                          itemCount: tables.length,
                          itemBuilder: (context, index) {
                            final table = tables[index];

                            // Visual State Logic (Synced with 4-State Logic)
                            final bool isOccupiedFisik =
                                table.isOccupied ?? false;
                            final String resStatus =
                                table.reservationStatus?.toLowerCase() ?? '';
                            final bool isReserved =
                                resStatus == 'booked' || resStatus == 'seated';
                            final bool hasActiveOrder =
                                (table.activeOrderId != null &&
                                table.activeOrderId! > 0);

                            Color cardColor = Colors.white;
                            Color borderColor = Colors.green.shade300;
                            Color textColor = Colors.green.shade700;
                            String badgeText = 'AVAIL';

                            if (hasActiveOrder) {
                              cardColor = Colors.red.shade50;
                              borderColor = Colors.red.shade300;
                              badgeText = 'OPEN';
                              textColor = Colors.red.shade700;
                            } else if (isOccupiedFisik && !isReserved) {
                              cardColor = Colors.blue.shade50;
                              borderColor = Colors.blue.shade300;
                              badgeText = 'LUNAS';
                              textColor = Colors.blue.shade700;
                            } else if (isReserved) {
                              cardColor = Colors.orange.shade50;
                              borderColor = Colors.orange.shade300;
                              badgeText = 'RSVD';
                              textColor = Colors.orange.shade700;
                            }

                            final bool isSelected =
                                _selectedTableCode == table.code;

                            return InkWell(
                              onTap: () {
                                // --- VALIDASI KAPASITAS (POIN 3) ---
                                if (table.capacity != null &&
                                    currentGuestCount > table.capacity!) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Meja ${table.code} kapasitasnya hanya ${table.capacity} pax!',
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }

                                // --- VALIDASI MEJA TERSEDIA (HANYA HIJAU) ---
                                if (badgeText != 'AVAIL' && !isSelected) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Meja ${table.code} sedang berstatus $badgeText.',
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }

                                setState(() {
                                  _selectedTableCode = table.code;
                                  _selectedTableId = table.id;
                                  _selectedTableCapacity = table.capacity;
                                });
                                Navigator.pop(modalContext);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColors.primary
                                      : cardColor,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: isSelected
                                        ? AppColors.primaryDark
                                        : borderColor,
                                    width: isSelected ? 3 : 1,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      table.code,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black87,
                                      ),
                                    ),
                                    Text(
                                      "${table.capacity ?? 0} Pax",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: isSelected
                                            ? Colors.white70
                                            : Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      badgeText,
                                      style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.bold,
                                        color: isSelected
                                            ? Colors.white
                                            : textColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      orElse: () =>
                          const Center(child: CircularProgressIndicator()),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showMemberSearchDialog() {
    // Reset state pencarian sebelumnya
    context.read<MemberBloc>().add(const MemberEvent.clearSelected());

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        final searchController = TextEditingController();
        return StatefulBuilder(
          builder: (stfContext, setDialogState) {
            return BlocConsumer<MemberBloc, MemberState>(
              bloc: context.read<MemberBloc>(),
              listener: (blocContext, state) {
                state.maybeWhen(
                  memberFound: (member) {
                    if (mounted) {
                      setState(() {
                        _selectedMemberId = member.id;
                        _selectedMemberName = member.name;
                        _guestNameController.text = member.name;
                      });
                    }
                    if (Navigator.canPop(dialogContext)) {
                      Navigator.pop(dialogContext);
                    }
                  },
                  error: (msg) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(msg), backgroundColor: Colors.red),
                    );
                  },
                  orElse: () {},
                );
              },
              builder: (blocContext, state) {
                final isLoading = state.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                );

                return AlertDialog(
                  title: const Text('Cari / Scan Member'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Masukkan nomor HP atau Scan QR Member.'),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: searchController,
                              decoration: const InputDecoration(
                                hintText: 'No. HP / Kode Member',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.phone),
                              ),
                              onChanged: (val) {
                                setDialogState(() {});
                              },
                              keyboardType: TextInputType.phone,
                              onSubmitted: (val) {
                                if (val.isNotEmpty && !isLoading) {
                                  blocContext.read<MemberBloc>().add(
                                    MemberEvent.checkMember(val),
                                  );
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(
                              Icons.qr_code_scanner,
                              color: AppColors.primary,
                              size: 32,
                            ),
                            onPressed: () async {
                              final code = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const QRScannerPage(),
                                ),
                              );
                              if (code != null && context.mounted) {
                                blocContext.read<MemberBloc>().add(
                                  MemberEvent.checkMember(code),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.read<MemberBloc>().add(
                          const MemberEvent.clearSelected(),
                        );
                        Navigator.pop(dialogContext);
                      },
                      child: const Text('Batal'),
                    ),
                    ElevatedButton(
                      onPressed: isLoading || searchController.text.isEmpty
                          ? null
                          : () {
                              blocContext.read<MemberBloc>().add(
                                MemberEvent.checkMember(searchController.text),
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                      ),
                      child: Text(
                        isLoading ? 'Mencari...' : 'Cek Member',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
    // 🔥 PENTING: ".then(clearSelected())" DIHAPUS agar CRM Badge tidak hilang
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
            // --- HEADER DENGAN TOMBOL TUTUP ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Buka Meja Baru',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // --- BAGIAN MEMBER (CRM KEMBALI) ---
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
                                // Hapus data di bloc jika kasir menekan tombol X (cancel)
                                context.read<MemberBloc>().add(
                                  const MemberEvent.clearSelected(),
                                );
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
                    hint: 'Cth: 2',
                    onChanged: (value) => setState(() {
                      final int newCount = int.tryParse(value) ?? 1;
                      // AUTO-RESET: Batalkan pilihan meja jika jumlah tamu melebihi kapasitas meja terpilih
                      if (_selectedTableCapacity != null &&
                          newCount > _selectedTableCapacity!) {
                        _selectedTableCode = null;
                        _selectedTableId = null;
                        _selectedTableCapacity = null;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Pilihan meja dibatalkan otomatis karena melebihi kapasitas.',
                            ),
                            backgroundColor: Colors.orange,
                          ),
                        );
                      }
                    }),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Alokasi Meja',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: () => _showCinemaTablePicker(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _selectedTableCode != null
                                  ? AppColors.primary
                                  : Colors.grey.shade300,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: _selectedTableCode != null
                                ? Colors.blue.shade50
                                : Colors.white,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.table_restaurant,
                                size: 18,
                                color: _selectedTableCode != null
                                    ? AppColors.primary
                                    : Colors.grey,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  _selectedTableCode ?? 'Pilih Meja',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: _selectedTableCode != null
                                        ? AppColors.primaryDark
                                        : Colors.black54,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.chevron_right,
                                size: 18,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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

                final int currentGuestCount =
                    int.tryParse(_guestCountController.text) ?? 1;

                // VALIDASI FINAL SEBELUM SUBMIT
                if (_selectedTableCapacity != null &&
                    currentGuestCount > _selectedTableCapacity!) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Gagal! Jumlah tamu ($currentGuestCount) melebihi kapasitas Meja $_selectedTableCode ($_selectedTableCapacity pax).',
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                final payload = OpenBillPayload(
                  typeOrder: 'Open Bill',
                  tableNumber: _selectedTableCode,
                  customerName: _guestNameController.text.isEmpty
                      ? 'Guest'
                      : _guestNameController.text,
                  guestCount: currentGuestCount,
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
