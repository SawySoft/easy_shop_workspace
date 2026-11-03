import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/product_details_repo.dart';


part 'product_details_state.dart';
part 'product_details_cubit.freezed.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductDetailsRepo _productDetailsRepo;
  ProductDetailsCubit(this._productDetailsRepo) : super(const ProductDetailsState.initial());
}
