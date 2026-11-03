import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/home_repo.dart';
import '../data/models/category_model.dart';
import '../data/models/product_model.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState.loading()) {
    getHomeData();
  }

  List<ProductModel> productsList = [];
  List<CategoryModel> categoriesList = [];

  List<ProductModel> filteredProductsList = [];

  int selectedCategoryId = -1;
  String searchQuery = '';

  Future<void> getHomeData() async {
    emit(const HomeState.loading());
    try {
      final results = await Future.wait([
        _homeRepo.getCategories(),
        _homeRepo.getProducts(),
      ]);

      categoriesList = results[0] as List<CategoryModel>;
      productsList = results[1] as List<ProductModel>;

      _applyFilters();

      emit(const HomeState.success());
    } catch (e) {
      emit(HomeState.failure(e.toString()));
    }
  }


  void filterProductsByCategory(int categoryId) {
    selectedCategoryId = categoryId;
    _applyFilters();
  }

  void searchProducts(String query) {
    searchQuery = query.trim().toLowerCase();
    _applyFilters();
  }

  void _applyFilters() {
    List<ProductModel> tempList = productsList;

    if (selectedCategoryId != -1) {
      tempList = tempList
          .where((product) => product.categoryId == selectedCategoryId)
          .toList();
    }

    if (searchQuery.isNotEmpty) {
      tempList = tempList
          .where((product) =>
          (product.name.toLowerCase()).contains(searchQuery))
          .toList();
    }

    filteredProductsList = tempList;

    emit(const HomeState.loading());
    emit(const HomeState.success());
  }

  String getGreeting() {
    int hour = DateTime.now().hour;
    if (hour >= 0 && hour < 12) {
      return 'greeting_morning'.tr();
    } else {
      return 'greeting_evening'.tr();
    }
  }
}