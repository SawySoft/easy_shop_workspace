import 'package:esay_shop/feature/success_order/ui/success_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/dependency_injection/dependency_injection.dart';
import '../../feature/auth/sign_in/ui/sign_in_screen.dart';
import '../../feature/auth/sign_up/ui/sign_up_screen.dart';
import '../../feature/auth/verify_email/ui/verify_email_screen.dart';
import '../../feature/auth/verify_success/ui/verify_success_screen.dart';
import '../../feature/cart/logic/cart_cubit.dart';
import '../../feature/cart/ui/cart_screen.dart';
import '../../feature/checkout/data/models/checkout_arguments_model.dart';
import '../../feature/checkout/ui/checkout_screen.dart';
import '../../feature/dashboard/ui/dashboard_screen.dart';
import '../../feature/erorr/error_screen.dart';
import '../../feature/faves/ui/faves_screen.dart';
import '../../feature/home/data/models/product_model.dart';
import '../../feature/home/ui/home_screen.dart';
import '../../feature/orders/logic/orders_cubit.dart';
import '../../feature/orders/ui/orders_screen.dart';
import '../../feature/payment/logic/payment_cubit.dart';
import '../../feature/payment/ui/payment_screen.dart';
import '../../feature/product_details/ui/product_details_screen.dart';
import '../../feature/profile/edit_profile/ui/edit_profile_screen.dart';
import '../../feature/profile/personal_info/ui/personal_info_screen.dart';
import '../../feature/profile/profile_details/logic/profile_details_cubit.dart';
import '../../feature/profile/profile_details/ui/profile_screen.dart';
import '../../feature/splash/ui/splash_screen.dart';
import 'app_routes.dart';

class AppRouter {
  AppRouter._();

  static Route onGeneratedRoute(RouteSettings settings) {
    switch (AppRoutes.fromRoute(settings.name)) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case AppRoutes.personalInfo:
        return MaterialPageRoute(builder: (_) => PersonalInfoScreen());

      case AppRoutes.successOrder:
        final orderCode = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => SuccessOrderScreen(orderCode: orderCode));

      case AppRoutes.verifySuccessScreen:
        return MaterialPageRoute(builder: (_) => VerifySuccessScreen());

      case AppRoutes.profileDetails:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => DependencyInjection.getIt<ProfileDetailsCubit>(),
            child: ProfileScreen(),
          ),
        );

      case AppRoutes.cart:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(create: (context) => DependencyInjection.getIt<CartCubit>(), child: CartScreen()),
        );

      case AppRoutes.payment:
        final orderCode = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => DependencyInjection.getIt<PaymentCubit>(),
            child: PaymentScreen(orderCode: orderCode),
          ),
        );

      case AppRoutes.productDetails:
        final productModel = settings.arguments as ProductModel;
        return MaterialPageRoute(builder: (_) => ProductDetailsScreen(productModel: productModel));

      case AppRoutes.dashboard:
        return MaterialPageRoute(builder: (_) => DashboardScreen());

      case AppRoutes.faves:
        return MaterialPageRoute(builder: (_) => FavesScreen());

      case AppRoutes.orders:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(create: (context) => DependencyInjection.getIt<OrdersCubit>(), child: OrdersScreen()),
        );

      case AppRoutes.checkout:
        final args = settings.arguments as CheckoutArgumentsModel;

        return MaterialPageRoute(builder: (_) => CheckoutScreen(args: args));

      case AppRoutes.signUp:
        return MaterialPageRoute(builder: (_) => SignUpScreen());

      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case AppRoutes.signIn:
        return MaterialPageRoute(builder: (_) => SignInScreen());

      case AppRoutes.verifyEmail:
        final email = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => VerifyEmailScreen(email: email));

      case AppRoutes.editProfile:
        return MaterialPageRoute(builder: (_) => EditProfileScreen());

      default:
        return MaterialPageRoute(builder: (_) => ErrorScreen());
    }
  }
}
