import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/shred/logic/validators.dart';
import '../data/upsert_category_repo.dart';

part 'upsert_category_state.dart';
part 'upsert_category_cubit.freezed.dart';

class UpsertCategoryCubit extends Cubit<UpsertCategoryState> {
  final UpsertCategoryRepo _repo;

  UpsertCategoryCubit(this._repo) : super(const UpsertCategoryState.loading());

  Future<void> upsertCategory({
    required String name,
    required String description,
    String? slug,
  }) async {
    emit(const UpsertCategoryState.loading());

    final data = {
      'name': name,
      'description': description,
    };

    try {
      if (slug == null) {
        // Add Category
        await _repo.addCategory(data);
      } else {
        // Update Category
        await _repo.updateCategory(data, categorySlug: slug);
      }

      emit(const UpsertCategoryState.success());
    } catch (e) {
      emit(UpsertCategoryState.failure(e.toString()));
    }
  }

  String? validateName(String? value) => Validators.validateName(value);
}