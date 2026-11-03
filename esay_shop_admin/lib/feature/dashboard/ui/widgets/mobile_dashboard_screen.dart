import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/ui/home_screen.dart';
import '../../../order/orders/ui/orders_screen.dart';
import '../../../product/product_list/ui/product_list_screen.dart';
import '../../../profile/profile_details/ui/profile_screen.dart';
import '../../logic/dashboard_cubit.dart';
import '../../logic/dashboard_state.dart';
import 'nav_bar_bottom.dart';

class MobileDashboardScreen extends StatelessWidget {
  const MobileDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeScreen(),
      const ProductListScreen(),
      const OrdersScreen(),
      const ProfileScreen(),
    ];
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        final cubit = context.read<DashboardCubit>();
        return Scaffold(
          body: screens[cubit.currentIndex],
          bottomNavigationBar: NavBarBottom(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeIndex(index);
            },
          ),
        );
      },
    );
  }
}
