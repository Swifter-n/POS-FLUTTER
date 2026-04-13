import 'package:avis_pos/core/components/buttons.dart';
import 'package:avis_pos/core/components/form_fields.dart';
import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/data/model/responses/table_model/table_model.dart';
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
    context.read<TableBloc>().add(const TableEvent.fetch());
  }

  void _handleTableTap(TableModel table) {
    if (_isEditMode) return; // Mode edit abaikan klik

    if (table.status == 'available') {
      // Meja Kosong -> Buka Bill Baru dengan nomor meja otomatis
      showDialog(
        context: context,
        builder: (context) => NewBillModal(initialTableCode: table.code),
      );
    } else {
      // Meja Terisi -> Cari tagihan (Order) yang sesuai dengan kode meja ini
      final openBillState = context.read<OpenBillBloc>().state;

      openBillState.maybeWhen(
        loaded: (orders, _, __, ___) {
          try {
            // Cari tagihan aktif yang nomor mejanya sama dengan meja yang diklik
            final matchingOrder = orders.firstWhere(
              (o) => o.tableNumber == table.code,
            );

            // Set tagihan tersebut sebagai yang terpilih
            context.read<OpenBillBloc>().add(
              OpenBillEvent.selectBill(matchingOrder),
            );

            // Buka halaman detail tagihan
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const OrderDetailPage()),
            );
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Detail pesanan untuk meja ini belum ditarik ke aplikasi. Refresh halaman Open Bill.',
                ),
              ),
            );
          }
        },
        orElse: () {
          // Jika state OpenBill belum ter-load, trigger fetch
          context.read<OpenBillBloc>().add(
            const OpenBillEvent.fetchOpenBills(),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.grey.shade100, // Warna latar belakang denah lantai
      appBar: AppBar(
        title: const Text(
          'Denah Lantai & Meja',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        actions: [
          // Toggle Mode Edit
          Row(
            children: [
              Text(
                _isEditMode ? 'Mode Edit Aktif' : 'Mode Operasional',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: _isEditMode
                      ? Colors.orange.shade700
                      : AppColors.primary,
                ),
              ),
              Switch(
                value: _isEditMode,
                activeColor: Colors.orange,
                onChanged: (val) {
                  setState(() => _isEditMode = val);
                },
              ),
            ],
          ),
          const SizedBox(width: 16),
          // Tombol Save Layout (Hanya muncul di Mode Edit)
          BlocBuilder<TableBloc, TableState>(
            builder: (context, state) {
              bool isSaving = false;
              state.maybeWhen(
                loaded: (_, saving) => isSaving = saving,
                orElse: () {},
              );

              if (!_isEditMode) {
                return IconButton(
                  icon: const Icon(Icons.refresh, color: AppColors.primary),
                  tooltip: 'Refresh Denah',
                  onPressed: () =>
                      context.read<TableBloc>().add(const TableEvent.fetch()),
                );
              }

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: isSaving
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Icon(Icons.save),
                  label: const Text(
                    'Simpan Layout',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: isSaving
                      ? null
                      : () => context.read<TableBloc>().add(
                          const TableEvent.savePositions(),
                        ),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocConsumer<TableBloc, TableState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (msg) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(msg),
                  backgroundColor: AppColors.primary,
                ),
              );
              if (msg.contains('disimpan')) {
                setState(
                  () => _isEditMode = false,
                ); // Keluar dari mode edit setelah sukses simpan
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
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
            loaded: (tables, _) {
              if (tables.isEmpty && !_isEditMode) {
                return Center(
                  child: Text(
                    'Belum ada meja. Aktifkan Mode Edit untuk menambah meja.',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                );
              }

              return InteractiveViewer(
                boundaryMargin: const EdgeInsets.all(100),
                minScale: 0.5,
                maxScale: 2.0,
                // Matikan pan/zoom bawaan jika sedang dalam Mode Edit agar drag & drop lancar
                panEnabled: !_isEditMode,
                scaleEnabled: true,
                child: Stack(
                  children: [
                    // Grid background untuk membantu alignment saat mode edit
                    if (_isEditMode)
                      Positioned.fill(
                        child: CustomPaint(painter: _GridPainter()),
                      ),

                    // Render List Meja
                    ...tables.map((table) {
                      return Positioned(
                        left: table.x,
                        top: table.y,
                        child: GestureDetector(
                          onPanUpdate: _isEditMode
                              ? (details) {
                                  // Update posisi meja secara realtime di lokal memori
                                  context.read<TableBloc>().add(
                                    TableEvent.moveTable(
                                      tableId: table.id,
                                      newX: table.x + details.delta.dx,
                                      newY: table.y + details.delta.dy,
                                    ),
                                  );
                                }
                              : null,
                          onTap: () => _handleTableTap(table),
                          child: _buildTableWidget(table),
                        ),
                      );
                    }).toList(),
                  ],
                ),
              );
            },
            orElse: () =>
                const Center(child: Text('Gagal memuat denah lantai')),
          );
        },
      ),
      floatingActionButton: _isEditMode
          ? FloatingActionButton.extended(
              backgroundColor:
                  AppColors.tertiary, // Mustard/Gold untuk aksi edit
              icon: const Icon(Icons.add, color: AppColors.textPrimary),
              label: const Text(
                'Tambah Meja',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const _AddTableDialog(),
                );
              },
            )
          : null,
    );
  }

  Widget _buildTableWidget(TableModel table) {
    final bool isAvailable = table.status == 'available';

    return Container(
      width: 100, // Ukuran standar meja
      height: 100,
      decoration: BoxDecoration(
        color: isAvailable ? Colors.white : Colors.orange.shade50,
        shape: BoxShape
            .rectangle, // Bisa disesuaikan dengan table.shape jika API mendukung
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isAvailable ? AppColors.stroke : Colors.orange,
          width: _isEditMode ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(_isEditMode ? 0.1 : 0.05),
            blurRadius: _isEditMode ? 15 : 10,
            offset: Offset(0, _isEditMode ? 8 : 4),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                table.code,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: isAvailable
                      ? AppColors.textPrimary
                      : Colors.orange.shade800,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.people, size: 12, color: Colors.grey.shade500),
                  const SizedBox(width: 4),
                  Text(
                    '${table.capacity ?? 4}',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          // Indikator Drag saat mode edit
          if (_isEditMode)
            Positioned(
              top: 4,
              right: 4,
              child: Icon(
                Icons.drag_indicator,
                size: 16,
                color: Colors.grey.shade400,
              ),
            ),
        ],
      ),
    );
  }
}

