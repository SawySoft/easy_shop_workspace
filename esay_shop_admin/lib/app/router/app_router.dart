import 'package:esay_shop_admin/feature/erorr/error_screen.dart';
import 'package:esay_shop_admin/feature/product/models/category_model.dart';
import 'package:esay_shop_admin/feature/product/upsert_product/ui/upsert_product_screen.dart';
import 'package:esay_shop_admin/feature/profile/edit_profile/ui/edit_profile_screen.dart';
import 'package:flutter/material.dart';

import '../../feature/auth/sign_in/ui/sign_in_screen.dart';
import '../../feature/auth/sign_up/business_info/ui/business_info_screen.dart';
import '../../feature/auth/sign_up/personal_info/ui/personal_info_screen.dart';
import '../../feature/auth/sign_up/security/ui/security_screen.dart';
import '../../feature/auth/verify_email/ui/verify_email_screen.dart';
import '../../feature/dashboard/ui/dashboard_screen.dart';
import '../../feature/home/ui/home_screen.dart';
import '../../feature/order/order_details/ui/order_details_screen.dart';
import '../../feature/order/orders/ui/orders_screen.dart';
import '../../feature/product/category_list/ui/category_list_screen.dart';
import '../../feature/product/models/product_model.dart';
import '../../feature/product/product_details/ui/product_details_screen.dart';
import '../../feature/product/product_list/ui/product_list_screen.dart';
import '../../feature/product/upsert_category/ui/upsert_category_screen.dart';
import '../../feature/profile/profile_details/ui/profile_screen.dart';
import '../../feature/splash/ui/splash_screen.dart';
import 'app_routes.dart';

class AppRouter {
  AppRouter._();

  static Route onGeneratedRoute(RouteSettings settings) {
    switch (AppRoutes.fromRoute(settings.name)) {

      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case AppRoutes.orderDetails:
        final productCode = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => OrderDetailsScreen(productCode));

      case AppRoutes.orders:
        return MaterialPageRoute(builder: (_) => OrdersScreen());

      case AppRoutes.profileDetails:
        return MaterialPageRoute(builder: (_) => ProfileScreen());

      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case AppRoutes.personalInfo:
        return MaterialPageRoute(builder: (_) => PersonalInfoScreen());

      case AppRoutes.productDetails:
        final ProductModel? product = settings.arguments as ProductModel?;
        return MaterialPageRoute(builder: (_) => ProductDetailsScreen(product!));

      case AppRoutes.productList:
        return MaterialPageRoute(builder: (_) => ProductListScreen());

      case AppRoutes.dashboard:
        return MaterialPageRoute(builder: (_) => DashboardScreen());

      case AppRoutes.businessInfo:
        return MaterialPageRoute(builder: (_) => BusinessInfoScreen());

      case AppRoutes.security:
        return MaterialPageRoute(builder: (_) => SecurityScreen());

      case AppRoutes.signIn:
        return MaterialPageRoute(builder: (_) => SignInScreen());

      case AppRoutes.verifyEmail:
        final String email = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => VerifyEmailScreen(email: email));

      case AppRoutes.upsertProduct:
        final ProductModel? productData = settings.arguments as ProductModel?;
        return MaterialPageRoute(builder: (_) => UpsertProductScreen(product: productData));

      case AppRoutes.editProfile:
        return MaterialPageRoute(builder: (_) => EditProfileScreen());

      case AppRoutes.categoryList:
        return MaterialPageRoute(builder: (_) => CategoryListScreen());

      case AppRoutes.upsertCategory:
        final CategoryModel? categoryData = settings.arguments as CategoryModel?;
        return MaterialPageRoute(builder: (_) => UpsertCategoryScreen(category: categoryData));

      default:
        return MaterialPageRoute(builder: (_) => ErrorScreen());
    }
  }
}
