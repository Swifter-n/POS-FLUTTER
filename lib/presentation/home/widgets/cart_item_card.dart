import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/data/model/payloads/cart_item_payload/cart_item_payload.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CartItemCard extends StatelessWidget {
  final CartItemPayload item;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onRemove;

  // 👇 Tambahkan Callback Baru untuk Manual Input
  final ValueChanged<double>? onQuantityChanged;

  const CartItemCard({
    super.key,
    required this.item,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
    this.onQuantityChanged,
  });

  // 👇 Tambahkan Fungsi Dialog Input Manual
  void _showEditQuantityDialog(BuildContext context) {
    final TextEditingController qtyController = TextEditingController(
      text: item.quantity.toInt().toString(),
    );

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Ubah Jumlah Pesanan',
            style: TextStyle(fontSize: 18),
          ),
          content: TextField(
            controller: qtyController,
            keyboardType: TextInputType.number,
            autofocus: true,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ], // Pastikan hanya angka
            decoration: const InputDecoration(
              labelText: 'Jumlah',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.edit),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Batal', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),
              onPressed: () {
                final double? newQty = double.tryParse(qtyController.text);
                if (newQty != null && newQty > 0) {
                  if (onQuantityChanged != null) {
                    onQuantityChanged!(newQty);
                  }
                }
                Navigator.pop(dialogContext);
              },
              child: const Text(
                'Simpan',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    // Kalkulasi harga satuan + addons
    double addonTotal = 0;
    if (item.addons != null) {
      for (var addon in item.addons!) {
        addonTotal += ((addon.price ?? 0) * addon.quantity);
      }
    }
    double unitPriceWithAddons = item.price + addonTotal;
    double totalPrice = unitPriceWithAddons * item.quantity;

    final String uomLabel = item.uom ?? 'PCS';
    final bool hasAddons = item.addons != null && item.addons!.isNotEmpty;
    final bool hasNote = item.note != null && item.note!.isNotEmpty;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade100, width: 1.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // --- 1. UI QUANTITY CONTROL (Vertical Pill Modern) ---
          Container(
            width: 46,
            decoration: BoxDecoration(
              color: AppColors.primaryLight.withOpacity(0.2),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: AppColors.primaryLight.withOpacity(0.4),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minHeight: 36),
                  icon: const Icon(
                    Icons.add,
                    size: 18,
                    color: AppColors.primaryDark,
                  ),
                  onPressed: onIncrease,
                ),

                // 👇 Modifikasi Angka menjadi Tappable (Bisa Diketuk)
                InkWell(
                  onTap: onQuantityChanged != null
                      ? () => _showEditQuantityDialog(context)
                      : null,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    child: Text(
                      '${item.quantity.toInt()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.primaryDark,
                      ),
                    ),
                  ),
                ),

                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minHeight: 36),
                  icon: const Icon(
                    Icons.remove,
                    size: 18,
                    color: AppColors.primaryDark,
                  ),
                  onPressed: onDecrease,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),

          // --- 2. DETAIL PRODUK & HARGA ---
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header (Nama Produk & Tombol Hapus)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.productName ?? 'Produk ID: ${item.productId}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: AppColors.textPrimary,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          // Badge Satuan (UOM) & Harga Dasar
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                child: Text(
                                  uomLabel,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                currencyFormatter.format(item.price),
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.redAccent,
                        size: 22,
                      ),
                      onPressed: onRemove,
                      constraints: const BoxConstraints(),
                      padding: const EdgeInsets.only(left: 8, bottom: 8),
                    ),
                  ],
                ),

                // Rincian Addons (Topping) & Catatan
                if (hasAddons || hasNote) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade100),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (hasAddons)
                          ...item.addons!.map(
                            (a) => Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '+ ${a.addonName ?? 'Topping ID: ${a.addonId}'}',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey.shade700,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    currencyFormatter.format(a.price ?? 0),
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (hasNote)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.edit_note,
                                size: 14,
                                color: Colors.orange.shade700,
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  item.note!,
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.orange.shade700,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],

                const SizedBox(height: 12),
                // Total Harga per Baris
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    currencyFormatter.format(totalPrice),
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
