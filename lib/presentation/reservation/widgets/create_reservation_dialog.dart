import 'package:avis_pos/core/components/buttons.dart';
import 'package:avis_pos/core/components/form_fields.dart';
import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/presentation/reservation/bloc/reservation/reservation_bloc.dart';
import 'package:avis_pos/presentation/settings/bloc/table/table_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CreateReservationDialog extends StatefulWidget {
  const CreateReservationDialog({super.key});

  @override
  State<CreateReservationDialog> createState() =>
      _CreateReservationDialogState();
}

class _CreateReservationDialogState extends State<CreateReservationDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  int _guestCount = 2;
  DateTime? _selectedDateTime;
  int? _selectedTableId;

  @override
  void initState() {
    super.initState();
    context.read<TableBloc>().add(const TableEvent.fetch());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickDateTime() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (pickedDate != null && mounted) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  void _submit() {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nama Pelanggan wajib diisi')),
      );
      return;
    }
    if (_selectedDateTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Waktu Reservasi wajib diisi')),
      );
      return;
    }

    // Persiapkan Payload sesuai API (Reservasi)
    final payload = {
      'customer_name': _nameController.text.trim(),
      'customer_phone': _phoneController.text.trim(),
      'guest_count': _guestCount,
      'reservation_time': _selectedDateTime!
          .toIso8601String(), // Format standar Backend
      'notes': _notesController.text.trim(),
      'status': 'booked',
    };

    if (_selectedTableId != null) {
      payload['table_id'] = _selectedTableId!;
    }

    context.read<ReservationBloc>().add(ReservationEvent.create(payload));
    Navigator.pop(context); // Tutup dialog
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      backgroundColor: Colors.white,
      child: Container(
        width: 450,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.9,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // --- HEADER ---
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Buat Reservasi Baru',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.grey),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),

            // --- BODY FORM ---
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextField(
                      label: 'Nama Pelanggan *',
                      hint: 'Cth: Budi Santoso',
                      controller: _nameController,
                      prefixIcon: const Icon(
                        Icons.person,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      label: 'Nomor Telepon/WA',
                      hint: '08123456789',
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // --- BARIS GUEST & WAKTU ---
                    Row(
                      children: [
                        // Guest Counter
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Jumlah Tamu',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.stroke),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      color: _guestCount > 1
                                          ? AppColors.primary
                                          : Colors.grey,
                                      onPressed: () {
                                        if (_guestCount > 1)
                                          setState(() => _guestCount--);
                                      },
                                    ),
                                    Text(
                                      '$_guestCount',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      color: AppColors.primary,
                                      onPressed: () =>
                                          setState(() => _guestCount++),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),

                        // Time Picker Button
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Waktu Datang',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              InkWell(
                                onTap: _pickDateTime,
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.primary,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.primaryLight,
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.calendar_month,
                                        color: AppColors.primary,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          _selectedDateTime == null
                                              ? 'Pilih Waktu'
                                              : DateFormat(
                                                  'dd/MM HH:mm',
                                                ).format(_selectedDateTime!),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.primaryDark,
                                          ),
                                        ),
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
                    const SizedBox(height: 24),

                    // --- PILIH MEJA (TERINTEGRASI DGN TABLE BLOC) ---
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Alokasi Meja',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 120, // Tampilan horizontal atau grid kecil
                          child: BlocBuilder<TableBloc, TableState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                loaded: (tables, _) {
                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: tables.length,
                                    itemBuilder: (context, index) {
                                      final table = tables[index];
                                      // 👇 Logika status meja dari Backend
                                      final bool isBooked =
                                          table.isOccupied ?? false;
                                      final bool isSelected =
                                          _selectedTableId == table.id;

                                      return InkWell(
                                        onTap: isBooked
                                            ? null
                                            : () {
                                                // Jika sudah booked, tidak bisa diklik
                                                setState(() {
                                                  _selectedTableId = table.id;
                                                });
                                              },
                                        child: Container(
                                          width: 80,
                                          margin: const EdgeInsets.only(
                                            right: 8,
                                          ),
                                          decoration: BoxDecoration(
                                            // Oranye jika terisi (Booked/Active), Putih jika kosong
                                            color: isBooked
                                                ? Colors.orange.shade100
                                                : (isSelected
                                                      ? Colors.blue.shade50
                                                      : Colors.white),
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            border: Border.all(
                                              color: isSelected
                                                  ? Colors.blue
                                                  : (isBooked
                                                        ? Colors.orange.shade300
                                                        : Colors.grey.shade300),
                                              width: isSelected ? 2 : 1,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                isBooked
                                                    ? Icons.block
                                                    : Icons.table_bar,
                                                color: isBooked
                                                    ? Colors.orange
                                                    : Colors.grey,
                                              ),
                                              Text(
                                                table.code ?? '',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: isBooked
                                                      ? Colors.orange.shade900
                                                      : Colors.black87,
                                                ),
                                              ),
                                              Text(
                                                isBooked
                                                    ? 'Terisi'
                                                    : 'Tersedia',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: isBooked
                                                      ? Colors.orange
                                                      : Colors.green,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                orElse: () => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    AppTextField(
                      label: 'Catatan Dapur / Layanan',
                      hint: 'Cth: Minta kursi bayi, acara ulang tahun',
                      controller: _notesController,
                    ),
                  ],
                ),
              ),
            ),

            // --- FOOTER BUTTON ---
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey.shade200)),
              ),
              child: AppButton(label: 'Simpan Reservasi', onPressed: _submit),
            ),
          ],
        ),
      ),
    );
  }
}
