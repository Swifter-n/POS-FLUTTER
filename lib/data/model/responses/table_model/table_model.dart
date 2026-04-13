import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_model.freezed.dart';
part 'table_model.g.dart';

@freezed
class TableModel with _$TableModel {
  const factory TableModel({
    required int id,
    required String code,
    @JsonKey(name: 'x_position') @Default(0.0) double x,
    @JsonKey(name: 'y_position') @Default(0.0) double y,
    @Default('available') String status, // 'available', 'occupied'
    int? capacity,
  }) = _TableModel;

  factory TableModel.fromJson(Map<String, dynamic> json) =>
      _$TableModelFromJson(json);
}
