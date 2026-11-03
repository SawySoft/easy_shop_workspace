import 'package:esay_shop_admin/feature/order/orders/ui/widgets/screens/desktop_orders_screen.dart';
import 'package:esay_shop_admin/feature/order/orders/ui/widgets/screens/mobile_orders_screen.dart';
import 'package:esay_shop_admin/feature/order/orders/ui/widgets/screens/tablet_orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency_injection/dependency_injection.dart';
import '../logic/orders_cubit.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DependencyInjection.getIt<OrdersCubit>(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1024) {
            return const DesktopOrdersScreen();
          } else if (constraints.maxWidth >= 600) {
            return const TabletOrdersScreen();
          } else {
            return const MobileOrdersScreen();
          }
        },
      ),
    );
  }
}