import 'package:avis_pos/core/components/buttons.dart';
import 'package:avis_pos/core/components/form_fields.dart';
import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/data/model/payloads/open_bill_payload/open_bill_payload.dart';
import 'package:avis_pos/presentation/open_bill/bloc/open_bill/open_bill_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewBillModal extends StatefulWidget {
  final String? initialTableCode;
  const NewBillModal({super.key, this.initialTableCode});

  @override
  State<NewBillModal> createState() => _NewBillModalState();
}

class _NewBillModalState extends State<NewBillModal> {
  final TextEditingController _tableController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  int _guestCount = 1;

  @override
  void initState() {
    super.initState();
    if (widget.initialTableCode != null) {
      _tableController.text = widget.initialTableCode!;
    }
  }

  @override
  void dispose() {
    _tableController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_tableController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Nomor Meja wajib diisi!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final payload = OpenBillPayload(
      typeOrder: 'Dine In', // Default untuk Open Bill biasanya Dine In
      tableNumber: _tableController.text.trim(),
      customerName: _nameController.text.trim().isNotEmpty
          ? _nameController.text.trim()
          : 'Guest',
      guestCount: _guestCount,
      // memberId bisa ditambahkan jika ada fitur scan member sebelum buka meja
    );

    context.read<OpenBillBloc>().add(OpenBillEvent.createOpenBill(payload));
    Navigator.pop(context); // Tutup modal setelah menembak event
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      backgroundColor: Colors.white,
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- HEADER ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Buka Meja Baru',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.grey),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const Divider(height: 24),

            // --- FORM INPUT ---
            AppTextField(
              label: 'Nomor Meja *',
              hint: 'Contoh: T-01, VIP-2',
              controller: _tableController,
              prefixIcon: const Icon(
                Icons.table_restaurant,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 16),

            AppTextField(
              label: 'Nama Pelanggan (Opsional)',
              hint: 'Atas nama siapa?',
              controller: _nameController,
              prefixIcon: const Icon(Icons.person, color: AppColors.primary),
            ),
            const SizedBox(height: 16),

            // --- GUEST COUNTER ---
            const Text(
              'Jumlah Tamu',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.stroke),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.people, color: AppColors.textSecondary),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        color: _guestCount > 1
                            ? AppColors.primary
                            : Colors.grey,
                        onPressed: () {
                          if (_guestCount > 1) setState(() => _guestCount--);
                        },
                      ),
                      SizedBox(
                        width: 40,
                        child: Text(
                          '$_guestCount',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        color: AppColors.primary,
                        onPressed: () => setState(() => _guestCount++),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // --- SUBMIT BUTTON ---
            AppButton(label: 'Simpan & Buka Meja', onPressed: _submit),
          ],
        ),
      ),
    );
  }
}
