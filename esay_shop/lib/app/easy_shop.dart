
import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop/app/router/app_router.dart';
import 'package:esay_shop/app/router/app_routes.dart';
import 'package:esay_shop/app/theming/dark_theme.dart';
import 'package:esay_shop/app/theming/light_theme.dart';
import 'package:flutter/material.dart';

class EasyShop extends StatelessWidget {
  const EasyShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: context.locale,
      theme: AppLightTheme.theme,
      themeMode: ThemeMode.system,
      darkTheme: AppDarkTheme.theme,
      debugShowCheckedModeBanner: false,
      supportedLocales: context.supportedLocales,
      onGenerateRoute: AppRouter.onGeneratedRoute,
      localizationsDelegates: context.localizationDelegates,
    );
  }
}
