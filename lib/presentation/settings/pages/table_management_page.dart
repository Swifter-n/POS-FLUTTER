import 'package:avis_pos/core/components/buttons.dart';
import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/data/model/responses/order_model/order_model.dart';
import 'package:avis_pos/data/model/responses/table_model/table_model.dart';
import 'package:avis_pos/presentation/home/bloc/cart/cart_bloc.dart';
import 'package:avis_pos/presentation/open_bill/bloc/open_bill/open_bill_bloc.dart';
import 'package:avis_pos/presentation/open_bill/pages/order_detail_page.dart';
import 'package:avis_pos/presentation/open_bill/widgets/new_bill_modal.dart';
import 'package:avis_pos/presentation/settings/bloc/table/table_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TableManagementPage extends StatefulWidget {
  const TableManagementPage({super.key});

  @override
  State<TableManagementPage> createState() => _TableManagementPageState();
}

class _TableManagementPageState extends State<TableManagementPage> {
  bool _isEditMode = false;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() {
    context.read<TableBloc>().add(const TableEvent.fetch());
    context.read<OpenBillBloc>().add(const OpenBillEvent.fetchOpenBills());
  }

  // =========================================================================
  // FUNGSI CRUD MEJA (MEMANGGIL EXISTING BLOC)
  // =========================================================================
  void _showAddEditTableDialog({TableModel? existingTable}) {
    final isEdit = existingTable != null;
    final codeController = TextEditingController(
      text: isEdit ? existingTable.code : '',
    );
    final capacityController = TextEditingController(
      text: isEdit ? (existingTable.capacity?.toString() ?? '4') : '4',
    );

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(isEdit ? 'Edit Meja' : 'Tambah Meja Baru'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: codeController,
              decoration: const InputDecoration(
                labelText: 'Kode Meja (Cth: T-01)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: capacityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Kapasitas Kursi',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          if (isEdit)
            TextButton(
              onPressed: () {
                context.read<TableBloc>().add(
                  TableEvent.deleteTable(existingTable.id),
                );
                Navigator.pop(dialogContext);
                setState(() => _isEditMode = false); // Keluar edit mode
              },
              child: const Text(
                'Hapus Meja',
                style: TextStyle(color: Colors.red),
              ),
            ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              if (codeController.text.isEmpty) return;
              final data = {
                'code': codeController.text,
                'capacity': int.tryParse(capacityController.text) ?? 4,
              };

              if (isEdit) {
                context.read<TableBloc>().add(
                  TableEvent.updateTable(existingTable.id, data),
                );
              } else {
                context.read<TableBloc>().add(TableEvent.addTable(data));
              }

              Navigator.pop(dialogContext);
              setState(() => _isEditMode = false);
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            child: const Text('Simpan', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showVoidOrderDialog(TableModel table, OrderModel? activeOrder) {
    final int? orderId = activeOrder?.id ?? table.activeOrderId;
    final reasonController = TextEditingController();

    if (orderId == null) return;

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Batalkan Pesanan (Void)'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Apakah Anda yakin ingin membatalkan seluruh pesanan di Meja ${table.code}?',
              ),
              const SizedBox(height: 16),
              TextField(
                controller: reasonController,
                decoration: const InputDecoration(
                  labelText: 'Alasan Pembatalan',
                  hintText: 'Contoh: Pelanggan mendadak pergi',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                context.read<TableBloc>().add(
                  TableEvent.voidOrder(
                    orderId: orderId,
                    reason: reasonController.text,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text(
                'Ya, Batalkan',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showTransferTableDialog(
    TableModel sourceTable,
    OrderModel? activeOrder,
  ) {
    // Ambil ID pesanan dari parameter activeOrder atau dari relasi meja
    final int? orderIdToMove = activeOrder?.id ?? sourceTable.activeOrderId;

    if (orderIdToMove == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Gagal: Tidak ada pesanan aktif di meja ini.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'Pindah dari Meja ${sourceTable.code}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: SizedBox(
            width: double.maxFinite,
            height: 350, // Membatasi tinggi dialog agar tidak kepanjangan
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pilih meja kosong tujuan untuk pelanggan:',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: BlocBuilder<TableBloc, TableState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        loaded: (tables, _) {
                          // 👇 Filter khusus: Hanya tampilkan meja yang TIDAK OCCUPIED
                          final availableTables = tables.where((t) {
                            final bool isOccupied = t.isOccupied ?? false;
                            return !isOccupied && t.code != sourceTable.code;
                          }).toList();

                          if (availableTables.isEmpty) {
                            return const Center(
                              child: Text(
                                'Maaf, tidak ada meja kosong saat ini.',
                              ),
                            );
                          }

                          return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      3, // Tampilkan 3 Meja per baris
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12,
                                  childAspectRatio: 1.2,
                                ),
                            itemCount: availableTables.length,
                            itemBuilder: (context, index) {
                              final targetTable = availableTables[index];
                              return InkWell(
                                onTap: () {
                                  // Tutup Dialog UI
                                  Navigator.pop(dialogContext);

                                  // Eksekusi Event Pindah Meja ke BLoC
                                  context.read<TableBloc>().add(
                                    TableEvent.transferTable(
                                      orderId: orderIdToMove,
                                      targetTableCode: targetTable.code ?? '',
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Text(
                                      targetTable.code ?? '',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
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
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Batal', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _showReservationCheckInMenu(TableModel table) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Reservasi Meja ${table.code}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text("Atas Nama: ${table.reservedCustomerName ?? '-'}"),
            const SizedBox(height: 24),
            AppButton(
              label: "KONFIRMASI KEDATANGAN (CHECK-IN)",
              onPressed: () {
                // 1. 🔥 Panggil API Check-in ke Backend agar status berubah jadi 'seated'
                context.read<TableBloc>().add(TableEvent.checkIn(table.id));

                // 2. Set konteks meja di keranjang
                context.read<CartBloc>().add(
                  CartEvent.setContext(tableNumber: table.code),
                );

                Navigator.pop(context); // Tutup BottomSheet
                Navigator.popUntil(
                  context,
                  (route) => route.isFirst,
                ); // Ke Home

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Meja ${table.code} telah Check-in. Silakan input pesanan.',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // =========================================================================
  // LOGIKA MENU AKSI KASIR
  // =========================================================================

  // ✅ SYNC GANDA: activeOrder di-pass dari BlocBuilder (selalu reaktif & up-to-date)
  void _handleTableTap(TableModel table, OrderModel? activeOrder) {
    if (_isEditMode) {
      _showAddEditTableDialog(existingTable: table);
      return;
    }

    final String? resStatus = table.reservationStatus;
    final bool isBooked = (resStatus == 'booked');
    final bool isSeated = (resStatus == 'seated');
    final bool isOccupiedFisik = table.isOccupied ?? false;

    if (isBooked) {
      // JIKA MASIH BOOKED: Hanya tampilkan menu Check-in
      _showReservationCheckInMenu(table);
    } else if (isSeated || isOccupiedFisik) {
      // JIKA SEATED ATAU WALK-IN: Tampilkan menu aksi (Lihat Tagihan/Tambah Pesanan)
      _showTableActionMenu(table, activeOrder);
    } else {
      // JIKA KOSONG: Menu buka bill baru
      showDialog(
        context: context,
        builder: (context) => NewBillModal(initialTableCode: table.code),
      );
    }
  }

  void _showTableActionMenu(TableModel table, OrderModel? activeOrder) {
    bool hasActiveOrder = (activeOrder != null);
    bool isSeated = (table.reservationStatus == 'seated');

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.only(
            top: 24,
            bottom: 32,
            left: 24,
            right: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kendali Meja ${table.code}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Pilih aksi untuk meja ini',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.grey),
                    onPressed: () => Navigator.pop(bottomSheetContext),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Divider(),
              ),

              // ==============================================================
              // KONDISI A: TIDAK ADA TAGIHAN AKTIF (Baru Check-in / Lunas)
              // ==============================================================
              if (!hasActiveOrder) ...[
                // 🔥 1. JIKA MEJA INI RESERVASI BARU DATANG
                if (isSeated)
                  _buildMenuAction(
                    icon: Icons.add_shopping_cart,
                    color: Colors.deepOrange.shade700,
                    title: 'Isi Pesanan Reservasi',
                    subtitle: 'Input menu untuk ${table.reservedCustomerName}',
                    onTap: () {
                      Navigator.pop(bottomSheetContext);
                      // 👉 Kunci: Kirim tipe pesanan secara EKPLISIT ke Keranjang
                      context.read<CartBloc>().add(
                        CartEvent.setContext(
                          tableNumber: table.code,
                          orderType: 'Reservasi',
                          customerName: table.reservedCustomerName,
                        ),
                      );
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                  ),

                // 🔥 2. JIKA MEJA INI WALK-IN BIASA / DINE IN LUNAS
                if (!isSeated)
                  _buildMenuAction(
                    icon: Icons.add_shopping_cart,
                    color: Colors.blue.shade600,
                    title: 'Tambah Pesanan',
                    subtitle: 'Buat tagihan baru di meja ini',
                    onTap: () {
                      Navigator.pop(bottomSheetContext);
                      // 👉 Kunci: Kirim tipe pesanan secara EKPLISIT ke Keranjang
                      context.read<CartBloc>().add(
                        CartEvent.setContext(
                          tableNumber: table.code,
                          orderType: 'Dine In',
                        ),
                      );
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                  ),

                // 🔥 3. KOSONGKAN MEJA
                _buildMenuAction(
                  icon: Icons.cleaning_services,
                  color: Colors.grey.shade700,
                  title: 'Kosongkan Meja (Clear Table)',
                  subtitle: 'Bersihkan meja jika pelanggan sudah pulang',
                  onTap: () {
                    Navigator.pop(bottomSheetContext);
                    _confirmClearTable(table);
                  },
                ),
              ],

              // ==============================================================
              // KONDISI B: ADA TAGIHAN AKTIF (SEDANG MAKAN)
              // ==============================================================
              if (hasActiveOrder) ...[
                _buildMenuAction(
                  icon: Icons.receipt_long,
                  color: Colors.green.shade600,
                  title: 'Lihat / Bayar Tagihan',
                  subtitle: 'Buka bill untuk tambah pesanan atau pelunasan',
                  onTap: () {
                    Navigator.pop(bottomSheetContext);
                    _processPayBill(table);
                  },
                ),
                _buildMenuAction(
                  icon: Icons.swap_horiz,
                  color: Colors.orange.shade600,
                  title: 'Pindah Meja',
                  subtitle: 'Pindahkan pelanggan dan tagihan ke meja lain',
                  onTap: () {
                    Navigator.pop(bottomSheetContext);
                    _showTransferTableDialog(table, activeOrder);
                  },
                ),
                _buildMenuAction(
                  icon: Icons.cancel_outlined,
                  color: Colors.red.shade600,
                  title: 'Batalkan Pesanan (Void)',
                  subtitle: 'Batalkan seluruh pesanan di meja ini',
                  onTap: () {
                    Navigator.pop(bottomSheetContext);
                    _showVoidOrderDialog(table, activeOrder);
                  },
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildMenuAction({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: color),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onTap: onTap,
    );
  }

  void _processPayBill(TableModel table) {
    final openBillState = context.read<OpenBillBloc>().state;
    openBillState.maybeWhen(
      loaded: (orders, _, __, ___) {
        try {
          final matchingOrder = orders.firstWhere(
            (o) => o.tableNumber == table.code,
          );
          context.read<OpenBillBloc>().add(
            OpenBillEvent.selectBill(matchingOrder),
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const OrderDetailPage()),
          ).then((_) => _fetchData());
        } catch (e) {
          _fetchData();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Menyinkronkan data dari server... Silakan klik lagi.',
              ),
            ),
          );
        }
      },
      orElse: () => _fetchData(),
    );
  }

  void _confirmClearTable(TableModel table) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.orange),
            SizedBox(width: 8),
            Text('Kosongkan Meja?'),
          ],
        ),
        content: Text(
          'Yakin ingin mereset Meja ${table.code} menjadi Kosong? (Gunakan jika pelanggan sudah pulang).',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              context.read<TableBloc>().add(TableEvent.clear(table.id));
              Navigator.pop(dialogContext);
            },
            child: const Text(
              'Ya, Kosongkan',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================================
  // MAIN UI (DENAH MEJA)
  // =========================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Denah Restoran'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryDark,
        elevation: 0,
        actions: [
          if (!_isEditMode) ...[
            IconButton(
              icon: const Icon(Icons.edit_location_alt_outlined),
              tooltip: 'Edit Posisi Meja',
              onPressed: () => setState(() => _isEditMode = true),
            ),
            IconButton(icon: const Icon(Icons.refresh), onPressed: _fetchData),
          ] else ...[
            BlocBuilder<TableBloc, TableState>(
              builder: (context, state) {
                final isSaving = state.maybeWhen(
                  loaded: (_, isSavingLayout) => isSavingLayout,
                  orElse: () => false,
                );

                return isSaving
                    ? const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                      )
                    : TextButton.icon(
                        icon: const Icon(Icons.check, color: Colors.green),
                        label: const Text(
                          'Simpan Denah',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          context.read<TableBloc>().add(
                            const TableEvent.savePositions(),
                          );
                          // Note: _isEditMode = false akan diset di BlocListener saat success
                        },
                      );
              },
            ),
            IconButton(
              icon: const Icon(Icons.close, color: Colors.red),
              tooltip: 'Batal Edit',
              onPressed: () {
                setState(() => _isEditMode = false);
                _fetchData(); // Reset posisi ke server aslinya
              },
            ),
          ],
        ],
      ),
      floatingActionButton: _isEditMode
          ? FloatingActionButton.extended(
              onPressed: () => _showAddEditTableDialog(),
              backgroundColor: AppColors.primary,
              icon: const Icon(Icons.add),
              label: const Text('Tambah Meja'),
            )
          : null,
      body: MultiBlocListener(
        listeners: [
          BlocListener<CartBloc, CartState>(
            listener: (context, state) {
              state.maybeWhen(
                checkoutSuccess: (_) => _fetchData(),
                orElse: () {},
              );
            },
          ),
          BlocListener<OpenBillBloc, OpenBillState>(
            listener: (context, state) {
              state.maybeWhen(
                success: (_) => _fetchData(),
                error: (message) {
                  _fetchData();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
                orElse: () {},
              );
            },
          ),
        ],
        child: BlocConsumer<TableBloc, TableState>(
          listener: (context, state) {
            state.maybeWhen(
              successVoidOrder: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message), backgroundColor: Colors.red),
                );
                context.read<OpenBillBloc>().add(
                  const OpenBillEvent.fetchOpenBills(),
                );
              },
              successTransferTable: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: Colors.green,
                  ),
                );
                // Refresh data Open Bill agar sinkron dengan status meja terbaru
                context.read<OpenBillBloc>().add(
                  const OpenBillEvent.fetchOpenBills(),
                );
              },
              success: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: Colors.green,
                  ),
                );
                setState(() => _isEditMode = false);
                // ✅ SYNC GANDA: Refresh TableBloc & OpenBillBloc setelah operasi meja berhasil
                _fetchData();
              },
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message), backgroundColor: Colors.red),
                );
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            // Amankan data meja agar tetap muncul meskipun state sedang loading/success
            final List<TableModel> tables = state.maybeMap(
              loaded: (s) => s.tables,
              // Jika state lain tapi kita sudah punya data sebelumnya, ambil dari memori (jika memungkinkan)
              // atau tetap tampilkan list kosong jika benar-benar awal
              orElse: () => state.maybeWhen(
                loaded: (data, _) => data,
                orElse: () => <TableModel>[],
              ),
            );

            final isLoading = state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            );

            if (isLoading && tables.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            if (tables.isEmpty && !isLoading) {
              return const Center(
                child: Text('Belum ada meja. Klik "+" untuk menambah.'),
              );
            }

            // ✅ SYNC GANDA: Bungkus UI meja dengan BlocBuilder OpenBillBloc
            // agar badge & status meja otomatis reaktif saat data tagihan berubah
            return BlocBuilder<OpenBillBloc, OpenBillState>(
              builder: (context, openBillState) {
                final List<OrderModel> openBills = openBillState.maybeWhen(
                  loaded: (orders, _, __, ___) => orders,
                  orElse: () => <OrderModel>[],
                );

                return Container(
                  color: Colors.grey.shade100,
                  child: InteractiveViewer(
                    constrained: false,
                    boundaryMargin: const EdgeInsets.all(500),
                    minScale: 0.1,
                    maxScale: 2.5,
                    child: SizedBox(
                      width: 2000,
                      height: 2000,
                      child: Stack(
                        children: tables.asMap().entries.map((entry) {
                          final index = entry.key;
                          final table = entry.value;
                          //final bool isOccupied = table.isOccupied ?? false;
                          //final isAvailable = !isOccupied;
                          final bool hasUpcoming =
                              table.upcomingReservation != null;

                          // ✅ FIX 2: Logika "Anti-Tumpuk"
                          // Jika x dan y masih 0, kita beri posisi otomatis (index * 120) agar tidak tumpang tindih
                          double displayX = table.x;
                          double displayY = table.y;

                          if (displayX == 0 && displayY == 0) {
                            displayX = 50.0 + (index * 120 % 600); // Menyamping
                            displayY =
                                50.0 +
                                ((index * 120 / 600).floor() * 120); // Menurun
                          }

                          // ✅ SYNC GANDA: Cari activeOrder dari BlocBuilder (reaktif, bukan snapshot)
                          OrderModel? activeOrder;
                          try {
                            activeOrder = openBills.firstWhere(
                              (o) => o.tableNumber == table.code,
                            );
                          } catch (_) {
                            activeOrder = null;
                          }

                          // Tentukan label tipe order
                          // String orderTypeLabel = "";
                          // if (!isAvailable) {
                          //   // Jika occupied tapi tidak ada di list Open Bill (Unpaid), berarti Dine In Lunas
                          //   orderTypeLabel = (activeOrder != null)
                          //       ? "OPEN BILL"
                          //       : "DINE IN";
                          // }

                          final bool isOccupiedFisik =
                              table.isOccupied ?? false;
                          final String? resStatus = table.reservationStatus;
                          final bool isBooked = (resStatus == 'booked');
                          final bool isSeated = (resStatus == 'seated');

                          Color cardColor = Colors.white;
                          Color borderColor = _isEditMode
                              ? Colors.blue
                              : Colors.grey.shade300;
                          Color mainColor = Colors.green.shade600;
                          String badgeText = 'AVAILABLE';
                          Color badgeBg = Colors.green.shade100;
                          IconData tableIcon = Icons.table_restaurant;

                          String orderTypeLabel = "";
                          String customerNameLabel = "";

                          if (activeOrder != null) {
                            String typeFromDb =
                                (activeOrder.typeOrder ?? "OPEN BILL")
                                    .toUpperCase();
                            orderTypeLabel =
                                typeFromDb; // Pasti mencetak "DINE IN" atau "RESERVASI"
                            customerNameLabel = activeOrder.customerName ?? "";

                            if (typeFromDb == 'RESERVASI') {
                              cardColor = Colors.deepOrange.shade50;
                              borderColor = _isEditMode
                                  ? Colors.blue
                                  : Colors.deepOrange.shade300;
                              mainColor = Colors.deepOrange.shade700;
                              badgeText = 'SEATED';
                              badgeBg = Colors.deepOrange.shade100;
                              tableIcon = Icons.how_to_reg;
                            } else {
                              // Tipe DINE IN atau OPEN BILL Murni
                              cardColor = Colors.red.shade50;
                              borderColor = _isEditMode
                                  ? Colors.blue
                                  : Colors.red.shade300;
                              mainColor = Colors.red.shade600;
                              badgeText = 'OPEN BILL';
                              badgeBg = Colors.red.shade100;
                              tableIcon = Icons.receipt_long;
                            }
                          }
                          // 🥈 PRIORITAS 2: JIKA BELUM ADA TAGIHAN, CEK STATUS RESERVASI
                          else if (isSeated || isBooked) {
                            cardColor = Colors.orange.shade50;
                            borderColor = _isEditMode
                                ? Colors.blue
                                : Colors.orange.shade300;
                            mainColor = Colors.orange.shade700;
                            badgeText = isSeated ? 'SEATED' : 'BOOKED';
                            badgeBg = Colors.orange.shade100;
                            tableIcon = isSeated
                                ? Icons.how_to_reg
                                : Icons.event_seat;
                            orderTypeLabel = "RESERVASI";
                            customerNameLabel =
                                table.reservedCustomerName ?? "";
                          }
                          // 🥉 PRIORITAS 3: DINE IN LUNAS (Orang masih duduk / Meja kotor)
                          else if (isOccupiedFisik) {
                            cardColor = Colors.blue.shade50;
                            borderColor = _isEditMode
                                ? Colors.blue
                                : Colors.blue.shade300;
                            mainColor = Colors.blue.shade700;
                            badgeText = 'OCCUPIED';
                            badgeBg = Colors.blue.shade100;
                            tableIcon = Icons.person_pin;
                            orderTypeLabel = "DINE IN";
                            customerNameLabel = table.customerName ?? "";
                          }

                          return Positioned(
                            left: displayX,
                            top: displayY,
                            child: GestureDetector(
                              onPanUpdate: _isEditMode
                                  ? (details) {
                                      context.read<TableBloc>().add(
                                        TableEvent.moveTable(
                                          tableId: table.id,
                                          newX: displayX + details.delta.dx,
                                          newY: displayY + details.delta.dy,
                                        ),
                                      );
                                    }
                                  : null,
                              onTap: () => _handleTableTap(table, activeOrder),
                              child: Container(
                                width: 120,
                                height:
                                    155, // Sedikit ditambah tingginya untuk slot Resv
                                decoration: BoxDecoration(
                                  color: cardColor,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: borderColor,
                                    width: _isEditMode ? 3 : 2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(tableIcon, size: 32, color: mainColor),

                                    if (orderTypeLabel.isNotEmpty)
                                      Container(
                                        margin: const EdgeInsets.only(top: 4),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: (activeOrder != null)
                                              ? Colors.deepOrange.shade100
                                              : Colors.blue.shade100,
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        child: Text(
                                          orderTypeLabel,
                                          style: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.bold,
                                            color: (activeOrder != null)
                                                ? Colors.deepOrange.shade800
                                                : Colors.blue.shade800,
                                          ),
                                        ),
                                      ),

                                    const SizedBox(height: 6),
                                    Text(
                                      table.code,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.people_outline,
                                          size: 12,
                                          color: Colors.grey.shade600,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '${table.capacity ?? 0} Pax',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.grey.shade700,
                                          ),
                                        ),
                                      ],
                                    ),

                                    // 👇 INDIKATOR JAM RESERVASI
                                    if (hasUpcoming)
                                      Container(
                                        margin: const EdgeInsets.only(top: 4),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.blue.shade50,
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                          border: Border.all(
                                            color: Colors.blue.shade200,
                                          ),
                                        ),
                                        child: Text(
                                          'Resv: ${table.upcomingReservation}',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue.shade800,
                                          ),
                                        ),
                                      ),

                                    const SizedBox(height: 4),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: badgeBg,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        badgeText,
                                        style: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold,
                                          color: mainColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                );
              }, // end BlocBuilder<OpenBillBloc>
            );
          },
        ),
      ),
    );
  }
}
