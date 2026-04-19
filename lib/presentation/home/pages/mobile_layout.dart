import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/presentation/home/widgets/active_promo_slider.dart';
import 'package:avis_pos/presentation/home/widgets/checkout_bar_mobile.dart';
import 'package:avis_pos/presentation/home/widgets/drawer_widget_mobile.dart';
import 'package:avis_pos/presentation/home/widgets/mobile_product_view.dart';
import 'package:avis_pos/presentation/home/widgets/search_product_widget.dart';
import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: const DrawerWidgetMobile(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'TAIYO POS',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.primary),
      ),
      body: Column(
        children: [
          // Cari Produk Mobile
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SearchProductWidget(),
          ),

          // Promo Slider (Mobile sedikit lebih kecil)
          const ActivePromoSlider(),

          // List Produk Mobile
          const Expanded(child: MobileProductView()),
        ],
      ),
      // Bar Checkout yang melayang di bawah
      bottomNavigationBar: const CheckoutBarMobile(),
    );
  }
}
