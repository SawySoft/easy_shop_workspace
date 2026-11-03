import 'package:esay_shop_admin/feature/order/order_details/ui/widgets/screens/desktop_order_details_screen.dart';
import 'package:esay_shop_admin/feature/order/order_details/ui/widgets/screens/mobile_order_details_screen.dart';
import 'package:esay_shop_admin/feature/order/order_details/ui/widgets/screens/tablet_order_details_screen.dart';
import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency_injection/dependency_injection.dart';
import '../logic/order_details_cubit.dart';

class OrderDetailsScreen extends StatelessWidget {
  final String productCode;
  const OrderDetailsScreen(this.productCode, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DependencyInjection.getIt<OrderDetailsCubit>()..getOrderDetails(productCode),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1024) {
            return const DesktopOrderDetailsScreen();
          } else if (constraints.maxWidth >= 600) {
            return const TabletOrderDetailsScreen();
          } else {
            return const MobileOrderDetailsScreen();
          }
        },
      ),
    );
  }
}