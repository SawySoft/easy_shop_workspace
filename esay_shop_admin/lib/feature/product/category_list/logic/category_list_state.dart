part of 'category_list_cubit.dart';

@freezed
class CategoryListState with _$CategoryListState {
  const factory CategoryListState.initial() = _Initial;
  const factory CategoryListState.loading() = _Loading;
  const factory CategoryListState.success(List<CategoryModel> categories) = _Success;
  const factory CategoryListState.failure(String message) = _Failure;
}
