import 'package:esay_shop_admin/feature/product/upsert_category/ui/widgets/screens/desktop_upsert_category_screen.dart';
import 'package:esay_shop_admin/feature/product/upsert_category/ui/widgets/screens/mobile_upsert_category_screen.dart';
import 'package:esay_shop_admin/feature/product/upsert_category/ui/widgets/screens/tablet_upsert_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency_injection/dependency_injection.dart';
import '../../models/category_model.dart';
import '../logic/upsert_category_cubit.dart';


class UpsertCategoryScreen extends StatelessWidget {
  final CategoryModel? category; // لو null يبقى Add، لو جواه data يبقى Edit

  const UpsertCategoryScreen({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DependencyInjection.getIt<UpsertCategoryCubit>(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1024) {
            return DesktopUpsertCategoryScreen(category: category);
          } else if (constraints.maxWidth >= 600) {
            return TabletUpsertCategoryScreen(category: category);
          } else {
            return MobileUpsertCategoryScreen(category: category);
          }
        },
      ),
    );
  }
}