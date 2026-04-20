import 'package:avis_pos/presentation/home/bloc/cart/cart_bloc.dart'; // <-- JANGAN LUPA IMPORT CART BLOC
import 'package:avis_pos/presentation/home/bloc/category/category_bloc.dart';
import 'package:avis_pos/presentation/home/bloc/product/product_bloc.dart';
import 'package:avis_pos/presentation/home/bloc/promo/promo_bloc.dart';
import 'package:avis_pos/presentation/home/bloc/settings/settings_bloc.dart';
import 'package:avis_pos/presentation/home/pages/mobile_layout.dart';
import 'package:avis_pos/presentation/home/pages/tablet_layout.dart';
import 'package:avis_pos/presentation/settings/bloc/printer/printer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(const CategoryEvent.fetch());
    context.read<ProductBloc>().add(const ProductEvent.fetch());
    context.read<PromoBloc>().add(const PromoEvent.fetchAll());
    context.read<SettingsBloc>().add(const SettingsEvent.getSettings());
    context.read<CartBloc>().add(const CartEvent.started());
    context.read<PrinterBloc>().add(const PrinterEvent.fetchSettings());
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Jika lebar layar > 900 pixel, gunakan layout Tablet
        if (constraints.maxWidth > 900) {
          return const TabletLayout();
        }
        // Jika layar kecil, gunakan layout Mobile
        return const MobileLayout();
      },
    );
  }
}
