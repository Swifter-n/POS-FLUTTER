import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/presentation/home/widgets/active_promo_slider.dart';
import 'package:avis_pos/presentation/home/widgets/checkout_bar_mobile.dart';
import 'package:avis_pos/presentation/home/widgets/drawer_widget_mobile.dart';
import 'package:avis_pos/presentation/home/widgets/mobile_product_view.dart';
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
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Column(
        children: [
          // Promo Slider (Mobile sedikit lebih kecil)
          const SizedBox(height: 8),
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
