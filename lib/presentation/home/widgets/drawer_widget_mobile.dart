import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/presentation/auth/bloc/auth/auth_bloc.dart';
import 'package:avis_pos/presentation/auth/pages/login_page.dart';
import 'package:avis_pos/presentation/inventory/pages/inventory_page.dart';
import 'package:avis_pos/presentation/member/pages/member_list_page.dart';
import 'package:avis_pos/presentation/open_bill/pages/open_bill_page.dart';
import 'package:avis_pos/presentation/reservation/pages/reservation_list_page.dart';
import 'package:avis_pos/presentation/settings/pages/table_management_page.dart';
import 'package:avis_pos/presentation/stock_count/pages/stock_count_list_page.dart';
import 'package:avis_pos/presentation/settings/pages/printer_settings_page.dart';
import 'package:avis_pos/presentation/shift/pages/close_shift_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerWidgetMobile extends StatelessWidget {
  const DrawerWidgetMobile({super.key});

  void _handleLogout(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEvent.logoutRequested());
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background,
      child: Column(
        children: [
          // --- HEADER DRAWER ---
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 60,
              bottom: 24,
              left: 24,
              right: 24,
            ),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(32)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 40,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 16),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    final String cashierName = state.maybeWhen(
                      authenticated: (user) => user.name ?? 'Kasir',
                      orElse: () => 'Kasir Aktif',
                    );
                    final String cashierEmail = state.maybeWhen(
                      authenticated: (user) => user.email ?? 'Email',
                      orElse: () => 'Email',
                    );
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cashierName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          cashierEmail,
                          style: TextStyle(
                            color: AppColors.primaryLight,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),

          // --- MENU ITEMS ---
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              children: [
                _buildDrawerItem(
                  icon: Icons.point_of_sale,
                  title: 'Kasir / POS',
                  onTap: () => Navigator.pop(context),
                ),
                _buildDrawerItem(
                  icon: Icons.receipt_long,
                  title: 'Reservation',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ReservationListPage(),
                      ),
                    );
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.table_bar_outlined,
                  title: 'Table Management',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const TableManagementPage(),
                      ),
                    );
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.inventory_2_outlined,
                  title: 'Inventories',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const InventoryPage()),
                    );
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.warehouse_outlined,
                  title: 'Stock Count',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const StockCountListPage(),
                      ),
                    );
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.card_membership_outlined,
                  title: 'Member',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const MemberListPage()),
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Divider(
                    indent: 24,
                    endIndent: 24,
                    color: AppColors.stroke,
                  ),
                ),
                _buildDrawerItem(
                  icon: Icons.print,
                  title: 'Pengaturan Printer',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PrinterSettingsPage(),
                      ),
                    );
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.schedule,
                  title: 'Manajemen Shift',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('Ganti Shift'),
                        content: const Text(
                          'Apakah Anda yakin ingin ke halaman tutup/ganti shift sekarang?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(ctx),
                            child: const Text(
                              'Batal',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(ctx); // Tutup dialog konfirmasi
                              Navigator.pop(
                                context,
                              ); // Tutup navigasi drawer sisi kiri
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const CloseShiftPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                            ),
                            child: const Text(
                              'Ya, Lanjut',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // --- LOGOUT BUTTON ---
          // Padding(
          //   padding: const EdgeInsets.all(24.0),
          //   child: ElevatedButton.icon(
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: Colors.red.shade50,
          //       foregroundColor: AppColors.red,
          //       elevation: 0,
          //       minimumSize: const Size(double.infinity, 50),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(16),
          //       ),
          //     ),
          //     icon: const Icon(Icons.logout),
          //     label: const Text(
          //       'Keluar (Logout)',
          //       style: TextStyle(fontWeight: FontWeight.bold),
          //     ),
          //     onPressed: () => _handleLogout(context),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textSecondary),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
