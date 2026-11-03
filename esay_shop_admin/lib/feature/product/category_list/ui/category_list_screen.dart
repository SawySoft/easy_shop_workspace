import 'package:esay_shop_admin/feature/product/category_list/ui/widgets/desktop_category_list_screen.dart';
import 'package:esay_shop_admin/feature/product/category_list/ui/widgets/mobile_category_list_screen.dart';
import 'package:esay_shop_admin/feature/product/category_list/ui/widgets/tablet_category_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency_injection/dependency_injection.dart';
import '../logic/category_list_cubit.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DependencyInjection.getIt<CategoryListCubit>(),
      child: Builder(
        builder: (context) {
          return LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= 1024) {
                return const DesktopCategoryListScreen();
              } else if (constraints.maxWidth >= 600) {
                return const TabletCategoryListScreen();
              } else {
                return const MobileCategoryListScreen();
              }
            },
          );
        }
      ),
    );
  }
}
