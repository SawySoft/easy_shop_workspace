part of 'profile_details_cubit.dart';

@freezed
class ProfileDetailsState with _$ProfileDetailsState {
  const factory ProfileDetailsState.initial() = _Initial;
  const factory ProfileDetailsState.loading() = _Loading;
  const factory ProfileDetailsState.success(String email) = _Success;
  const factory ProfileDetailsState.failure(String message) = _Failure;
  const factory ProfileDetailsState.locationSuccess( double latitude, double longitude,String address) = _LocationSuccess;
}
