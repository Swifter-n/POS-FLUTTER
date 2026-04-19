import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/presentation/home/bloc/cart/cart_bloc.dart';
import 'package:avis_pos/presentation/home/widgets/active_promo_slider.dart';
import 'package:avis_pos/presentation/home/widgets/cart_summary.dart';
import 'package:avis_pos/presentation/home/widgets/category_horizontal_list.dart';
import 'package:avis_pos/presentation/home/widgets/product_grid_view.dart';
import 'package:avis_pos/presentation/inventory/pages/inventory_page.dart';
import 'package:avis_pos/presentation/member/pages/member_list_page.dart';
import 'package:avis_pos/presentation/reservation/pages/reservation_list_page.dart';
import 'package:avis_pos/presentation/settings/pages/table_management_page.dart';
import 'package:avis_pos/presentation/stock_count/pages/stock_count_list_page.dart';
import 'package:avis_pos/presentation/settings/pages/printer_settings_page.dart';
import 'package:avis_pos/presentation/home/widgets/search_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  // ✅ FIX: Helper navigasi aman — beri jeda agar frame aktif stabil dulu
  void _navigateTo(BuildContext context, Widget page) {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (context.mounted) {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          _buildAppNavigation(context),

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
                      const SearchProductWidget(width: 300),
                    ],
                  ),
                ),

                const CategoryHorizontalList(),

                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: ActivePromoSlider(),
                ),

                const Expanded(child: ProductGridView()),
              ],
            ),
          ),

          // Cart Summary
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
                orElse: () => false,
              );

              if (!showCart) return const SizedBox.shrink();

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

  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      width: 80,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 24),
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

          _buildNavItem(Icons.shopping_bag, 'Kasir', true, () {}),

          _buildNavItem(Icons.receipt_long, 'Reservation', false, () {
            _navigateTo(context, const ReservationListPage());
          }),

          _buildNavItem(
            Icons.table_bar_outlined,
            'Table Management',
            false,
            () {
              _navigateTo(context, const TableManagementPage());
            },
          ),

          _buildNavItem(Icons.inventory_2_outlined, 'Inventories', false, () {
            _navigateTo(context, const InventoryPage());
          }),

          _buildNavItem(Icons.warehouse_outlined, 'Stock Count', false, () {
            _navigateTo(context, const StockCountListPage());
          }),

          _buildNavItem(Icons.people_outline_outlined, 'Member', false, () {
            _navigateTo(context, const MemberListPage());
          }),

          const Spacer(),

          _buildNavItem(Icons.settings_outlined, 'Setting', false, () {
            _navigateTo(context, const PrinterSettingsPage());
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
