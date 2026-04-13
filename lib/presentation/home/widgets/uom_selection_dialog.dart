import 'package:avis_pos/core/components/buttons.dart';
import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/data/model/responses/product/product_model.dart';
import 'package:avis_pos/data/model/responses/uom_model/uom_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UomSelectionDialog extends StatefulWidget {
  final ProductModel product;

  /// Mengembalikan nilai [UomModel] yang dipilih oleh kasir
  const UomSelectionDialog({super.key, required this.product});

  @override
  State<UomSelectionDialog> createState() => _UomSelectionDialogState();
}

class _UomSelectionDialogState extends State<UomSelectionDialog> {
  UomModel? _selectedUom;

  final currencyFormatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  @override
  void initState() {
    super.initState();
    // Default pilih uom pertama jika tersedia
    if (widget.product.uoms.isNotEmpty) {
      _selectedUom = widget.product.uoms.first;
    }
  }

  void _confirmSelection() {
    if (_selectedUom != null) {
      Navigator.pop(context, _selectedUom);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      child: Container(
        width: 350,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Pilih Satuan',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              widget.product.name,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
            const Divider(height: 32),

            // UOM List
            if (widget.product.uoms.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Center(child: Text('Data satuan tidak tersedia.')),
              )
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.product.uoms.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final uom = widget.product.uoms[index];
                  final isSelected =
                      _selectedUom?.name ==
                      uom.name; // Asumsi field nama adalah name

                  // Hitung harga berdasar conversion rate
                  // 1. Amankan rate konversinya (Jika null, paksa jadi 1)
                  final double safeRate =
                      (uom.conversionRate != null && uom.conversionRate! > 0)
                      ? uom.conversionRate!
                      : 1.0;

                  // 2. Hitung harga: Jika backend kirim harga khusus (uom.price), pakai itu. Jika tidak, kalikan dengan rate.
                  final double uomPrice = (uom.price != null && uom.price! > 0)
                      ? uom.price!
                      : (widget.product.price ?? 0) * safeRate;

                  return InkWell(
                    onTap: () => setState(() => _selectedUom = uom),
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primaryLight
                            : Colors.transparent,
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primary
                              : Colors.grey.shade300,
                          width: isSelected ? 2 : 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                uom.name!, // ex: PCS, BOX
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isSelected
                                      ? AppColors.primaryDark
                                      : AppColors.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Isi: ${uom.conversionRate!.toInt()}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            currencyFormatter.format(uomPrice),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

            const SizedBox(height: 32),

            // Submit Button
            AppButton(
              label: 'Pilih Satuan',
              onPressed: _selectedUom == null ? () {} : _confirmSelection,
              color: _selectedUom == null ? Colors.grey : AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
