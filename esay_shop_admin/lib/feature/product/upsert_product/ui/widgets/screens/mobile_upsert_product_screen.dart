import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/router/app_routes.dart';
import '../../../../../../app/theming/app_colors.dart';
import '../../../../../../core/shred/logic/image_picker/image_picker_cubit.dart';
import '../../../../../../core/shred/logic/validators.dart';
import '../../../../../../core/shred/ui/custom_button.dart';
import '../../../../../../core/shred/ui/custom_field_label.dart';
import '../../../../../../core/shred/ui/custom_text_field.dart';
import '../../../../../../core/utils/extensions/num_extensions.dart';
import '../../../../category_list/logic/category_list_cubit.dart';
import '../../../../models/product_model.dart';
import '../../../logic/upsert_product_cubit.dart';
import '../product_image_picker_widget.dart';

class MobileUpsertProductScreen extends StatelessWidget {
  final ProductModel? product;
  MobileUpsertProductScreen({super.key, this.product});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final cubit = context.read<UpsertProductCubit>();
    final bool isEditing = product != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'upsert_product_edit_title'.tr() : 'upsert_product_add_title'.tr()),
        centerTitle: true,
      ),
      body: BlocListener<UpsertProductCubit, UpsertProductState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => const Center(child: CircularProgressIndicator()),
              );
            },
            success: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(isEditing ? 'upsert_product_update_success'.tr() : 'upsert_product_create_success'.tr()),
                  backgroundColor: AppColors.green,
                ),
              );
              Navigator.of(context).pushReplacementNamed(AppRoutes.dashboard.route);
            },
            failure: (message) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('error_prefix'.tr(namedArgs: {'message': message.tr()})),
                  backgroundColor: AppColors.red,
                ),
              );
            },
          );
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImagePickerWidget(
                  initialImageUrl: product?.image,
                ),
                20.vGap,
                CustomFieldLabel("upsert_product_name_label".tr()),
                8.vGap,
                CustomTextField(
                  "upsert_product_name_hint".tr(),
                  controller: cubit.nameController,
                  validator: Validators.validateName,
                ),
                16.vGap,
                CustomFieldLabel("upsert_product_category_label".tr()),
                8.vGap,
                BlocBuilder<CategoryListCubit, CategoryListState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      success: (categories) {
                        return DropdownButtonFormField<int>(
                          initialValue: cubit.selectedCategoryId,
                          decoration: InputDecoration(
                            hintText: 'upsert_product_category_hint'.tr(),
                            filled: true,
                            fillColor: theme.primaryColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          items: categories.map((category) {
                            return DropdownMenuItem<int>(
                              value: int.tryParse(category.id.toString()),
                              child: Text(category.name),
                            );
                          }).toList(),
                          onChanged: (value) {
                            cubit.changeCategory(value);
                          },
                          validator: Validators.validateSelectCategory,
                        );
                      },
                      loading: () => const Center(child: LinearProgressIndicator()),
                      failure: (message) => Text(
                        'upsert_product_categories_fail'.tr(namedArgs: {'message': message.tr()}),
                        style: const TextStyle(color: AppColors.red),
                      ),
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
                16.vGap,
                Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomFieldLabel("upsert_product_price_label".tr()),
                          8.vGap,
                          CustomTextField(
                            "upsert_product_price_hint".tr(),
                            controller: cubit.priceController,
                            keyboardType: TextInputType.number,
                            validator: Validators.validatePrice,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomFieldLabel('upsert_product_qty_label'.tr()),
                          8.vGap,
                          CustomTextField(
                            'upsert_product_qty_hint'.tr(),
                            controller: cubit.quantityController,
                            keyboardType: TextInputType.number,
                            validator: Validators.validateQuantity,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                16.vGap,
                CustomFieldLabel('upsert_product_desc_label'.tr(), hintText: 'upsert_product_desc_hint_optional'.tr()),
                8.vGap,
                CustomTextField(
                  'upsert_product_desc_hint'.tr(),
                  controller: cubit.descriptionController,
                ),
                16.vGap,
                BlocBuilder<UpsertProductCubit, UpsertProductState>(
                  builder: (context, state) {
                    final currentIsVisible = state.maybeWhen(
                      visibilityChanged: (isVisible) => isVisible,
                      orElse: () => cubit.isVisible,
                    );
                    return SwitchListTile(
                      title: CustomFieldLabel('upsert_product_visible_label'.tr()),
                      subtitle: Text('upsert_product_visible_subtitle'.tr(), style: const TextStyle(color: AppColors.grey)),
                      value: currentIsVisible,
                      activeThumbColor: AppColors.orange,
                      onChanged: (val) {
                        cubit.changeVisibility(val);
                      },
                    );
                  },
                ),
                24.vGap,
                BlocBuilder<UpsertProductCubit, UpsertProductState>(
                  builder: (context, state) {
                    final isLoading = state.maybeWhen(
                      loading: () => true,
                      orElse: () => false,
                    );
                    return CustomButton(
                      text: isEditing ? 'upsert_product_edit_button'.tr() : 'upsert_product_add_button'.tr(),
                      onPressed: isLoading
                          ? null
                          : () {
                        if (_formKey.currentState?.validate() ?? false) {
                          final imagesMap = context.read<ImagePickerCubit>().state;
                          cubit.upsertProduct(imagesState: imagesMap);
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}