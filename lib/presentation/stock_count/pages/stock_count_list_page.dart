import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/presentation/stock_count/bloc/stock_count/stock_count_bloc.dart';
import 'package:avis_pos/presentation/stock_count/pages/stock_count_execution_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class StockCountListPage extends StatefulWidget {
  const StockCountListPage({super.key});

  @override
  State<StockCountListPage> createState() => _StockCountListPageState();
}

class _StockCountListPageState extends State<StockCountListPage> {
  @override
  void initState() {
    super.initState();
    context.read<StockCountBloc>().add(const StockCountEvent.fetchTasks());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Tugas Stock Opname',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: AppColors.primary),
            onPressed: () => context.read<StockCountBloc>().add(
              const StockCountEvent.fetchTasks(),
            ),
          ),
        ],
      ),
      body: BlocBuilder<StockCountBloc, StockCountState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
            error: (msg) => Center(
              child: Text(msg, style: const TextStyle(color: Colors.red)),
            ),
            tasksLoaded: (tasks) {
              if (tasks.isEmpty) {
                return _buildEmptyState();
              }

              return RefreshIndicator(
                onRefresh: () async {
                  context.read<StockCountBloc>().add(
                    const StockCountEvent.fetchTasks(),
                  );
                },
                child: ListView.separated(
                  padding: const EdgeInsets.all(24),
                  itemCount: tasks.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final task = tasks[index];

                    // Format tanggal (Asumsi field 'created_at' berupa string ISO dari Laravel)
                    final dateStr = task.createdAt != null
                        ? DateFormat(
                            'dd MMM yyyy',
                          ).format(DateTime.parse(task.createdAt!))
                        : '-';

                    // Mewarnai status (Pending = Kuning, In Progress = Biru, Completed = Hijau)
                    Color statusColor = Colors.grey;
                    if (task.status?.toLowerCase() == 'pending')
                      statusColor = Colors.orange;
                    if (task.status?.toLowerCase() == 'in_progress')
                      statusColor = Colors.blue;
                    if (task.status?.toLowerCase() == 'completed')
                      statusColor = Colors.green;

                    return InkWell(
                      onTap: () {
                        // Jika sudah completed, mungkin tidak bisa di-edit lagi (Opsional)
                        if (task.status?.toLowerCase() == 'completed') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Tugas ini sudah selesai dan tidak bisa diubah.',
                              ),
                            ),
                          );
                          return;
                        }

                        // Masuk ke halaman eksekusi
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => StockCountExecutionPage(task: task),
                          ),
                        ).then((_) {
                          // Refresh list saat kembali
                          context.read<StockCountBloc>().add(
                            const StockCountEvent.fetchTasks(),
                          );
                        });
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.stroke),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: statusColor.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.assignment_turned_in,
                                color: statusColor,
                                size: 28,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    task.countNumber ?? 'TASK-${task.id}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Tanggal: $dateStr',
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: statusColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                (task.status ?? 'UNKNOWN').toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            const Icon(Icons.chevron_right, color: Colors.grey),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
            orElse: () => _buildEmptyState(),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.assignment_outlined,
            size: 80,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 16),
          Text(
            'Belum ada tugas Stock Opname',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tugas akan muncul di sini jika dibuat dari Backoffice.',
            style: TextStyle(color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}
