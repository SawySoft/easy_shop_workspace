part of 'product_list_cubit.dart';

@freezed
class ProductListState with _$ProductListState {
  const factory ProductListState.loading() = _Loading;
  const factory ProductListState.success(List<ProductModel> products) = _Success;
  const factory ProductListState.failure(String message) = _Failure;
}