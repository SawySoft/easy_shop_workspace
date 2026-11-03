import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/theming/app_colors.dart';
import '../../../../../../core/shred/ui/custom_button.dart';
import '../../../../../../core/shred/ui/custom_field_label.dart';
import '../../../../../../core/shred/ui/custom_text_field.dart';
import '../../../../../../core/utils/extensions/num_extensions.dart';
import '../../../../models/category_model.dart';
import '../../../logic/upsert_category_cubit.dart';

class TabletUpsertCategoryScreen extends StatelessWidget {
  final CategoryModel? category;
  TabletUpsertCategoryScreen({super.key, this.category});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  bool get isEditing => category != null;

  void _initControllers() {
    if (isEditing && _nameController.text.isEmpty) {
      _nameController.text = category?.name ?? '';
      _descriptionController.text = category?.description ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final UpsertCategoryCubit cubit = context.read<UpsertCategoryCubit>();
    _initControllers();

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'upsert_category_edit_title'.tr() : 'upsert_category_add_title'.tr()),
        centerTitle: true,
      ),
      body: BlocListener<UpsertCategoryCubit, UpsertCategoryState>(
        listener: (context, state) {
          state.when(
            loading: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => const Center(child: CircularProgressIndicator()),
              );
            },
            success: () {
              Navigator.pop(context); // قفل اللودينج
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isEditing
                        ? 'upsert_category_update_success'.tr()
                        : 'upsert_category_create_success'.tr(),
                  ),
                  backgroundColor: AppColors.green,
                ),
              );
              Navigator.pop(context, true);
            },
            failure: (message) {
              Navigator.pop(context); // قفل اللودينج
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('error_prefix'.tr(namedArgs: {'message': message.tr()})),
                  backgroundColor: AppColors.red,
                ),
              );
            },
          );
        },
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isEditing ? 'upsert_category_edit_header'.tr() : 'upsert_category_new_header'.tr(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        24.vGap,
                        CustomFieldLabel("upsert_category_name_label".tr()),
                        8.vGap,
                        CustomTextField(
                          'upsert_category_name_hint'.tr(),
                          controller: _nameController,
                          validator: cubit.validateName,
                        ),
                        20.vGap,
                        CustomFieldLabel("upsert_category_desc_label".tr(), hintText: "upsert_category_desc_hint_optional".tr()),
                        8.vGap,
                        CustomTextField(
                          "upsert_category_desc_hint".tr(),
                          controller: _descriptionController,
                          keyboardType: TextInputType.multiline,
                        ),
                        32.vGap,
                        CustomButton(
                          text: isEditing ? 'upsert_category_save_button'.tr() : 'upsert_category_create_button'.tr(),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<UpsertCategoryCubit>().upsertCategory(
                                name: _nameController.text.trim(),
                                description: _descriptionController.text.trim(),
                                slug: category?.slug,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}