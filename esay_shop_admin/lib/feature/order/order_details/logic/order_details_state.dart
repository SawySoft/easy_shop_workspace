part of 'order_details_cubit.dart';

@freezed
class OrderDetailsState with _$OrderDetailsState {
  const factory OrderDetailsState.loading() = _Loading;
  const factory OrderDetailsState.success(OrderModel order) = _Success;
  const factory OrderDetailsState.failure(String message) = _Failure;
}
