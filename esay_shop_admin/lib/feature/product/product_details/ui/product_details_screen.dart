import 'package:esay_shop_admin/feature/product/product_details/ui/widgets/screens/desktop_product_details_screen.dart';
import 'package:esay_shop_admin/feature/product/product_details/ui/widgets/screens/mobile_product_details_screen.dart';
import 'package:esay_shop_admin/feature/product/product_details/ui/widgets/screens/tablet_product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency_injection/dependency_injection.dart';
import '../../models/product_model.dart';
import '../logic/product_details_cubit.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsScreen(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DependencyInjection.getIt<ProductDetailsCubit>(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1024) {
            return DesktopProductDetailsScreen(product);
          } else if (constraints.maxWidth >= 600) {
            return TabletProductDetailsScreen(product);
          } else {
            return MobileProductDetailsScreen(product);
          }
        },
      ),
    );
  }
}

