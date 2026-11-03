import 'package:esay_shop_admin/feature/product/upsert_product/ui/widgets/screens/desktop_upsert_product_screen.dart';
import 'package:esay_shop_admin/feature/product/upsert_product/ui/widgets/screens/mobile_upsert_product_screen.dart';
import 'package:esay_shop_admin/feature/product/upsert_product/ui/widgets/screens/tablet_upsert_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../core/shred/logic/image_picker/image_picker_cubit.dart';
import '../../category_list/logic/category_list_cubit.dart';
import '../../models/product_model.dart';
import '../data/upsert_product_repo.dart';
import '../logic/upsert_product_cubit.dart';

class UpsertProductScreen extends StatelessWidget {
  final ProductModel? product;

  const UpsertProductScreen({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DependencyInjection.getIt<ImagePickerCubit>()),
        BlocProvider(create: (context) => DependencyInjection.getIt<CategoryListCubit>()..getCategories()),
        BlocProvider(create: (context) => UpsertProductCubit(DependencyInjection.getIt<UpsertProductRepo>(), product)),
      ],
      child: Builder(
        builder: (context) {
          return LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= 1024) {
                return DesktopUpsertProductScreen(product: product);
              } else if (constraints.maxWidth >= 600) {
                return TabletUpsertProductScreen(product: product);
              } else {
                return MobileUpsertProductScreen(product: product);
              }
            },
          );
        },
      ),
    );
  }
}
