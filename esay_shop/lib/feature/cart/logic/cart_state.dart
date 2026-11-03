part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = _Loading;
  const factory CartState.success(List<CartItemModel> cartItems) = _Success;
  const factory CartState.failure(String message) = _Failure;
}
