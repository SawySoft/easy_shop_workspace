import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cart/ui/cart_screen.dart';
import '../../../../faves/ui/faves_screen.dart';
import '../../../../home/ui/home_screen.dart';
import '../../../../orders/ui/orders_screen.dart';
import '../../../../profile/profile_details/ui/profile_screen.dart';
import '../../../logic/dashboard_cubit.dart';
import '../../../logic/dashboard_state.dart';

class DesktopDashboardScreen extends StatelessWidget {
  const DesktopDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeScreen(),
      const FavesScreen(),
      const CartScreen(),
      const OrdersScreen(),
      const ProfileScreen(),
    ];

    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        final cubit = context.read<DashboardCubit>();

        return Scaffold(
          body: Row(
            children: [
              NavigationRail(
                selectedIndex: cubit.currentIndex,
                onDestinationSelected: (index) {
                  cubit.changeIndex(index);
                },
                extended: true,
                elevation: 5,
                leading: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                  child: Text(
                    "app_brand_title".tr(),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                destinations: [
                  NavigationRailDestination(
                    icon: const Icon(Icons.home_outlined),
                    selectedIcon: const Icon(Icons.home),
                    label: Text('nav_home'.tr()),
                  ),
                  NavigationRailDestination(
                    icon: const Icon(Icons.favorite_border),
                    selectedIcon: const Icon(Icons.favorite),
                    label: Text('nav_favorites'.tr()),
                  ),
                  NavigationRailDestination(
                    icon: const Icon(Icons.shopping_cart_outlined),
                    selectedIcon: const Icon(Icons.shopping_cart),
                    label: Text('nav_cart'.tr()),
                  ),
                  NavigationRailDestination(
                    icon: const Icon(Icons.receipt_long_outlined),
                    selectedIcon: const Icon(Icons.receipt_long),
                    label: Text('nav_orders'.tr()),
                  ),
                  NavigationRailDestination(
                    icon: const Icon(Icons.person_outline),
                    selectedIcon: const Icon(Icons.person),
                    label: Text('nav_profile'.tr()),
                  ),
                ],
              ),
              const VerticalDivider(thickness: 1, width: 1),
              Expanded(
                child: screens[cubit.currentIndex],
              ),
            ],
          ),
        );
      },
    );
  }
}