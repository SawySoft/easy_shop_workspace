import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop/app/theming/app_colors.dart';
import 'package:esay_shop/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../data/models/category_model.dart';

class CategoriesList extends StatelessWidget {
  final List<CategoryModel> categories;
  final int selectedCategoryId;
  final Function(int) onCategorySelected;

  const CategoriesList({
    super.key,
    required this.categories,
    required this.selectedCategoryId,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "categories_title".tr(),
          style: theme.textTheme.titleLarge,
        ),
        12.vGap,
        SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length + 1,
            separatorBuilder: (context, index) => 8.hGap,
            itemBuilder: (context, index) {
              final bool isAllCategory = index == 0;
              final int categoryId = isAllCategory ? -1 : categories[index - 1].id;
              // أسماء الفئات القادمة من الـ API (مثل اسم التصنيف) تُعرض كما هي، بينما كلمة "All" تترجم
              final String categoryName = isAllCategory ? "category_all".tr() : categories[index - 1].name;

              final bool isSelected = selectedCategoryId == categoryId;

              return InkWell(
                onTap: () => onCategorySelected(categoryId),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.orange : theme.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected ? Colors.transparent : AppColors.grey,
                    ),
                  ),
                  child: Text(
                    categoryName,
                    style: TextStyle(
                      color: isSelected ? AppColors.white : theme.colorScheme.tertiary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}