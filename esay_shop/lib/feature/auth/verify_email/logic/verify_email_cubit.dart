import 'dart:async';
import 'package:bingo/bingo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/shred/data/admin_response_model.dart';
import '../data/verify_email_repo.dart';

part 'verify_email_state.dart';
part 'verify_email_cubit.freezed.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  final VerifyEmailRepo _repo;
  final String email;

  Timer? _timer;
  int remainingSeconds = 600;

  //  لمراقبة تحديث الوقت في واجهة المستخدم بسلاسة بدون إعادة بناء الكيوبت بالكامل
  final ValueNotifier<int> timerNotifier = ValueNotifier<int>(600);

  VerifyEmailCubit(this._repo, this.email) : super(const VerifyEmailState.initial()) {
    startTimer();
  }

  void startTimer() {
    _timer?.cancel();
    remainingSeconds = 600;
    timerNotifier.value = remainingSeconds;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        remainingSeconds--;
        timerNotifier.value = remainingSeconds;
      } else {
        _timer?.cancel();
      }
    });
  }

  Future<void> verifyOtp({required String pinCode}) async {
    emit(const VerifyEmailState.loading());

    try {
      final response = await _repo.verifyOtp(email: email, otp: pinCode);
      final responseData = response.data;

      final String? token = responseData['token'];
      if (token != null && token.isNotEmpty) {
        await Bingo.mark("token", token);
      }

      if (responseData['data'] != null) {
        final ClientResponseModel adminResponseModel = ClientResponseModel.fromJson(responseData['data']);
        await Bingo.mark("client_data", adminResponseModel);
      }
      emit(const VerifyEmailState.success());
    } catch (e) {
      emit(VerifyEmailState.failure(e.toString()));
    }
  }

  Future<void> resendOtp() async {
    emit(const VerifyEmailState.loading());

    try {
      await _repo.resendOtp(email: email);
      startTimer();
      emit(const VerifyEmailState.resendSuccess());
    } catch (e) {
      emit(VerifyEmailState.failure(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    timerNotifier.dispose();
    return super.close();
  }
}