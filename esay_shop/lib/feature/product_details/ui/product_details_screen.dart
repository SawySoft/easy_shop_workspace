import 'package:esay_shop/feature/product_details/ui/widgets/screens/desktop_product_details_screen.dart';
import 'package:esay_shop/feature/product_details/ui/widgets/screens/mobile_product_details_screen.dart';
import 'package:esay_shop/feature/product_details/ui/widgets/screens/tablet_product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/dependency_injection/dependency_injection.dart';
import '../../../core/shred/logic/favorite/favorite_cubit.dart';
import '../../home/data/models/product_model.dart';
import '../logic/product_details_cubit.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel productModel;
  const ProductDetailsScreen({required this.productModel,super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DependencyInjection.getIt<FavoriteCubit>()),
        BlocProvider(create: (context) => DependencyInjection.getIt<ProductDetailsCubit>(param1: productModel)),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1024) {
            return const DesktopProductDetailsScreen();
          } else if (constraints.maxWidth >= 600) {
            return const TabletProductDetailsScreen();
          } else {
            return const MobileProductDetailsScreen();
          }
        },
      ),
    );
  }
}

