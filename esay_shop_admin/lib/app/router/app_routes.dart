enum AppRoutes {
  splash("/"),
  home("/home"),
  orders("/orders"),
  signIn("/sign_in"),
  security("/security"),
  dashboard("/dashboard"),
  verifyEmail("/verify_email"),
  editProfile("/edit_profile"),
  productList("/product_list"),
  categoryList("/CategoryList"),
  orderDetails("/order_details"),
  personalInfo("/personal_info"),
  businessInfo("/business_info"),
  upsertProduct("/upsert_product"),
  profileDetails("/profile_details"),
  productDetails("/product_details"),
  upsertCategory("/upsert_category");

  final String route;

  const AppRoutes(this.route);

  static AppRoutes? fromRoute(String? route) {
    for (AppRoutes value in AppRoutes.values) {
      if (value.route == route) return value;
    }
    return null;
  }
}
