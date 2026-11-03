import 'package:dio/dio.dart';
import 'package:esay_shop_admin/feature/auth/verify_email/logic/verify_email_cubit.dart';
import 'package:esay_shop_admin/feature/order/order_details/data/order_details_repo.dart';
import 'package:esay_shop_admin/feature/order/orders/data/orders_repo.dart';
import 'package:esay_shop_admin/feature/product/category_list/data/category_list_repo.dart';
import 'package:esay_shop_admin/feature/product/category_list/logic/category_list_cubit.dart';
import 'package:esay_shop_admin/feature/product/product_details/data/product_details_repo.dart';
import 'package:esay_shop_admin/feature/product/product_details/logic/product_details_cubit.dart';
import 'package:esay_shop_admin/feature/product/product_list/data/product_list_repo.dart';
import 'package:esay_shop_admin/feature/product/product_list/logic/product_list_cubit.dart';
import 'package:esay_shop_admin/feature/product/upsert_category/data/upsert_category_repo.dart';
import 'package:esay_shop_admin/feature/product/upsert_category/logic/upsert_category_cubit.dart';
import 'package:esay_shop_admin/feature/product/upsert_product/data/upsert_product_repo.dart';
import 'package:esay_shop_admin/feature/product/upsert_product/logic/upsert_product_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../feature/auth/sign_in/data/sign_in_repo.dart';
import '../../feature/auth/sign_in/logic/sign_in_cubit.dart';
import '../../feature/auth/sign_up/data/sign_up_repo.dart';
import '../shred/logic/image_picker/image_picker_cubit.dart';
import '../../feature/auth/sign_up/logic/sign_up_cubit.dart';
import '../../feature/auth/sign_up/security/logic/visibility_cubit.dart';
import '../../feature/auth/verify_email/data/verify_email_repo.dart';
import '../../feature/dashboard/data/dashboard_repo.dart';
import '../../feature/dashboard/logic/dashboard_cubit.dart';
import '../../feature/home/data/home_repo.dart';
import '../../feature/home/logic/home_cubit.dart';
import '../../feature/order/order_details/logic/order_details_cubit.dart';
import '../../feature/order/orders/logic/orders_cubit.dart';
import '../../feature/profile/edit_profile/data/edit_profile_repo.dart';
import '../../feature/profile/edit_profile/logic/edit_profile_cubit.dart';
import '../network/dio_factory.dart';

class DependencyInjection {
  DependencyInjection._();

  static final GetIt getIt = GetIt.instance;

  static void setUp() {
    /// Dio
    getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());

    /// Repos
    getIt.registerLazySingleton<DashboardRepo>(() => DashboardRepo());
    getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt<Dio>()));
    getIt.registerLazySingleton<OrdersRepo>(() => OrdersRepo(getIt<Dio>()));
    getIt.registerLazySingleton<SignInRepo>(() => SignInRepo(getIt<Dio>()));
    getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt<Dio>()));
    getIt.registerLazySingleton<ProductDetailsRepo>(() => ProductDetailsRepo());
    getIt.registerLazySingleton<ProductListRepo>(() => ProductListRepo(getIt<Dio>()));
    getIt.registerLazySingleton<EditProfileRepo>(() => EditProfileRepo(getIt<Dio>()));
    getIt.registerLazySingleton<VerifyEmailRepo>(() => VerifyEmailRepo(getIt<Dio>()));
    getIt.registerLazySingleton<OrderDetailsRepo>(() => OrderDetailsRepo(getIt<Dio>()));
    getIt.registerLazySingleton<CategoryListRepo>(() => CategoryListRepo(getIt<Dio>()));
    getIt.registerLazySingleton<UpsertProductRepo>(() => UpsertProductRepo(getIt<Dio>()));
    getIt.registerLazySingleton<UpsertCategoryRepo>(() => UpsertCategoryRepo(getIt<Dio>()));

    /// Cubits
    getIt.registerFactory<DashboardCubit>(() => DashboardCubit());
    getIt.registerFactory<VisibilityCubit>(() => VisibilityCubit());
    getIt.registerFactory<ImagePickerCubit>(() => ImagePickerCubit());
    getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));
    getIt.registerFactory<SignInCubit>(() => SignInCubit(getIt<SignInRepo>()));
    getIt.registerFactory<OrdersCubit>(() => OrdersCubit(getIt<OrdersRepo>()));
    getIt.registerLazySingleton<SignUpCubit>(() => SignUpCubit(getIt<SignUpRepo>()));
    getIt.registerFactory<ProductListCubit>(() => ProductListCubit(getIt<ProductListRepo>()));
    getIt.registerFactory<EditProfileCubit>(() => EditProfileCubit(getIt<EditProfileRepo>()));
    getIt.registerFactory<OrderDetailsCubit>(() => OrderDetailsCubit(getIt<OrderDetailsRepo>()));
    getIt.registerFactory<CategoryListCubit>(() => CategoryListCubit(getIt<CategoryListRepo>()));
    getIt.registerFactory<ProductDetailsCubit>(() => ProductDetailsCubit(getIt<ProductDetailsRepo>()));
    getIt.registerFactory<UpsertCategoryCubit>(() => UpsertCategoryCubit(getIt<UpsertCategoryRepo>()));
    getIt.registerFactoryParam<VerifyEmailCubit, String, void>(
      (email, _) => VerifyEmailCubit(getIt<VerifyEmailRepo>(), email),
    );
  }
}
