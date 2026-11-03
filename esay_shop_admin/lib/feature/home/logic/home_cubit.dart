import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/home_repo.dart';
import '../data/models/dashboard_entity.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState.loading()){getDashboardData();}

  Future<void> getDashboardData() async {

    try {
      final dashboardData = await _homeRepo.getDashboardData();

      emit(HomeState.success(dashboardData));
    } catch (e) {
      emit(HomeState.failure(e.toString()));
    }
  }

  String getGreeting() {
    int hour = DateTime.now().hour;
    if (hour >= 0 && hour < 12) {
      return 'greeting_morning'.tr();
    } else {
      return 'greeting_evening'.tr();
    }
  }
}