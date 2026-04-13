import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:avis_pos/domain/pos_repository.dart';
import 'package:avis_pos/data/model/responses/product/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IPosRepository repository;

  // Cache lokal untuk menyimpan semua produk agar fitur pencarian (search)
  // dan scanner barcode bisa berjalan sangat cepat tanpa harus hit API lagi.
  List<ProductModel> _allProducts = [];

  ProductBloc(this.repository) : super(const ProductState.initial()) {
    on<_Fetch>(_onFetch);
    on<_FetchByCategory>(_onFetchByCategory);
    on<_Search>(_onSearch);
  }

  Future<void> _onFetch(_Fetch event, Emitter<ProductState> emit) async {
    emit(const ProductState.loading());
    final result = await repository.getProducts();

    result.fold(
      (failure) =>
          emit(ProductState.error(failure.message ?? 'Gagal memuat produk')),
      (products) {
        _allProducts = products; // Simpan ke cache lokal
        emit(ProductState.loaded(products));
      },
    );
  }

  Future<void> _onFetchByCategory(
    _FetchByCategory event,
    Emitter<ProductState> emit,
  ) async {
    emit(const ProductState.loading());
    final result = await repository.getProducts(categoryId: event.categoryId);

    result.fold(
      (failure) => emit(
        ProductState.error(
          failure.message ?? 'Gagal memuat produk kategori ini',
        ),
      ),
      (products) => emit(ProductState.loaded(products)),
    );
  }

  void _onSearch(_Search event, Emitter<ProductState> emit) {
    // Jika input pencarian kosong, tampilkan kembali semua produk dari cache
    if (event.query.trim().isEmpty) {
      emit(ProductState.loaded(_allProducts));
    } else {
      final query = event.query.toLowerCase();
      // Filter produk berdasarkan nama ATAU barcode (SKU)
      final filtered = _allProducts.where((p) {
        return p.name.toLowerCase().contains(query) ||
            (p.barcode != null && p.barcode!.toLowerCase().contains(query));
      }).toList();

      emit(ProductState.loaded(filtered));
    }
  }
}
