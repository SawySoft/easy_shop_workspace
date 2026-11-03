part of 'upsert_category_cubit.dart';

@freezed
class UpsertCategoryState with _$UpsertCategoryState {
  const factory UpsertCategoryState.loading() = _Loading;
  const factory UpsertCategoryState.success() = _Success;
  const factory UpsertCategoryState.failure(String message) = _Failure;
}
