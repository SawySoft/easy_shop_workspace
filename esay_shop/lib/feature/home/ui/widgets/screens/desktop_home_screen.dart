import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/router/app_routes.dart';
import '../../../../../app/theming/app_colors.dart';
import '../../../../../core/utils/extensions/num_extensions.dart';
import '../../../logic/home_cubit.dart';
import '../categories_list.dart';
import '../home_header.dart';
import '../product_card.dart';
import '../search_text_field.dart';

class DesktopHomeScreen extends StatelessWidget {
  const DesktopHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final HomeCubit cubit = context.read<HomeCubit>();

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              failure: (message) => Center(
                child: Text(
                  'error_prefix'.tr(namedArgs: {'message': message}),
                  style: const TextStyle(color: AppColors.red, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              success: () {
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeHeader(greeting: cubit.getGreeting()),
                      24.vGap,
                      SizedBox(
                        width: 500,
                        child: SearchTextField(
                          onChanged: (value) {
                            cubit.searchProducts(value);
                          },
                        ),
                      ),
                      28.vGap,
                      CategoriesList(
                        categories: cubit.categoriesList,
                        selectedCategoryId: cubit.selectedCategoryId,
                        onCategorySelected: (categoryId) {
                          cubit.filterProductsByCategory(categoryId);
                        },
                      ),
                      32.vGap,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('products_title'.tr(), style: theme.textTheme.titleLarge?.copyWith(fontSize: 30)),
                          Text(
                            'items_available_count'.tr(namedArgs: {'count': cubit.filteredProductsList.length.toString()}),
                            style: theme.textTheme.headlineMedium,
                          ),
                        ],
                      ),
                      20.vGap,
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: cubit.filteredProductsList.length,
                        itemBuilder: (context, index) {
                          final product = cubit.filteredProductsList[index];
                          return ProductCard(
                            product: product,
                            onTap: () =>
                                Navigator.of(context).pushNamed(AppRoutes.productDetails.route, arguments: product),
                            onFaves: () {},
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}