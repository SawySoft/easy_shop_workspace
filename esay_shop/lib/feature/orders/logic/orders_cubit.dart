import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/order_model.dart';
import '../data/orders_repo.dart';

part 'orders_state.dart';
part 'orders_cubit.freezed.dart';


class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepo _repo;

  OrdersCubit(this._repo) : super(const OrdersState.loading()){getOrders();}

  Future<void> getOrders() async {
    emit(const OrdersState.loading());

    try {
      final orders = await _repo.getOrders();
      emit(OrdersState.success(orders));
    } catch (e) {
      emit(OrdersState.failure(e.toString()));
    }
  }
}
