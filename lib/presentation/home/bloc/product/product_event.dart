part of 'product_bloc.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.fetch() = _Fetch;
  const factory ProductEvent.fetchByCategory(int categoryId) = _FetchByCategory;
  const factory ProductEvent.search(String query) = _Search;
}