// --- INTERNAL WIDGETS ---

class _AddTableDialog extends StatefulWidget {
  const _AddTableDialog();

  @override
  State<_AddTableDialog> createState() => _AddTableDialogState();
}

class _AddTableDialogState extends State<_AddTableDialog> {
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _capacityController = TextEditingController(
    text: '4',
  );

  @override
  void dispose() {
    _codeController.dispose();
    _capacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 350,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tambah Meja Baru',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            AppTextField(
              label: 'Kode/Nomor Meja',
              hint: 'Cth: T-01',
              controller: _codeController,
            ),
            const SizedBox(height: 16),
            AppTextField(
              label: 'Kapasitas (Orang)',
              hint: '4',
              controller: _capacityController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 32),
            AppButton(
              label: 'Simpan Meja',
              onPressed: () {
                if (_codeController.text.trim().isEmpty) return;

                final payload = {
                  'code': _codeController.text.trim(),
                  'capacity':
                      int.tryParse(_capacityController.text.trim()) ?? 4,
                  'x_position':
                      100.0, // Posisi default di tengah layar saat pertama dibuat
                  'y_position': 100.0,
                  'status': 'available',
                };

                context.read<TableBloc>().add(TableEvent.addTable(payload));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Background Grid Painter untuk estetika Mode Edit
class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 1;

    const double step = 50;

    for (double i = 0; i < size.width; i += step) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i < size.height; i += step) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
