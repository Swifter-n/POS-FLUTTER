part of 'inventory_bloc.dart';

@freezed
class InventoryState with _$InventoryState {
  const factory InventoryState.initial() = _Initial;
  const factory InventoryState.loading() = _Loading;
  const factory InventoryState.loaded(List<InventoryModel> inventories) =
      _Loaded;
  const factory InventoryState.success(String message) = _Success;
  const factory InventoryState.error(String message) = _Error;
}
