import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/router/app_routes.dart';
import '../../../../../app/theming/app_colors.dart';
import '../../../../../core/utils/extensions/num_extensions.dart';
import '../../logic/category_list_cubit.dart';

class MobileCategoryListScreen extends StatelessWidget {
  const MobileCategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('categories_screen_title'.tr()),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CircleAvatar(
              backgroundColor: AppColors.orange,
              radius: 20,
              child: IconButton(
                icon: const Icon(Icons.add, color: AppColors.white),
                onPressed: () => Navigator.of(context).pushNamed(AppRoutes.upsertCategory.route),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<CategoryListCubit, CategoryListState>(
          builder: (context, state) {
            return state.when(
              initial: () {
                return const SizedBox.shrink();
              },
              loading: () {
                return const Center(child: CircularProgressIndicator());
              },
              success: (categories) {
                if (categories.isEmpty) {
                  return Center(child: Text('categories_no_categories_found'.tr()));
                }
                return ListView.separated(
                  itemCount: categories.length,
                  separatorBuilder: (context, index) => 12.vGap,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4)),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.orange.withAlpha(50),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Icons.local_offer_outlined, color: AppColors.orange),
                          ),
                          16.hGap,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  category.name,
                                  style: theme.textTheme.labelLarge,
                                ),
                                4.vGap,
                                Text(category.description, style: theme.textTheme.headlineSmall),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit_outlined, color: AppColors.grey),
                            onPressed: () =>
                                Navigator.of(context).pushNamed(AppRoutes.upsertCategory.route, arguments: category),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              failure: (message) {
                return Center(
                  child: Text(
                    'error_prefix'.tr(namedArgs: {'message': message.tr()}),
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