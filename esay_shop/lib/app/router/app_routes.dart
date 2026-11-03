enum AppRoutes {
  splash("/"),
  home("/home"),
  cart("/cart"),
  faves("/faves"),
  orders("/orders"),
  signIn("/sign_in"),
  signUp("/sign_up"),
  payment("/payment"),
  checkout("/checkout"),
  security("/security"),
  dashboard("/dashboard"),
  verifyEmail("/verify_email"),
  editProfile("/edit_profile"),
  productList("/product_list"),
  categoryList("/CategoryList"),
  personalInfo("/personal_info"),
  successOrder("/success_order"),
  orderDetails("/order_details"),
  businessInfo("/business_info"),
  upsertProduct("/upsert_product"),
  profileDetails("/profile_details"),
  productDetails("/product_details"),
  upsertCategory("/upsert_category"),
  verifySuccessScreen("/verify_success_screen");

  final String route;

  const AppRoutes(this.route);

  static AppRoutes? fromRoute(String? route) {
    for (AppRoutes value in AppRoutes.values) {
      if (value.route == route) return value;
    }
    return null;
  }
}
