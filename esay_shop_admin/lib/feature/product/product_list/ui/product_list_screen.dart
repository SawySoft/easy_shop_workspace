import 'package:esay_shop_admin/feature/product/product_list/ui/widgets/screens/desktop_product_list_screen.dart';
import 'package:esay_shop_admin/feature/product/product_list/ui/widgets/screens/mobile_product_list_screen.dart';
import 'package:esay_shop_admin/feature/product/product_list/ui/widgets/screens/tablet_product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency_injection/dependency_injection.dart';
import '../logic/product_list_cubit.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DependencyInjection.getIt<ProductListCubit>(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1024) {
            return const DesktopProductListScreen();
          } else if (constraints.maxWidth >= 600) {
            return const TabletProductListScreen();
          } else {
            return const MobileProductListScreen();
          }
        },
      ),
    );
  }
}

