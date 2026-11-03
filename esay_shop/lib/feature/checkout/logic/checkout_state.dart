part of 'checkout_cubit.dart';

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState.initial() = _Initial;
  const factory CheckoutState.loading() = _Loading;

  const factory CheckoutState.locationLoading() = _LocationLoading;
  const factory CheckoutState.locationUpdated(String address) = _LocationUpdated;

  const factory CheckoutState.success(CheckoutModel checkout) = _Success;
  const factory CheckoutState.failure(String message) = _Failure;

  const factory CheckoutState.paymentMethodChanged(String paymentMethod) = _PaymentMethodChanged;
}