import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_state.freezed.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState.initial() = _Initial;

  const factory EditProfileState.loading() = _Loading;
  const factory EditProfileState.success({String? message}) = _Success;
  const factory EditProfileState.failure(String message) = _Failure;

  const factory EditProfileState.locationLoading() = _LocationLoading;
  const factory EditProfileState.locationSuccess(String address) = _LocationSuccess;
  const factory EditProfileState.locationFailure(String error) = _LocationFailure;
}