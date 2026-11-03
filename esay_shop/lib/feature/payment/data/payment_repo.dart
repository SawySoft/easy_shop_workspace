import 'package:dio/dio.dart';
import 'package:esay_shop/core/network/end_points.dart';

class PaymentRepo {
  final Dio _dio;

  PaymentRepo(this._dio);

  Future<String> processPayment(String orderCode) async {
    try {
      final payResponse = await _dio.post('${EndPoints.ordersPay}$orderCode');

      final extractedData = payResponse.data['data'];
      final paymentResponse = await _dio.post(EndPoints.paymentsProcess, data: extractedData);
      final String? paymentUrl = paymentResponse.data['url'] ?? paymentResponse.data['data']?['url'];

      if (paymentUrl != null && paymentUrl.isNotEmpty) {
        return paymentUrl;
      } else {
        throw Exception("لم يتم العثور على رابط الدفع في الرد");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
