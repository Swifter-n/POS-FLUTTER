import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/data/model/responses/table_model/table_model.dart';
import 'package:flutter/material.dart';

class TableMapPicker extends StatelessWidget {
  final List<TableModel> tables;
  final int? selectedTableId;
  final ValueChanged<TableModel?> onTableSelected;

  const TableMapPicker({
    super.key,
    required this.tables,
    required this.selectedTableId,
    required this.onTableSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Dialog biasanya memberikan lebar terbatas, kita beri constraint
      width: double.maxFinite,
      height: 450,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: InteractiveViewer(
          constrained: false,
          boundaryMargin: const EdgeInsets.all(200),
          minScale: 0.1,
          maxScale: 2.5,
          child: SizedBox(
            width: 1500, // Area kanvas yang luas agar semua meja terlihat
            height: 1500,
            child: Stack(
              children: tables.asMap().entries.map((entry) {
                final index = entry.key;
                final table = entry.value;

                final bool isOccupied = table.isOccupied ?? false;
                final bool isSelected = table.id == selectedTableId;

                // Logika Penempatan: Gunakan koordinat, jika 0 pakai algoritma grid otomatis
                double displayX = table.x;
                double displayY = table.y;
                if (displayX == 0 && displayY == 0) {
                  displayX = 50.0 + (index * 150 % 900);
                  displayY = 50.0 + ((index * 150 / 900).floor() * 150);
                }

                return Positioned(
                  left: displayX,
                  top: displayY,
                  child: GestureDetector(
                    onTap: () {
                      // Tetap izinkan klik meja terisi agar kasir bisa lihat info,
                      // tapi logika "pindah" atau "pilih" diserahkan ke fungsi callback
                      onTableSelected(table);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary
                            : (isOccupied
                                  ? Colors.orange.shade100
                                  : Colors.white),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primaryDark
                              : (isOccupied
                                    ? Colors.orange.shade300
                                    : Colors.grey.shade300),
                          width: isSelected ? 3 : 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            isOccupied ? Icons.person : Icons.table_restaurant,
                            size: 24,
                            color: isSelected
                                ? Colors.white
                                : (isOccupied
                                      ? Colors.orange.shade700
                                      : Colors.green.shade600),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            table.code,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: isSelected ? Colors.white : Colors.black87,
                            ),
                          ),
                          Text(
                            isOccupied ? 'TERISI' : 'KOSONG',
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w600,
                              color: isSelected
                                  ? Colors.white70
                                  : (isOccupied
                                        ? Colors.orange.shade800
                                        : Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
