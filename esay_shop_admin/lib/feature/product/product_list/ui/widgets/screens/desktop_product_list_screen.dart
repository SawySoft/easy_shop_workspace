import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/router/app_routes.dart';
import '../../../../../../app/theming/app_colors.dart';
import '../../../../../../core/utils/extensions/num_extensions.dart';
import '../../../logic/product_list_cubit.dart';
import '../product_item_card.dart';

class DesktopProductListScreen extends StatelessWidget {
  const DesktopProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('products_screen_title'.tr(), style: theme.textTheme.titleLarge?.copyWith(fontSize: 28)),
                  CircleAvatar(
                    backgroundColor: AppColors.orange,
                    radius: 22,
                    child: IconButton(
                      icon: const Icon(Icons.add, color: AppColors.white),
                      onPressed: () => Navigator.of(context).pushNamed(AppRoutes.upsertProduct.route),
                    ),
                  ),
                ],
              ),
              20.vGap,
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: TextFormField(
                      onChanged: (query) {
                        context.read<ProductListCubit>().searchProducts(query);
                      },
                      decoration: InputDecoration(
                        hintText: 'products_search_hint'.tr(),
                        hintStyle: TextStyle(color: theme.hintColor),
                        prefixIcon: const Icon(Icons.search, color: AppColors.orange),
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  20.hGap,
                  TextButton.icon(
                    onPressed: () => Navigator.of(context).pushNamed(AppRoutes.categoryList.route),
                    icon: const Icon(Icons.label_outline_rounded, color: AppColors.orange, size: 18),
                    label: Text(
                      'products_manage_categories'.tr(),
                      style: const TextStyle(color: AppColors.orange, fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: isDarkMode ? AppColors.backgroundDarkIcon : AppColors.backgroundLightIcon,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    ),
                  ),
                ],
              ),
              24.vGap,
              Expanded(
                child: BlocBuilder<ProductListCubit, ProductListState>(
                  builder: (context, state) {
                    return state.when(
                      loading: () => const Center(
                        child: CircularProgressIndicator(color: AppColors.orange),
                      ),
                      failure: (message) => Center(
                        child: Text(
                          'error_prefix'.tr(namedArgs: {'message': message.tr()}),
                          style: const TextStyle(color: AppColors.red),
                        ),
                      ),
                      success: (products) {
                        if (products.isEmpty) {
                          return Center(child: Text('products_no_products_found'.tr()));
                        }
                        return GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: 2.6,
                          ),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return ProductItemCard(product: product);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}