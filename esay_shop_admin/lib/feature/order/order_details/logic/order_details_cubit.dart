import 'package:esay_shop_admin/feature/order/models/order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/order_details_repo.dart';

part 'order_details_state.dart';
part 'order_details_cubit.freezed.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  final OrderDetailsRepo _repo;

  OrderDetailsCubit(this._repo) : super(const OrderDetailsState.loading());

  Future<void> getOrderDetails(String productCode) async {
    emit(const OrderDetailsState.loading());

    try {
      final product = await _repo.getProductDetails(productCode);
      emit(OrderDetailsState.success(product));
    } catch (e) {
      emit(OrderDetailsState.failure(e.toString()));
    }
  }
}
