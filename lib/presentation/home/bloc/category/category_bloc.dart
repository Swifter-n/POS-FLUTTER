import 'package:avis_pos/data/model/responses/category/category_model.dart';
import 'package:avis_pos/domain/pos_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_event.dart';
part 'category_state.dart';
part 'category_bloc.freezed.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final IPosRepository repository;

  CategoryBloc(this.repository) : super(const CategoryState.initial()) {
    on<_Fetch>((event, emit) async {
      emit(const CategoryState.loading());
      final result = await repository.getCategories();
      result.fold(
        (l) => emit(CategoryState.error(l.message ?? 'Gagal memuat kategori')),
        (r) => emit(CategoryState.loaded(r)),
      );
    });
  }
}
