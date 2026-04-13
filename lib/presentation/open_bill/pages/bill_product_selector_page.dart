import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/data/model/payloads/cart_item_payload/cart_item_payload.dart';
import 'package:avis_pos/data/model/payloads/order_item_addon_request/order_item_addon_request.dart';
import 'package:avis_pos/data/model/responses/order_model/order_model.dart';
import 'package:avis_pos/data/model/responses/product/product_model.dart';
import 'package:avis_pos/presentation/home/bloc/category/category_bloc.dart';
import 'package:avis_pos/presentation/home/bloc/product/product_bloc.dart';
import 'package:avis_pos/presentation/home/widgets/addon_selection_dialog.dart';
import 'package:avis_pos/presentation/home/widgets/product_card.dart';
import 'package:avis_pos/presentation/open_bill/bloc/open_bill/open_bill_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillProductSelectorPage extends StatefulWidget {
  const BillProductSelectorPage({super.key});

  @override
  State<BillProductSelectorPage> createState() =>
      _BillProductSelectorPageState();
}

class _BillProductSelectorPageState extends State<BillProductSelectorPage> {
  int? _selectedCategoryId;

  @override
  void initState() {
    super.initState();
    // Refresh produk saat halaman dibuka
    context.read<CategoryBloc>().add(const CategoryEvent.fetch());
    context.read<ProductBloc>().add(const ProductEvent.fetch());
  }

  void _onCategoryTapped(int? categoryId) {
    setState(() {
      _selectedCategoryId = categoryId;
    });

    // Pengecekan aman sesuai dengan ProductEvent Anda
    if (categoryId == null) {
      // Jika kasir memilih "Semua"
      context.read<ProductBloc>().add(const ProductEvent.fetch());
    } else {
      // Jika kasir memilih kategori spesifik (contoh: Coffee, Non-Coffee)
      context.read<ProductBloc>().add(ProductEvent.fetchByCategory(categoryId));
    }
  }

