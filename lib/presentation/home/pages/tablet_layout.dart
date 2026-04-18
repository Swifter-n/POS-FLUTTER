import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/presentation/home/bloc/cart/cart_bloc.dart';
import 'package:avis_pos/presentation/home/widgets/active_promo_slider.dart';
import 'package:avis_pos/presentation/home/widgets/cart_summary.dart';
import 'package:avis_pos/presentation/home/widgets/category_horizontal_list.dart';
import 'package:avis_pos/presentation/home/widgets/product_grid_view.dart';
import 'package:avis_pos/presentation/inventory/pages/inventory_page.dart';
import 'package:avis_pos/presentation/member/pages/member_list_page.dart';
import 'package:avis_pos/presentation/open_bill/pages/open_bill_page.dart';
import 'package:avis_pos/presentation/reservation/pages/reservation_list_page.dart';
import 'package:avis_pos/presentation/settings/pages/table_management_page.dart';
import 'package:avis_pos/presentation/stock_count/pages/stock_count_list_page.dart';
import 'package:avis_pos/presentation/settings/pages/printer_settings_page.dart';
import 'package:avis_pos/presentation/shift/pages/open_shift_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          // 1. App Navigation Rail (Global) - Memudahkan pindah halaman di Tablet
          _buildAppNavigation(context),

          // 3. Area Utama (Tengah - Fleksibel)
          Expanded(
            child: Column(
              children: [
                // Header / Top Bar Tablet
                Container(
                  padding: const EdgeInsets.all(24),
                  color: Colors.white,
                  child: Row(
                    children: [
                      const Text(
                        'Menu Utama',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      // Search Bar Sederhana
                      Container(
                        width: 300,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: 'Cari produk...',
                            border: InputBorder.none,
                            icon: Icon(Icons.search, color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const CategoryHorizontalList(),

                // Slider Promo
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: ActivePromoSlider(),
                ),

                // Grid Produk
                const Expanded(child: ProductGridView()),
              ],
            ),
          ),

          // 4. Keranjang / Cart Summary (Kanan - Lebar Tetap)
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              final bool showCart = state.maybeWhen(
                loaded:
                    (
                      items,
                      _,
                      __,
                      ___,
                      ____,
                      _____,
                      ______,
                      _______,
                      orderType,
                      customerName,
                    ) => items.isNotEmpty,
                orElse: () => false, // Default sembunyi jika loading/initial
              );

              // Jika kosong, jangan render (hemat layar)
              if (!showCart) {
                return const SizedBox.shrink();
              }

              // Animasi sederhana saat muncul
              return const AnimatedSize(
                duration: Duration(milliseconds: 300),
                child: CartSummary(),
              );
            },
          ),
        ],
      ),
    );
  }

  // --- KOMPONEN NAVIGASI GLOBAL (BARU) ---
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      width: 80,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 24),
          // Brand Logo / Initial
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: AppColors.primaryLight,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.point_of_sale,
              color: AppColors.primary,
              size: 28,
            ),
          ),
          const SizedBox(height: 40),

          // Menu Kasir Cepat (Sedang Aktif)
          _buildNavItem(Icons.shopping_bag, 'Kasir', true, () {}),

          // Menu Reservation (Navigasi)
          _buildNavItem(Icons.receipt_long, 'Reservation', false, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ReservationListPage(),
              ),
            );
          }),

          _buildNavItem(
            Icons.table_bar_outlined,
            'Table Management',
            false,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TableManagementPage(),
                ),
              );
            },
          ),

          // Menu Lainnya
          _buildNavItem(Icons.inventory_2_outlined, 'Inventories', false, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const InventoryPage()),
            );
          }),

          _buildNavItem(Icons.inventory_2_outlined, 'Stock Count', false, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const StockCountListPage(),
              ),
            );
          }),

          _buildNavItem(Icons.people_outline_outlined, 'Member', false, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MemberListPage()),
            );
          }),

          const Spacer(),

          // Settings
          _buildNavItem(Icons.settings_outlined, 'Setting', false, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PrinterSettingsPage(),
              ),
            );
          }),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    bool isActive,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: isActive ? AppColors.primary : Colors.transparent,
              width: 4,
            ),
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isActive ? AppColors.primary : Colors.grey.shade400,
              size: 28,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                color: isActive ? AppColors.primary : Colors.grey.shade500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
