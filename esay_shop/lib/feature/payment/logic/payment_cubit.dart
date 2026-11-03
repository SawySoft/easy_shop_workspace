import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/payment_repo.dart';

part 'payment_state.dart';
part 'payment_cubit.freezed.dart';



class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepo _paymentRepo;

  PaymentCubit(this._paymentRepo) : super(const PaymentState.initial());

  Future<void> makePayment(String orderCode) async {
    emit(const PaymentState.loading());
    try {
      final paymentUrl = await _paymentRepo.processPayment(orderCode);
      emit(PaymentState.success(paymentUrl));
    } catch (e) {
      emit(PaymentState.failure(e.toString().replaceAll('Exception: ', '')));
    }
  }
}
