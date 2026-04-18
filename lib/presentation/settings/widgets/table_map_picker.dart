import 'package:flutter/material.dart';
import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/data/model/responses/table_model/table_model.dart';

class TableMapPicker extends StatelessWidget {
  final List<TableModel> tables;
  final int? selectedTableId;
  final ValueChanged<TableModel> onTableSelected;

  const TableMapPicker({
    super.key,
    required this.tables,
    required this.selectedTableId,
    required this.onTableSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            width: 1500,
            height: 1500,
            child: Stack(
              children: tables.asMap().entries.map((entry) {
                final table = entry.value;
                final bool isSelected = table.id == selectedTableId;

                // ==========================================
                // LOGIKA 4 STATE MEJA
                // ==========================================
                final bool hasActiveOrder =
                    (table.activeOrderId != null && table.activeOrderId! > 0);
                final bool isOccupied =
                    table.isOccupied ?? (table.status == 'occupied');
                final String resStatus =
                    table.reservationStatus?.toLowerCase() ?? '';
                final bool isReserved =
                    resStatus == 'booked' || resStatus == 'seated';

                Color tableColor;
                Color borderColor;
                String tableLabel;
                IconData tableIcon;

                // 1. OPEN BILL (RED) - Sedang makan
                if (hasActiveOrder) {
                  tableColor = Colors.red.shade500;
                  borderColor = Colors.red.shade700;
                  tableIcon = Icons.restaurant_menu;
                  // Bedakan label jika berasal dari reservasi atau walk-in
                  tableLabel = isReserved ? 'RESERVASI' : 'OPEN BILL';
                }
                // 2. DINE IN (BLUE) - Sudah lunas, tapi fisik masih duduk
                else if (isOccupied && !hasActiveOrder && !isReserved) {
                  tableColor = Colors.blue.shade500;
                  borderColor = Colors.blue.shade700;
                  tableIcon = Icons.check_circle;
                  tableLabel = 'DINE IN\n(LUNAS)';
                }
                // 3. RESERVASI (ORANGE) - Booked atau Seated tapi belum pesan
                else if (isReserved) {
                  tableColor = Colors.orange.shade500;
                  borderColor = Colors.orange.shade700;
                  tableIcon = Icons.event_seat;
                  tableLabel = resStatus == 'seated' ? 'SEATED' : 'BOOKED';
                }
                // 4. AVAILABLE (GREEN) - Kosong total
                else {
                  tableColor = Colors.green.shade500;
                  borderColor = Colors.green.shade700;
                  tableIcon = Icons.table_restaurant;
                  tableLabel = 'AVAILABLE';
                }

                // Hitung posisi koordinat
                double displayX = table.x;
                double displayY = table.y;
                if (displayX == 0 && displayY == 0) {
                  displayX = 50.0 + (entry.key * 150 % 900);
                  displayY = 50.0 + ((entry.key * 150 / 900).floor() * 150);
                }

                return Positioned(
                  left: displayX,
                  top: displayY,
                  child: GestureDetector(
                    onTap: () => onTableSelected(table),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: tableColor.withOpacity(isSelected ? 1.0 : 0.8),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: isSelected ? Colors.black : borderColor,
                          width: isSelected ? 4 : 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(tableIcon, size: 24, color: Colors.white),
                          const SizedBox(height: 4),
                          Text(
                            table.code,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            tableLabel,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
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
