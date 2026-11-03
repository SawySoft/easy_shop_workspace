import 'package:easy_localization/easy_localization.dart';

class Validators {
  static String? validateName(String? val) {
    if (val == null || val.trim().isEmpty) return 'val_enter_name'.tr();
    return null;
  }

  static String? validateEmail(String? val) {
    if (val == null || val.trim().isEmpty) return 'val_enter_email'.tr();
    bool isValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(val.trim());
    if (!isValid) return 'val_invalid_email'.tr();
    return null;
  }

  static String? validatePhone(String? val) {
    if (val == null || val.trim().isEmpty) return 'val_enter_phone'.tr();
    if (val.trim().length < 10) return 'val_invalid_phone'.tr();
    return null;
  }

  static String? validatePassword(String? val) {
    if (val == null || val.isEmpty) return 'val_enter_password'.tr();
    if (val.length < 6) return 'val_password_short'.tr();
    return null;
  }

  static String? validateConfirmPassword(String? val, String password) {
    if (val == null || val.isEmpty) return 'val_enter_confirm_password'.tr();
    if (val != password) return 'val_passwords_not_match'.tr();
    return null;
  }

  static String? validateOtp(String? val) {
    if (val == null || val.trim().isEmpty) return 'val_enter_otp'.tr();
    if (val.trim().length < 4) return 'val_invalid_otp'.tr();
    return null;
  }

  static String? validatePrice(String? val) {
    if (val == null || val.trim().isEmpty) return 'val_enter_price'.tr();
    final number = num.tryParse(val.trim());
    if (number == null || number <= 0) {
      return 'val_invalid_price'.tr();
    }
    return null;
  }
}