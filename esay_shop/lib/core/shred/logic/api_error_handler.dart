import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

class ApiErrorHandler {
  static String extractErrorMessage(dynamic responseData) {
    if (responseData == null) return 'error_processing_data'.tr();

    if (responseData is Map<String, dynamic>) {
      if (responseData['message'] is Map<String, dynamic>) {
        final errors = responseData['message'] as Map<String, dynamic>;
        for (var key in errors.keys) {
          if (errors[key] is List && (errors[key] as List).isNotEmpty) {
            return errors[key][0].toString();
          }
        }
      } else if (responseData['message'] is String) {
        return responseData['message'];
      }
    }
    return 'error_processing_data'.tr();
  }

  static String handleDioError(DioException e) {
    if (e.response != null && e.response?.data != null) {
      return extractErrorMessage(e.response?.data);
    } else if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return 'error_connection_timeout'.tr();
    } else if (e.type == DioExceptionType.connectionError) {
      return 'error_no_internet'.tr();
    }
    return 'error_server_connection'.tr();
  }
}