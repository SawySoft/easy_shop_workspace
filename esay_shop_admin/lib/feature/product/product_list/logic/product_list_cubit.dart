import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/product_model.dart';
import '../data/product_list_repo.dart';

part 'product_list_state.dart';
part 'product_list_cubit.freezed.dart';

class ProductListCubit extends Cubit<ProductListState> {
  final ProductListRepo _repo;
  List<ProductModel> _allProducts = [];

  ProductListCubit(this._repo) : super(const ProductListState.loading()) {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    emit(const ProductListState.loading());
    try {
      final response = await _repo.getProducts();

      final List data = response.data['data'] ?? [];
      _allProducts = data.map((e) => ProductModel.fromJson(e)).toList();

      emit(ProductListState.success(_allProducts));
    } catch (e, stackTrace) {
      log('Fetch Products Error: $e', stackTrace: stackTrace);
      emit(ProductListState.failure(e.toString()));
    }
  }

  void searchProducts(String query) {
    if (query.trim().isEmpty) {
      emit(ProductListState.success(_allProducts));
      return;
    }

    final filteredList = _allProducts.where((product) {
      final title = product.name?.toLowerCase() ?? '';
      final searchQuery = query.toLowerCase();
      return title.contains(searchQuery);
    }).toList();

    emit(ProductListState.success(filteredList));
  }
}