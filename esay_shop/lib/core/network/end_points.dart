class EndPoints {

  static const String baseUrl = "https://easylearn.devawy.com/api/";

  static const String apiKey = 'wQ9KxY7nP2LrA5FmD8TsV1BhE6JzNc4UyRg3KqXpWoMf7CdSaHt9LeIk2On8GbYu';

  ///OTP
  static const String verifyOtp = "client/otp/verify";
  static const String resendOtp = "client/otp/resend";

  ///Auth
  static const String login = "client/login";
  static const String logout = "client/logout";
  static const String register = "client/register";

  ///Profile
  static const String profile = 'client/profile';
  static const String updateProfile = 'client/profile/update';

  ///Categories
  static const String categories = 'client/categories';

  ///Products
  static const String products = 'client/products';
  static const String productsShow = 'client/products/show/';

  ///Favorites
  static const String favorites = 'client/favorites';
  static const String favoritesStore = 'client/favorites/store';
  static const String favoritesDestroy = 'client/favorites/destroy';

  ///Carts
  static const String carts = "client/carts";
  static const String cartsStore = "client/carts/store";
  static const String cartsDestroy = "client/carts/destroy";

  ///orders
  static const String orders = 'client/orders';
  static const String ordersPay = 'client/orders/pay/';
  static const String ordersShow = 'client/orders/show/';
  static const String ordersStore = 'client/orders/store';

  ///Payments
  static const String paymentsProcess = 'client/payments/process';


}