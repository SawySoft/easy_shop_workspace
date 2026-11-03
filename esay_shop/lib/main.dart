import 'package:bingo/bingo.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'app/easy_shop.dart';
import 'core/dependency_injection/dependency_injection.dart';
import 'core/shred/data/admin_response_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Bingo.setup();
  Bingo.register<ClientResponseModel>((json) => ClientResponseModel.fromJson(json));
  DependencyInjection.setUp();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: EasyShop(),
    ),
  );
}
