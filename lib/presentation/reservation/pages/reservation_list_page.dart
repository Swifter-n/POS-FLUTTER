import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/presentation/reservation/bloc/reservation/reservation_bloc.dart';
import 'package:avis_pos/presentation/reservation/widgets/create_reservation_dialog.dart';
import 'package:avis_pos/presentation/settings/bloc/table/table_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ReservationListPage extends StatefulWidget {
  const ReservationListPage({super.key});

  @override
  State<ReservationListPage> createState() => _ReservationListPageState();
}

class _ReservationListPageState extends State<ReservationListPage> {
  @override
  void initState() {
    super.initState();
    context.read<ReservationBloc>().add(const ReservationEvent.fetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Daftar Reservasi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: AppColors.primary),
            tooltip: 'Refresh Data',
            onPressed: () => context.read<ReservationBloc>().add(
              const ReservationEvent.fetch(),
            ),
          ),
        ],
      ),
      body: BlocConsumer<ReservationBloc, ReservationState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (msg) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(msg),
                  backgroundColor: AppColors.primary,
                ),
              );

              context.read<TableBloc>().add(const TableEvent.fetch());
            },
            error: (msg) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(msg), backgroundColor: Colors.red),
            ),
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
            loaded: (reservations, _) {
              if (reservations.isEmpty) {
                return _buildEmptyState(context);
              }

              // Urutkan berdasarkan waktu reservasi terdekat
              final sortedList = List.of(reservations)
                ..sort((a, b) {
                  try {
                    return DateTime.parse(
                      a.reservationTime,
                    ).compareTo(DateTime.parse(b.reservationTime));
                  } catch (e) {
                    return 0;
                  }
                });

              return ListView.separated(
                padding: const EdgeInsets.all(20),
                itemCount: sortedList.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final item = sortedList[index];
                  DateTime? resTime;
                  try {
                    resTime = DateTime.parse(item.reservationTime);
                  } catch (_) {}

                  final isBooked = item.status?.toLowerCase() == 'booked';

                  return Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      border: Border.all(color: AppColors.stroke),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // --- HEADER CARD ---
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.customerName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  if (item.customerPhone != null &&
                                      item.customerPhone!.isNotEmpty)
                                    Text(
                                      item.customerPhone!,
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 14,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            _buildStatusBadge(item.status ?? 'booked'),
                          ],
                        ),
                        const Divider(height: 32),

                        // --- RINCIAN INFO ---
                        Row(
                          children: [
                            _buildInfoItem(
                              Icons.calendar_today,
                              'Waktu',
                              resTime != null
                                  ? DateFormat(
                                      'dd MMM yyyy, HH:mm',
                                    ).format(resTime)
                                  : '-',
                            ),
                            const SizedBox(width: 24),
                            _buildInfoItem(
                              Icons.people,
                              'Tamu',
                              '${item.guestCount} Orang',
                            ),
                            const SizedBox(width: 24),
                            _buildInfoItem(
                              Icons.table_restaurant,
                              'Meja',
                              item.table?.code ??
                                  item.tableId?.toString() ??
                                  'Belum Dipilih',
                            ),
                          ],
                        ),

                        if (item.notes != null && item.notes!.isNotEmpty) ...[
                          const SizedBox(height: 12),
                          Text(
                            'Catatan: ${item.notes}',
                            style: TextStyle(
                              color: Colors.orange.shade800,
                              fontStyle: FontStyle.italic,
                              fontSize: 12,
                            ),
                          ),
                        ],

                        // --- TOMBOL AKSI ---
                        if (isBooked) ...[
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () => _updateStatus(
                                  context,
                                  item.id,
                                  'cancelled',
                                ),
                                child: const Text(
                                  'Batalkan',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                icon: const Icon(Icons.how_to_reg, size: 18),
                                label: const Text(
                                  'Tamu Datang (Seated)',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                onPressed: () =>
                                    _updateStatus(context, item.id, 'seated'),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  );
                },
              );
            },
            orElse: () => _buildEmptyState(context),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.tertiary,
        icon: const Icon(Icons.add, color: AppColors.textPrimary),
        label: const Text(
          'Reservasi Baru',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const CreateReservationDialog(),
          );
        },
      ),
    );
  }

  void _updateStatus(BuildContext context, int id, String status) {
    context.read<ReservationBloc>().add(
      ReservationEvent.updateStatus(id: id, status: status),
    );
  }

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey.shade500),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
            ),
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatusBadge(String status) {
    Color bgColor = Colors.grey.shade100;
    Color textColor = Colors.grey.shade700;

    switch (status.toLowerCase()) {
      case 'booked':
        bgColor = Colors.blue.shade50;
        textColor = Colors.blue.shade700;
        break;
      case 'seated':
        bgColor = Colors.green.shade50;
        textColor = Colors.green.shade700;
        break;
      case 'cancelled':
        bgColor = Colors.red.shade50;
        textColor = Colors.red.shade700;
        break;
      case 'completed':
        bgColor = Colors.grey.shade200;
        textColor = Colors.grey.shade800;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.event_available_outlined,
            size: 80,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 16),
          Text(
            'Belum ada reservasi',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
