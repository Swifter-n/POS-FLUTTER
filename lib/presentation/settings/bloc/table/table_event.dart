part of 'table_bloc.dart';

@freezed
class TableEvent with _$TableEvent {
  const factory TableEvent.fetch() = _Fetch;

  const factory TableEvent.moveTable({
    required int tableId,
    required double newX,
    required double newY,
  }) = _MoveTable;

  const factory TableEvent.savePositions() = _SavePositions;

  const factory TableEvent.addTable(Map<String, dynamic> data) = _AddTable;

  const factory TableEvent.updateTable(int id, Map<String, dynamic> data) =
      _UpdateTable;

  const factory TableEvent.deleteTable(int id) = _DeleteTable;

  const factory TableEvent.clear(int tableId) = _Clear;

  const factory TableEvent.voidOrder({required int orderId, String? reason}) =
      _VoidOrder;

  const factory TableEvent.transferTable({
    required int orderId,
    required String targetTableCode,
  }) = _TransferTable;
}
