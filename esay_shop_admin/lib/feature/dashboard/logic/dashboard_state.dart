abstract class DashboardState {}

class NavInitialState extends DashboardState {}

class NavChangeTabState extends DashboardState {
  final int index;
  NavChangeTabState(this.index);
}
