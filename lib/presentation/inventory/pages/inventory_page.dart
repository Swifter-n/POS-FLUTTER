import 'dart:async';

import 'package:avis_pos/core/components/form_fields.dart';
import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/core/constants/variables.dart';
import 'package:avis_pos/presentation/inventory/bloc/inventory/inventory_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:avis_pos/core/constants/text_styles.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  late final TextEditingController _searchController;
  late final FocusNode _searchFocus;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchFocus = FocusNode();
    // Memanggil data stok saat halaman dibuka
    context.read<InventoryBloc>().add(const InventoryEvent.fetch());
  }

  // --- SOLUSI OPTIMASI: Murni logika Debounce TANPA setState ---
  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<InventoryBloc>().add(InventoryEvent.fetch(search: query));
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Pantau Stok Outlet'),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Segarkan Data',
            onPressed: () {
              _searchController.clear();
              context.read<InventoryBloc>().add(const InventoryEvent.fetch());
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // --- SEARCH BAR (Menggunakan Core Component) ---
              AppTextField(
                key: const ValueKey('inventory_search_field_final'),
                label: '',
                hint: 'Cari nama produk, sku, atau barcode...',
                controller: _searchController,
                prefixIcon: const Icon(Icons.search),
                onChanged: _onSearchChanged,
                // Mencegah toolbar "Copy/Paste" menutupi input saat klik 2x
                contextMenuBuilder: (context, editableTextState) {
                  return const SizedBox.shrink(); // Tidak menampilkan menu popup
                },
                onTap: () {
                  // Mempermudah pengetikan: Pilih semua teks saat di-tap
                  if (_searchController.text.isNotEmpty) {
                    _searchController.selection = TextSelection(
                      baseOffset: 0,
                      extentOffset: _searchController.text.length,
                    );
                  }
                },
                // Stabilitas Desktop
                selectionControls: materialTextSelectionControls,
              ),
              const SizedBox(height: 24),

            // --- LIST INVENTORY ---
            Expanded(
              child: BlocBuilder<InventoryBloc, InventoryState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    loaded: (inventories) {
                      // Logic filter lokal dipertahankan,
                      // namun langsung diekstrak dari _searchController.text secara realtime.
                      final query = _searchController.text.toLowerCase();
                      final filtered = inventories.where((e) {
                        final name = e.name?.toLowerCase() ?? '';
                        final sku = e.sku?.toLowerCase() ?? '';
                        final barcode = e.barcode?.toLowerCase() ?? '';
                        return name.contains(query) ||
                            sku.contains(query) ||
                            barcode.contains(query);
                      }).toList();

                      if (filtered.isEmpty) {
                        return const Center(
                          child: Text('Tidak ada data stok ditemukan.'),
                        );
                      }

                      return ListView.separated(
                        // --- SOLUSI SCROLL: Memaksa physics untuk scroll yang mulus dan konsisten ---
                        physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics(),
                        ),
                        itemCount: filtered.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final item = filtered[index];

                          // --- SMART STATUS LOGIC ---
                          // Menggunakan status murni dari backend (IN_STOCK, LOW_STOCK, OUT_OF_STOCK)
                          final String status = item.status ?? 'IN_STOCK';
                          final bool isOutOfStock = status == 'OUT_OF_STOCK';
                          final bool isLowStock = status == 'LOW_STOCK';

                          final Color statusColor = isOutOfStock
                              ? Colors.red
                              : isLowStock
                              ? Colors.orange
                              : Colors.blue;

                          final Color bgColor = isOutOfStock
                              ? Colors.red.shade50
                              : isLowStock
                              ? Colors.orange.shade50
                              : Colors.blue.shade50;

                          final Color badgeColor = isOutOfStock
                              ? Colors.red.shade100
                              : isLowStock
                              ? Colors.orange.shade100
                              : Colors.green.shade100;

                          final Color badgeTextColor = isOutOfStock
                              ? Colors.red.shade900
                              : isLowStock
                              ? Colors.orange.shade900
                              : Colors.green.shade900;

                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.stroke),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.02),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                              leading: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: bgColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child:
                                    (item.image != null &&
                                        item.image!.isNotEmpty)
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CachedNetworkImage(
                                          imageUrl: item.image!.startsWith('http')
                                              ? item.image!
                                              : '${Variables.imageBaseUrl}${item.image}',
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child:
                                                    CircularProgressIndicator(
                                                      strokeWidth: 2,
                                                    ),
                                              ),
                                          errorWidget: (context, url, error) =>
                                              Icon(
                                                isOutOfStock
                                                    ? Icons.block
                                                    : isLowStock
                                                    ? Icons
                                                          .warning_amber_rounded
                                                    : Icons.inventory_2,
                                                color: statusColor,
                                              ),
                                        ),
                                      )
                                    : Icon(
                                        isOutOfStock
                                            ? Icons.block
                                            : isLowStock
                                            ? Icons.warning_amber_rounded
                                            : Icons.inventory_2,
                                        color: statusColor,
                                      ),
                              ),
                              title: Text(
                                item.name ?? 'Unknown Product',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: badgeColor,
                                            borderRadius: BorderRadius.circular(
                                              6,
                                            ),
                                          ),
                                          child: Text(
                                            'Sisa: ${item.currentStock} ${item.unit ?? ''}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              color: badgeTextColor,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        // --- SMART STATUS LABEL ---
                                        Text(
                                          isOutOfStock
                                              ? 'Stok Habis'
                                              : isLowStock
                                              ? 'Stok Tipis'
                                              : 'Tersedia',
                                          style: TextStyle(
                                            color: statusColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: [
                                        if (item.sku != null &&
                                            item.sku!.isNotEmpty)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: 12.0,
                                            ),
                                            child: Text(
                                              'SKU: ${item.sku}',
                                              style: const TextStyle(
                                                fontSize: 11,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        if (item.barcode != null &&
                                            item.barcode!.isNotEmpty)
                                          Text(
                                            'Barcode: ${item.barcode}',
                                            style: const TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    error: (msg) => Center(
                      child: Text(
                        msg,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                    orElse: () =>
                        const Center(child: Text('Memuat data stok...')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}
