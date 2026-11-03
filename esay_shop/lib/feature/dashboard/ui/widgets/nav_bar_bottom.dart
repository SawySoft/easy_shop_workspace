import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/theming/app_colors.dart';
import '../../../../core/dependency_injection/dependency_injection.dart';
import '../../../cart/logic/cart_cubit.dart';

class NavBarBottom extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const NavBarBottom({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: DependencyInjection.getIt<CartCubit>(),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final cartCubit = context.read<CartCubit>();
          final int itemCount = cartCubit.cartItems.length;

          return Container(
            decoration: const BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
            ),
            child: ClipRRect(
              child: BottomNavigationBar(
                currentIndex: currentIndex,
                onTap: onTap,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: AppColors.orange,
                unselectedItemColor: AppColors.grey,
                selectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                unselectedLabelStyle: const TextStyle(fontSize: 12),
                items: [
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.home_outlined),
                    activeIcon: const Icon(Icons.home),
                    label: 'nav_home'.tr(),
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.favorite_border_outlined),
                    activeIcon: const Icon(Icons.favorite),
                    label: 'nav_favorites'.tr(),
                  ),
                  BottomNavigationBarItem(
                    icon: Badge(
                      isLabelVisible: itemCount > 0,
                      label: Text('$itemCount'),
                      backgroundColor: AppColors.red,
                      child: const Icon(Icons.shopping_cart_outlined),
                    ),
                    activeIcon: Badge(
                      isLabelVisible: itemCount > 0,
                      label: Text('$itemCount'),
                      backgroundColor: AppColors.red,
                      child: const Icon(Icons.shopping_cart_sharp),
                    ),
                    label: 'nav_cart'.tr(),
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.shopping_bag_outlined),
                    activeIcon: const Icon(Icons.shopping_bag),
                    label: 'nav_orders'.tr(),
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.person_outline),
                    activeIcon: const Icon(Icons.person),
                    label: 'nav_profile'.tr(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}