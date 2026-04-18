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
                final index = entry.key;
                final table = entry.value;
                final bool isSelected = table.id == selectedTableId;

                // ==========================================
                // 4-STATE VISUAL LOGIC
                // ==========================================
                final bool hasActiveOrder =
                    (table.activeOrderId != null && table.activeOrderId! > 0);
                final bool isOccupiedFisik = table.isOccupied ?? false;
                final String resStatus =
                    table.reservationStatus?.toLowerCase() ?? '';
                final bool isBooked = (resStatus == 'booked');
                final bool isSeated = (resStatus == 'seated');
                final bool isReserved = isBooked || isSeated;

                Color cardColor;
                Color borderColor;
                Color mainColor;
                String badgeText;
                IconData tableIcon;

                // 1. OPEN BILL (RED) - Ada pesanan belum lunas
                if (hasActiveOrder) {
                  cardColor = Colors.red.shade50;
                  borderColor = Colors.red.shade300;
                  mainColor = Colors.red.shade600;
                  badgeText = 'OPEN BILL';
                  tableIcon = Icons.receipt_long;
                }
                // 2. DINE IN LUNAS (BLUE) - Fisik duduk, tagihan 0
                else if (isOccupiedFisik && !isReserved) {
                  cardColor = Colors.blue.shade50;
                  borderColor = Colors.blue.shade300;
                  mainColor = Colors.blue.shade700;
                  badgeText = 'DINE IN';
                  tableIcon = Icons.person_pin;
                }
                // 3. RESERVASI (ORANGE) - Booked / Seated tapi belum order
                else if (isReserved) {
                  cardColor = Colors.orange.shade50;
                  borderColor = Colors.orange.shade300;
                  mainColor = Colors.orange.shade700;
                  badgeText = isSeated ? 'SEATED' : 'BOOKED';
                  tableIcon = isSeated ? Icons.how_to_reg : Icons.event_seat;
                }
                // 4. AVAILABLE (GREEN) - Kosong total
                else {
                  cardColor = Colors.white;
                  borderColor = Colors.grey.shade300;
                  mainColor = Colors.green.shade600;
                  badgeText = 'AVAILABLE';
                  tableIcon = Icons.table_restaurant;
                }

                // Tumpuk warna jika meja sedang diklik/dipilih
                if (isSelected) {
                  borderColor = AppColors.primaryDark;
                  cardColor = AppColors.primary;
                  mainColor = Colors.white;
                }

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
                    onTap: () => onTableSelected(table),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: borderColor,
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
                          Icon(tableIcon, size: 24, color: mainColor),
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
                            badgeText,
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w700,
                              color: isSelected ? Colors.white70 : mainColor,
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
