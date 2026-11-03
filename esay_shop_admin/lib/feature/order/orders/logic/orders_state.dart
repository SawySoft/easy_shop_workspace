part of 'orders_cubit.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState.loading() = _Loading;
  const factory OrdersState.success(List<OrderModel> order) = _Success;
  const factory OrdersState.failure(String message) = _Failure;
}
