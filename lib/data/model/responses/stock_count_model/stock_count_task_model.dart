import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_count_task_model.freezed.dart';
part 'stock_count_task_model.g.dart';

@freezed
class StockCountTaskModel with _$StockCountTaskModel {
  const factory StockCountTaskModel({
    int? id,
    @JsonKey(name: 'count_number') String? countNumber,
    String? status,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'completed_at') String? completedAt,
  }) = _StockCountTaskModel;

  factory StockCountTaskModel.fromJson(Map<String, dynamic> json) =>
      _$StockCountTaskModelFromJson(json);
}
