import 'package:esay_shop_admin/feature/dashboard/logic/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(NavInitialState());

  static DashboardCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(NavChangeTabState(currentIndex));
  }
}