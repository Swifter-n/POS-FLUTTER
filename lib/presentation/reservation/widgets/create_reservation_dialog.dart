import 'package:avis_pos/core/components/buttons.dart';
import 'package:avis_pos/core/components/form_fields.dart';
import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/data/model/responses/table_model/table_model.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _noteController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  int _guestCount = 1;
  int? _selectedTableId;
  String? _selectedTableCode;
  int? _selectedTableCapacity;

  @override
  void initState() {
    super.initState();
    // Memastikan data meja terbaru dipanggil saat dialog dibuka
    context.read<TableBloc>().add(const TableEvent.fetch());
  }

  // =========================================================================
  // MODAL CINEMA SEAT PICKER DENGAN VALIDASI KAPASITAS
  // =========================================================================
  void _showCinemaTablePicker(BuildContext context) {
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

                            // Visual State Logic (Synced)
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
                                _selectedTableId == table.id;

                            return InkWell(
                              onTap: () {
                                // --- LOGIKA VALIDASI KAPASITAS (POIN 3) ---
                                if (table.capacity != null &&
                                    _guestCount > table.capacity!) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Kapasitas Meja ${table.code} hanya untuk ${table.capacity} pax!',
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }

                                setState(() {
                                  _selectedTableId = table.id;
                                  _selectedTableCode = table.code;
                                  _selectedTableCapacity =
                                      table.capacity; // 🔥 TAMBAHKAN BARIS INI
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

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Buat Reservasi Baru'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppTextField(
                label: 'Nama Pelanggan',
                controller: _nameController,
                hint: 'Masukkan nama',
              ),
              const SizedBox(height: 12),
              AppTextField(
                label: 'Nomor Telepon',
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                hint: '0812...',
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      label: 'Jumlah Tamu',
                      initialValue: _guestCount.toString(),
                      keyboardType: TextInputType.number,
                      onChanged: (value) => setState(() {
                        _guestCount = int.tryParse(value) ?? 1;

                        // AUTO-RESET: Jika kasir ubah tamu jadi lebih besar dari meja yg sudah dipilih
                        if (_selectedTableCapacity != null &&
                            _guestCount > _selectedTableCapacity!) {
                          _selectedTableId = null;
                          _selectedTableCode = null;
                          _selectedTableCapacity = null;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Pilihan meja dibatalkan otomatis karena jumlah tamu melebihi kapasitas.',
                              ),
                              backgroundColor: Colors.orange,
                            ),
                          );
                        }
                      }),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // --- DATE PICKER ---
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tanggal',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        InkWell(
                          onTap: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: _selectedDate,
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(
                                const Duration(days: 365),
                              ),
                            );
                            if (date != null)
                              setState(() => _selectedDate = date);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.calendar_today,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  DateFormat(
                                    'dd/MM/yyyy',
                                  ).format(_selectedDate),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  // --- TIME PICKER ---
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Waktu',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        InkWell(
                          onTap: () async {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: _selectedTime,
                            );
                            if (time != null)
                              setState(() => _selectedTime = time);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.access_time,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 8),
                                Text(_selectedTime.format(context)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // --- BUTTON PILIH MEJA (CINEMA SEAT TRIGGER) ---
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Alokasi Meja',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: () => _showCinemaTablePicker(context),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: _selectedTableId != null
                            ? Colors.blue.shade50
                            : Colors.white,
                        border: Border.all(
                          color: _selectedTableId != null
                              ? AppColors.primary
                              : Colors.grey.shade300,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.table_restaurant,
                            color: _selectedTableId != null
                                ? AppColors.primary
                                : Colors.grey,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            _selectedTableId == null
                                ? 'Ketuk untuk Pilih Meja'
                                : 'Terpilih: Meja $_selectedTableCode',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: _selectedTableId != null
                                  ? AppColors.primaryDark
                                  : Colors.black54,
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.chevron_right, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              AppTextField(
                label: 'Catatan (Opsional)',
                controller: _noteController,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Batal'),
        ),
        AppButton(
          label: 'Simpan Reservasi',
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              if (_selectedTableId == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Pilih meja terlebih dahulu!')),
                );
                return;
              }

              if (_selectedTableCapacity != null &&
                  _guestCount > _selectedTableCapacity!) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Gagal! Jumlah tamu ($_guestCount) melebihi kapasitas Meja $_selectedTableCode ($_selectedTableCapacity pax).',
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }

              final reservationTime = DateTime(
                _selectedDate.year,
                _selectedDate.month,
                _selectedDate.day,
                _selectedTime.hour,
                _selectedTime.minute,
              );

              context.read<ReservationBloc>().add(
                ReservationEvent.create({
                  'table_id': _selectedTableId!,
                  'customer_name': _nameController.text,
                  'customer_phone': _phoneController.text,
                  'reservation_time': reservationTime.toIso8601String(),
                  'guest_count': _guestCount,
                  'notes': _noteController.text,
                  'status': 'booked',
                }),
              );
              Navigator.pop(context);
            }
          },
        ),
      ],
    );
  }
}