  void _handleAddProductToBill(
    BuildContext context,
    ProductModel product,
    OrderModel currentOrder,
  ) async {
    // 1. Tampilkan Pop-up Addon (Kita bisa menggunakan dialog yang sudah ada, tapi memodifikasi behavior-nya)
    // Karena AddonSelectionDialog didesain untuk menembak CartBloc, kita perlu cara untuk menangkap
    // item yang dipilih tanpa menembak CartBloc, ATAU kita buat custom action.
    //
    // Untuk kesederhanaan dan modularitas (seperti video), kita asumsikan AddonSelectionDialog
    // dapat diubah untuk *mengembalikan* data jika ditembak dari konteks tertentu,
    // tapi karena kita butuh cepat dan clean: Mari kita panggil dialog modifikasi di bawah.

    final result = await showDialog<CartItemPayload>(
      context: context,
      builder: (context) => _BillAddonDialog(product: product),
    );

    if (result != null && context.mounted) {
      // 2. Tembak event ke OpenBillBloc
      context.read<OpenBillBloc>().add(
        OpenBillEvent.addItemToBill(currentOrder.id, result),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OpenBillBloc, OpenBillState>(
      builder: (context, openBillState) {
        return openBillState.maybeWhen(
          loaded: (orders, selectedOrder, usePoints, ignoredRules) {
            if (selectedOrder == null) {
              return const Scaffold(
                body: Center(child: Text('Tidak ada meja yang dipilih')),
              );
            }

            return Scaffold(
              backgroundColor: AppColors.background,
              appBar: AppBar(
                title: Text(
                  'Tambah ke ${selectedOrder.tableNumber ?? 'Meja -'}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.white,
                foregroundColor: AppColors.textPrimary,
                elevation: 0,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(60),
                  child: _buildCategoryFilters(),
                ),
              ),
              body: BlocConsumer<OpenBillBloc, OpenBillState>(
                listener: (context, state) {
                  state.maybeWhen(
                    success: (message) {
                      if (message.contains('berhasil dimasukkan')) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(message),
                            backgroundColor: AppColors.primary,
                          ),
                        );
                      }
                    },
                    orElse: () {},
                  );
                },
                builder: (context, state) {
                  // Menampilkan indikator loading global jika sedang memproses ke server
                  bool isProcessing = false;
                  state.maybeWhen(
                    loading: () => isProcessing = true,
                    orElse: () {},
                  );

                  return Stack(
                    children: [
                      BlocBuilder<ProductBloc, ProductState>(
                        builder: (context, productState) {
                          return productState.maybeWhen(
                            loading: () => const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primary,
                              ),
                            ),
                            error: (msg) => Center(
                              child: Text(
                                msg,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                            loaded: (products) {
                              if (products.isEmpty) {
                                return const Center(
                                  child: Text('Tidak ada produk tersedia.'),
                                );
                              }
                              return GridView.builder(
                                padding: const EdgeInsets.all(20),
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 220,
                                      childAspectRatio: 0.75,
                                      crossAxisSpacing: 16,
                                      mainAxisSpacing: 16,
                                    ),
                                itemCount: products.length,
                                itemBuilder: (context, index) {
                                  final product = products[index];
                                  return ProductCard(
                                    product: product,
                                    onTap: () => _handleAddProductToBill(
                                      context,
                                      product,
                                      selectedOrder,
                                    ),
                                  );
                                },
                              );
                            },
                            orElse: () => const SizedBox.shrink(),
                          );
                        },
                      ),

                      // Overlay Loading
                      if (isProcessing)
                        Container(
                          color: Colors.black.withOpacity(0.3),
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            );
          },
          orElse: () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
        );
      },
    );
  }

  Widget _buildCategoryFilters() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.white,
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (categories) {
              return ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _filterChip(null, 'Semua'),
                  ...categories.map((c) => _filterChip(c.id, c.name)),
                ],
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _filterChip(int? id, String name) {
    final isSelected = _selectedCategoryId == id;
    return Padding(
      padding: const EdgeInsets.only(right: 8, top: 12, bottom: 12),
      child: ChoiceChip(
        label: Text(
          name,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.textPrimary,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        selected: isSelected,
        selectedColor: AppColors.primary,
        backgroundColor: AppColors.background,
        onSelected: (_) => _onCategoryTapped(id),
      ),
    );
  }
}

// --- INTERNAL WIDGET: ADDON DIALOG KHUSUS OPEN BILL ---
// Dialog ini mengembalikan CartItemPayload, TIDAK menembak CartBloc.
class _BillAddonDialog extends StatefulWidget {
  final ProductModel product;
  const _BillAddonDialog({required this.product});

  @override
  State<_BillAddonDialog> createState() => _BillAddonDialogState();
}

class _BillAddonDialogState extends State<_BillAddonDialog> {
  final List<OrderItemAddonRequest> _selectedAddons = [];
  final TextEditingController _noteController = TextEditingController();
  int _quantity = 1;
  late String _selectedUom;
  late double _currentPrice;

  @override
  void initState() {
    super.initState();

    if (widget.product.uoms.isNotEmpty) {
      final defaultUom = widget.product.uoms.first;
      _selectedUom = defaultUom.name ?? 'PCS';
      // Ambil harga spesifik dari UOM tersebut, jika null, pakai harga dasar produk
      _currentPrice = defaultUom.price ?? widget.product.price ?? 0;
    } else {
      _selectedUom = 'PCS';
      _currentPrice = widget.product.price ?? 0;
    }
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _confirm() {
    final payload = CartItemPayload(
      productId: widget.product.productId,
      quantity: _quantity.toDouble(),
      uom: widget.product.uoms.isNotEmpty
          ? widget.product.uoms.first.name!
          : 'PCS', // Fallback
      price: widget.product.price,
      note: _noteController.text.trim().isNotEmpty
          ? _noteController.text.trim()
          : null,
      addons: _selectedAddons,
    );
    Navigator.pop(context, payload);
  }

  @override
  Widget build(BuildContext context) {
    // Note: Ini versi sederhana dari AddonSelectionDialog, fokus pada konfirmasi
    return AlertDialog(
      title: Text('Pesan ${widget.product.name}'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.product.uoms.length > 1) ...[
              const Text(
                'Satuan (UOM):',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedUom,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                items: widget.product.uoms.map((uom) {
                  return DropdownMenuItem<String>(
                    value: uom.name,
                    child: Text(uom.name ?? '-'),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedUom = value;

                      final selectedUomData = widget.product.uoms.firstWhere(
                        (u) => u.name == value,
                        orElse: () => widget.product.uoms.first,
                      );

                      _currentPrice =
                          selectedUomData.price ?? widget.product.price ?? 0;
                    });
                  }
                },
              ),
              const SizedBox(height: 16),
            ],
            TextField(
              controller: _noteController,
              decoration: const InputDecoration(
                hintText: 'Catatan tambahan...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // UI Add-ons
            if (widget.product.addons.isNotEmpty) ...[
              const Text(
                'Add-ons / Topping:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ...widget.product.addons.map((a) {
                final isSelected = _selectedAddons.any(
                  (req) => req.addonId == a.id,
                );
                return CheckboxListTile(
                  title: Text(a.name),
                  subtitle: Text('+ ${a.price}'),
                  value: isSelected,
                  onChanged: (val) {
                    setState(() {
                      if (val == true) {
                        _selectedAddons.add(
                          OrderItemAddonRequest(
                            addonId: a.id,
                            quantity: 1,
                            price: a.price,
                          ),
                        );
                      } else {
                        _selectedAddons.removeWhere(
                          (req) => req.addonId == a.id,
                        );
                      }
                    });
                  },
                );
              }),
            ],
            const SizedBox(height: 16),

            // UI Quantity
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle),
                  onPressed: () => setState(() {
                    if (_quantity > 1) _quantity--;
                  }),
                ),
                Text(
                  '$_quantity',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle),
                  onPressed: () => setState(() => _quantity++),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Batal'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
          onPressed: _confirm,
          child: const Text('Tambah ke Meja'),
        ),
      ],
    );
  }
}
