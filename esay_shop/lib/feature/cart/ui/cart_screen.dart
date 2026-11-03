import 'package:esay_shop/feature/cart/ui/screens/desktop_cart_screen.dart';
import 'package:esay_shop/feature/cart/ui/screens/mobile_cart_screen.dart';
import 'package:esay_shop/feature/cart/ui/screens/tablet_cart_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/dependency_injection/dependency_injection.dart';
import '../logic/cart_cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DependencyInjection.getIt<CartCubit>(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1024) {
            return const DesktopCartScreen();
          } else if (constraints.maxWidth >= 600) {
            return const TabletCartScreen();
          } else {
            return const MobileCartScreen();
          }
        },
      ),
    );
  }
}
