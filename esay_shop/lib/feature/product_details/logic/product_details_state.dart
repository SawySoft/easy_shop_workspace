part of 'product_details_cubit.dart';

@freezed
class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState.initial() = _Initial;
  const factory ProductDetailsState.loading() = _Loading;
  const factory ProductDetailsState.success(String email) = _Success;
  const factory ProductDetailsState.failure(String message) = _Failure;
  const factory ProductDetailsState.quantityChanged(int quantity) = _QuantityChanged;
}
