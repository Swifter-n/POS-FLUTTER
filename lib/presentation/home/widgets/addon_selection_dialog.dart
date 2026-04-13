import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/data/model/payloads/cart_item_payload/cart_item_payload.dart';
import 'package:avis_pos/data/model/payloads/order_item_addon_request/order_item_addon_request.dart';
import 'package:avis_pos/data/model/responses/product/product_model.dart';
import 'package:avis_pos/data/model/responses/uom_model/uom_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddonSelectionDialog extends StatefulWidget {
  final ProductModel product;

  const AddonSelectionDialog({super.key, required this.product});

  @override
  State<AddonSelectionDialog> createState() => _AddonSelectionDialogState();
}

class _AddonSelectionDialogState extends State<AddonSelectionDialog> {
  final List<OrderItemAddonRequest> _selectedAddons = [];
  final TextEditingController _noteController = TextEditingController();
  int _quantity = 1;

  // Variabel state
  late String _selectedUom;
  late double _currentPrice;

  final currencyFormatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  @override
  void initState() {
    super.initState();

    if (widget.product.uoms != null && widget.product.uoms!.isNotEmpty) {
      final defaultUom = widget.product.uoms!.first;
      _selectedUom = defaultUom.name ?? 'PCS';
      _currentPrice = _calculatePrice(defaultUom);
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

  // --- FUNGSI KALKULATOR HARGA UOM YANG BERSIH (TANPA HARDCODE) ---
  double _calculatePrice(UomModel uomData) {
    final double basePrice = widget.product.price ?? 0;

    // 1. Jika ada override harga spesifik dari database
    if (uomData.price != null && uomData.price! > 0) {
      return uomData.price!;
    }

    // 2. Ambil conversion_rate yang ASLI dari API (misal 24 untuk CRT)
    final double rate =
        (uomData.conversionRate != null && uomData.conversionRate! > 0)
        ? uomData.conversionRate!
        : 1.0;

    // 3. Kalikan Harga Dasar (50.000) dengan Rate (24) = 1.200.000
    return basePrice * rate;
  }

  void _confirm() {
    final payload = CartItemPayload(
      productId: widget.product.productId ?? 0,
      productName: widget.product.name,
      quantity: _quantity.toDouble(),
      uom: _selectedUom,
      price: _currentPrice,
      note: _noteController.text.trim().isNotEmpty
          ? _noteController.text.trim()
          : null,
      addons: _selectedAddons,
    );

    Navigator.pop(context, payload);
  }

  @override
  Widget build(BuildContext context) {
    // Harga total dinamis untuk tampilan (Harga Satuan + Addons) * Qty
    double addonTotal = _selectedAddons.fold(
      0,
      (sum, item) => sum + item.price!,
    );
    double displayTotalPrice = (_currentPrice + addonTotal) * _quantity;

    return AlertDialog(
      title: Text('Pesan ${widget.product.name ?? 'Produk'}'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- TAMPILAN HARGA TOTAL SEMENTARA ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primaryLight.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.primaryLight),
              ),
              child: Column(
                children: [
                  const Text(
                    'Total Harga',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  Text(
                    currencyFormatter.format(displayTotalPrice),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryDark,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // --- UI PEMILIHAN UOM ---
            if (widget.product.uoms != null &&
                widget.product.uoms!.length > 1) ...[
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
                items: widget.product.uoms!.map((uom) {
                  // Hitung harga per dropdown item agar kasir bisa lihat preview harga
                  final previewPrice = _calculatePrice(uom);
                  return DropdownMenuItem<String>(
                    value: uom.name,
                    child: Text(
                      '${uom.name ?? '-'} (${currencyFormatter.format(previewPrice)})',
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedUom = value;
                      final selectedUomData = widget.product.uoms!.firstWhere(
                        (u) => u.name == value,
                        orElse: () => widget.product.uoms!.first,
                      );
                      // Update harga berdasarkan UOM yang dipilih
                      _currentPrice = _calculatePrice(selectedUomData);
                    });
                  }
                },
              ),
              const SizedBox(height: 16),
            ],

            // --- INPUT CATATAN ---
            TextField(
              controller: _noteController,
              decoration: InputDecoration(
                hintText: 'Catatan tambahan (opsional)...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // --- UI ADD-ONS / TOPPING ---
            if (widget.product.addons != null &&
                widget.product.addons!.isNotEmpty) ...[
              const Text(
                'Add-ons / Topping:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ...widget.product.addons!.map((a) {
                final isSelected = _selectedAddons.any(
                  (req) => req.addonId == a.id,
                );
                return CheckboxListTile(
                  title: Text(a.name ?? '-'),
                  subtitle: Text('+ ${currencyFormatter.format(a.price ?? 0)}'),
                  value: isSelected,
                  contentPadding: EdgeInsets.zero,
                  activeColor: AppColors.primary,
                  onChanged: (val) {
                    setState(() {
                      if (val == true) {
                        _selectedAddons.add(
                          OrderItemAddonRequest(
                            addonId: a.id ?? 0,
                            addonName: a.name,
                            quantity: 1,
                            price: a.price ?? 0,
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
              const SizedBox(height: 16),
            ],

            // --- UI QUANTITY ---
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.remove_circle,
                    color: AppColors.primary,
                    size: 36,
                  ),
                  onPressed: () => setState(() {
                    if (_quantity > 1) _quantity--;
                  }),
                ),
                const SizedBox(width: 16),
                Text(
                  '$_quantity',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon: const Icon(
                    Icons.add_circle,
                    color: AppColors.primary,
                    size: 36,
                  ),
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
          child: const Text('Batal', style: TextStyle(color: Colors.grey)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: _confirm,
          child: const Text(
            'Tambah ke Keranjang',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
