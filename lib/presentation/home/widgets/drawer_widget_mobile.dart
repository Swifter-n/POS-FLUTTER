import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/presentation/auth/bloc/auth/auth_bloc.dart';
import 'package:avis_pos/presentation/auth/pages/login_page.dart';
import 'package:avis_pos/presentation/open_bill/pages/open_bill_page.dart';
import 'package:avis_pos/presentation/settings/pages/table_management_page.dart';
import 'package:avis_pos/presentation/stock_count/pages/stock_count_list_page.dart';
import 'package:avis_pos/presentation/settings/pages/printer_settings_page.dart';
import 'package:avis_pos/presentation/shift/pages/open_shift_page.dart';
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

                // ✅ FIX: Ambil Nama User dari AuthBloc
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    // Ambil nama dari state (Asumsi state Anda menggunakan 'authenticated')
                    final String cashierName = state.maybeWhen(
                      authenticated: (user) => user.name ?? 'Kasir',
                      orElse: () => 'Kasir Aktif',
                    );

                    final String cashierEmail = state.maybeWhen(
                      authenticated: (user) => user.email ?? 'Email',
                      orElse: () => 'Email',
                    );

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                  title: 'Open Bill (Dine-in)',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const OpenBillPage()),
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
                  icon: Icons.inventory_2,
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
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const OpenShiftPage()),
                    );
                  },
                ),
              ],
            ),
          ),

          // --- LOGOUT BUTTON ---
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade50,
                foregroundColor: AppColors.red,
                elevation: 0,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              icon: const Icon(Icons.logout),
              label: const Text(
                'Keluar (Logout)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () => _handleLogout(context),
            ),
          ),
        ],
      ),
    );
  }

  // Widget helper untuk merapikan baris menu
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
