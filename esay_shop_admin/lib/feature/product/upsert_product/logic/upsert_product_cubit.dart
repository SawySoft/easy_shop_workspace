import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/shred/logic/admin_form_controllers_mixin.dart';
import '../../../../core/shred/logic/image_picker/image_picker_cubit.dart';
import '../../models/product_model.dart';
import '../data/upsert_product_repo.dart';

part 'upsert_product_state.dart';

part 'upsert_product_cubit.freezed.dart';

class UpsertProductCubit extends Cubit<UpsertProductState> with AdminFormControllersMixin {
  final UpsertProductRepo _repo;

  bool isVisible = true;
  int? selectedCategoryId;
  String? productSlug;

  UpsertProductCubit(this._repo, [ProductModel? product]) : super(const UpsertProductState.initial()) {
    initProductData(product);
  }

  void initProductData(ProductModel? product) {
    if (product != null) {
      productSlug = product.slug;
      nameController.text = product.name ?? '';
      priceController.text = product.price?.toString() ?? '';
      quantityController.text = product.quantity?.toString() ?? '';
      descriptionController.text = product.description ?? '';
      isVisible = (product.visible == 1);
      selectedCategoryId = product.categoryId;
    } else {
      productSlug = null;
      nameController.clear();
      priceController.clear();
      quantityController.clear();
      descriptionController.clear();
      isVisible = true;
      selectedCategoryId = null;
    }
  }

  void changeCategory(int? categoryId) {
    selectedCategoryId = categoryId;
  }

  void changeVisibility(bool value) {
    isVisible = value;
    emit(UpsertProductState.visibilityChanged(value));
  }

  Future<void> upsertProduct({required Map<String, File?> imagesState}) async {
    emit(const UpsertProductState.loading());

    try {
      final file = imagesState[ImageKeys.product];

      final formData = FormData.fromMap({
        if (productSlug != null) '_method': 'PUT',
        'name': nameController.text.trim(),
        'price': priceController.text.trim(),
        'quantity': quantityController.text.trim(),
        'description': descriptionController.text.trim(),
        'visible': isVisible ? 1 : 0,
        if (selectedCategoryId != null) 'category_id': selectedCategoryId,
        if (file != null) 'image': await MultipartFile.fromFile(file.path, filename: file.path.split('/').last),
      });
      debugPrint('--- Uploading Image Path: ${file?.path} ---');
      productSlug == null
          ? await _repo.addProduct(formData)
          : await _repo.updateProduct(formData, productSlug: productSlug!);

      emit(const UpsertProductState.success());
    } catch (e) {
      emit(UpsertProductState.failure(e.toString()));
    }
  }

  @override
  Future<void> close() {
    disposeAdminControllers();
    return super.close();
  }
}
