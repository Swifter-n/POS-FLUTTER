import 'package:avis_pos/core/components/buttons.dart';
import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/data/model/responses/stock_count_model/stock_count_item_model.dart';
import 'package:avis_pos/data/model/responses/stock_count_model/stock_count_task_model.dart';
import 'package:avis_pos/presentation/stock_count/bloc/stock_count/stock_count_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StockCountExecutionPage extends StatefulWidget {
  final StockCountTaskModel task;

  const StockCountExecutionPage({super.key, required this.task});

  @override
  State<StockCountExecutionPage> createState() =>
      _StockCountExecutionPageState();
}

class _StockCountExecutionPageState extends State<StockCountExecutionPage> {
  @override
  void initState() {
    super.initState();
    context.read<StockCountBloc>().add(
      StockCountEvent.fetchItems(widget.task.id!),
    );
  }

  void _submitTask() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Selesaikan Opname?'),
        content: const Text(
          'Pastikan semua barang telah dihitung. Anda tidak bisa mengubah data setelah disubmit.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx); // Tutup dialog
              context.read<StockCountBloc>().add(
                StockCountEvent.submitTask(widget.task.id!),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            child: const Text(
              'Ya, Selesaikan',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Opname: ${widget.task.referenceNumber ?? ''}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: BlocConsumer<StockCountBloc, StockCountState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message), backgroundColor: Colors.green),
              );
              Navigator.pop(context); // Kembali ke halaman list
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
            itemsLoaded: (taskId, items) {
              if (items.isEmpty) {
                return const Center(
                  child: Text('Tidak ada item untuk diopname pada tugas ini.'),
                );
              }

              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    color: Colors.orange.shade50,
                    child: const Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.orange,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Hitung fisik barang dan ketik di kolom. Klik ✓ untuk menyimpan per baris.',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(24),
                      itemCount: items.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        return _StockCountItemRow(
                          taskId: taskId,
                          item: items[index],
                        );
                      },
                    ),
                  ),
                ],
              );
            },
            orElse: () => const Center(child: Text('Memuat item...')),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: AppButton(label: 'SELESAIKAN OPNAME', onPressed: _submitTask),
        ),
      ),
    );
  }
}

// --- WIDGET ROW TERPISAH (Sangat penting agar state TextField tidak tertukar) ---
class _StockCountItemRow extends StatefulWidget {
  final int taskId;
  final StockCountItemModel item;

  const _StockCountItemRow({required this.taskId, required this.item});

  @override
  State<_StockCountItemRow> createState() => _StockCountItemRowState();
}

class _StockCountItemRowState extends State<_StockCountItemRow> {
  late TextEditingController _controller;
  bool _isEditing = false; // Deteksi jika kasir mulai mengetik tapi belum save

  @override
  void initState() {
    super.initState();
    // Default tampilkan counted_qty jika sudah ada, jika tidak kosongkan.
    final initialValue = widget.item.countedQty?.toString() ?? '';
    _controller = TextEditingController(text: initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _saveItem() {
    FocusScope.of(context).unfocus(); // Tutup keyboard
    final double inputQty = double.tryParse(_controller.text) ?? 0.0;
    final bool isZero = inputQty == 0;

    context.read<StockCountBloc>().add(
      StockCountEvent.updateItemCount(
        widget.taskId,
        widget.item.id!,
        inputQty,
        isZero,
      ),
    );

    setState(() {
      _isEditing = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.item.productName} disimpan: $inputQty'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Tentukan apakah item sudah dihitung (sudah ada data dari API)
    final bool hasCounted = widget.item.countedQty != null;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: hasCounted
            ? Colors.green.shade50
            : Colors.white, // Hijau muda jika sudah diisi
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: hasCounted ? Colors.green.shade300 : AppColors.stroke,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Info Barang
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.productName ?? 'Unknown Product',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Sistem mencatat: ${widget.item.systemQty ?? 0} ${widget.item.uom ?? ""}',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),

          // Input Fisik
          SizedBox(
            width: 80,
            child: TextField(
              controller: _controller,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              decoration: InputDecoration(
                hintText: '0',
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 8,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors.stroke),
                ),
              ),
              onChanged: (val) {
                if (!_isEditing) setState(() => _isEditing = true);
              },
            ),
          ),
          const SizedBox(width: 12),

          // Tombol Save per Item (Hanya aktif jika sedang diedit atau baru diisi)
          InkWell(
            onTap: _isEditing || _controller.text.isNotEmpty ? _saveItem : null,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _isEditing
                    ? AppColors.primary
                    : (hasCounted ? Colors.green : Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                hasCounted && !_isEditing ? Icons.check : Icons.save,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
