import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/category_model.dart';
import '../data/category_list_repo.dart';

part 'category_list_state.dart';

part 'category_list_cubit.freezed.dart';

class CategoryListCubit extends Cubit<CategoryListState> {
  final CategoryListRepo _repo;

  CategoryListCubit(this._repo) : super(const CategoryListState.initial()) {
    getCategories();
  }

  void getCategories() async {
    emit(CategoryListState.loading());
    try {
      final response = await _repo.getCategories();
      final List<dynamic> data = response.data['data'] ?? [];
      final categories = data.map((json) => CategoryModel.fromJson(json)).toList();
      emit(CategoryListState.success(categories));
    } catch (e) {
      emit(CategoryListState.failure(e.toString()));
    }
  }
}
