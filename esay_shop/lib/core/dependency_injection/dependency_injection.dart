import 'package:dio/dio.dart';
import 'package:esay_shop/core/shred/logic/favorite/favorite_cubit.dart';
import 'package:esay_shop/core/shred/logic/favorite/repo/favorite_repo.dart';
import 'package:esay_shop/core/shred/logic/image_picker/image_picker_cubit.dart';
import 'package:esay_shop/core/shred/logic/visibility_cubit.dart';
import 'package:esay_shop/feature/auth/sign_in/data/sign_in_repo.dart';
import 'package:esay_shop/feature/auth/sign_in/logic/sign_in_cubit.dart';
import 'package:esay_shop/feature/cart/data/cart_repo.dart';
import 'package:esay_shop/feature/cart/logic/cart_cubit.dart';
import 'package:esay_shop/feature/checkout/data/checkout_repo.dart';
import 'package:esay_shop/feature/checkout/logic/checkout_cubit.dart';
import 'package:esay_shop/feature/home/data/home_repo.dart';
import 'package:esay_shop/feature/home/logic/home_cubit.dart';
import 'package:esay_shop/feature/orders/data/orders_repo.dart';
import 'package:esay_shop/feature/orders/logic/orders_cubit.dart';
import 'package:esay_shop/feature/payment/logic/payment_cubit.dart';
import 'package:esay_shop/feature/product_details/data/product_details_repo.dart';
import 'package:esay_shop/feature/product_details/logic/product_details_cubit.dart';
import 'package:esay_shop/feature/profile/edit_profile/logic/edit_profile_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../feature/auth/sign_up/data/sign_up_repo.dart';
import '../../feature/auth/sign_up/logic/sign_up_cubit.dart';
import '../../feature/auth/verify_email/data/verify_email_repo.dart';
import '../../feature/auth/verify_email/logic/verify_email_cubit.dart';
import '../../feature/dashboard/logic/dashboard_cubit.dart';
import '../../feature/home/data/models/product_model.dart';
import '../../feature/payment/data/payment_repo.dart';
import '../../feature/profile/edit_profile/data/edit_profile_repo.dart';
import '../../feature/profile/profile_details/data/profile_details_repo.dart';
import '../../feature/profile/profile_details/logic/profile_details_cubit.dart';
import '../network/dio_factory.dart';

class DependencyInjection {
  DependencyInjection._();

  static final GetIt getIt = GetIt.instance;

  static void setUp() {
    /// Dio
    getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());

    /// Repos
    getIt.registerLazySingleton<CartRepo>(() => CartRepo(getIt<Dio>()));
    getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt<Dio>()));
    getIt.registerLazySingleton<OrdersRepo>(() => OrdersRepo(getIt<Dio>()));
    getIt.registerLazySingleton<SignInRepo>(() => SignInRepo(getIt<Dio>()));
    getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt<Dio>()));
    getIt.registerLazySingleton<PaymentRepo>(() => PaymentRepo(getIt<Dio>()));
    getIt.registerLazySingleton<CheckoutRepo>(() => CheckoutRepo(getIt<Dio>()));
    getIt.registerLazySingleton<FavoriteRepo>(() => FavoriteRepo(getIt<Dio>()));
    getIt.registerLazySingleton<VerifyEmailRepo>(() => VerifyEmailRepo(getIt<Dio>()));
    getIt.registerLazySingleton<EditProfileRepo>(() => EditProfileRepo(getIt<Dio>()));
    getIt.registerLazySingleton<ProfileDetailsRepo>(() => ProfileDetailsRepo(getIt<Dio>()));
    getIt.registerLazySingleton<ProductDetailsRepo>(() => ProductDetailsRepo(getIt<Dio>()));

    /// Cubits
    getIt.registerFactory<DashboardCubit>(() => DashboardCubit());
    getIt.registerFactory<VisibilityCubit>(() => VisibilityCubit());
    getIt.registerFactory<ImagePickerCubit>(() => ImagePickerCubit());
    getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));
    getIt.registerFactory<CartCubit>(() => CartCubit(getIt<CartRepo>()));
    getIt.registerFactory<OrdersCubit>(() => OrdersCubit(getIt<OrdersRepo>()));
    getIt.registerFactory<SignInCubit>(() => SignInCubit(getIt<SignInRepo>()));
    getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt<SignUpRepo>()));
    getIt.registerFactory<PaymentCubit>(() => PaymentCubit(getIt<PaymentRepo>()));
    getIt.registerFactory<FavoriteCubit>(() => FavoriteCubit(getIt<FavoriteRepo>()));
    getIt.registerFactory<CheckoutCubit>(() => CheckoutCubit(getIt<CheckoutRepo>()));
    getIt.registerFactory<EditProfileCubit>(() => EditProfileCubit(getIt<EditProfileRepo>()));
    getIt.registerFactory<ProfileDetailsCubit>(() => ProfileDetailsCubit(getIt<ProfileDetailsRepo>()));
    getIt.registerFactoryParam<VerifyEmailCubit, String, void>(
      (email, _) => VerifyEmailCubit(getIt<VerifyEmailRepo>(), email),
    );
    getIt.registerFactoryParam<ProductDetailsCubit, ProductModel, void>(
      (productModel, _) => ProductDetailsCubit(getIt<ProductDetailsRepo>(), productModel),
    );
  }
}
