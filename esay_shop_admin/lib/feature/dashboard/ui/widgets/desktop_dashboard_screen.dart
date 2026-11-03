import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/ui/home_screen.dart';
import '../../../order/orders/ui/orders_screen.dart';
import '../../../product/product_list/ui/product_list_screen.dart';
import '../../../profile/profile_details/ui/profile_screen.dart';
import '../../logic/dashboard_cubit.dart';
import '../../logic/dashboard_state.dart';

class DesktopDashboardScreen extends StatelessWidget {
  const DesktopDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeScreen(),
      const OrdersScreen(),
      const ProfileScreen(),
      const ProductListScreen(),
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
                extended: true, // يظهر الأيقونة والاسم بجانب بعض للديسكتوب
                elevation: 2,
                destinations: [
                  NavigationRailDestination(
                    icon: const Icon(Icons.home_outlined),
                    selectedIcon: const Icon(Icons.home),
                    label: Text('nav_home'.tr()),
                  ),
                  NavigationRailDestination(
                    icon: const Icon(Icons.inventory_2_outlined),
                    selectedIcon: const Icon(Icons.inventory_2),
                    label: Text('nav_orders'.tr()),
                  ),
                  NavigationRailDestination(
                    icon: const Icon(Icons.list_alt_outlined),
                    selectedIcon: const Icon(Icons.list_alt),
                    label: Text('nav_profile'.tr()),
                  ),
                  NavigationRailDestination(
                    icon: const Icon(Icons.person_outline),
                    selectedIcon: const Icon(Icons.person),
                    label: Text('nav_products'.tr()),
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