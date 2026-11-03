part of 'verify_email_cubit.dart';

@freezed
class VerifyEmailState with _$VerifyEmailState {
  const factory VerifyEmailState.initial({
    @Default(['', '', '', '', '', '']) List<String> code,
    @Default(false) bool isButtonEnabled,
  }) = _Initial;

  const factory VerifyEmailState.loading() = _Loading;

  const factory VerifyEmailState.success() = _Success;

  const factory VerifyEmailState.resendSuccess() = _ResendSuccess;

  const factory VerifyEmailState.failure(String message) = _Failure;
}