

import 'package:easy_localization/easy_localization.dart';
import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String get chatFormat {
    final DateTime now = DateTime.now();
    final DateTime date = DateTime(year, month, day);
    final DateTime today = DateTime(now.year, now.month, now.day);
    final int difference = today.difference(date).inDays;
    if (difference == 0) {
      return DateFormat("h:mm a").format(this);
    }
    if (difference == 1) {
      return "yesterday".tr();
    }
    if (difference < 7) {
      return DateFormat("EEEE").format(this);
    }
    if (year == now.year) {
      return DateFormat("MMM d").format(this);
    }
    return DateFormat("MMM d, yyyy").format(this);
  }

  String get orderFormat {
    return DateFormat("MMM d, yyyy 'at' hh:mm a").format(this);
  }
}
