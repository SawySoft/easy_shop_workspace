part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loading() = _Loading;
  const factory HomeState.success(DashboardEntity dashboardData) = _Success;
  const factory HomeState.failure(String message) = _Failure;
}
