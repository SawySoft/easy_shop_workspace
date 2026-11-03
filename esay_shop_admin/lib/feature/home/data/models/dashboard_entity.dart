import '../../../order/models/order_model.dart';
import '../../../product/models/product_model.dart';

class DashboardEntity {
  final int totalProducts;
  final int totalOrders;
  final int pendingOrders;
  final int categoriesCount;
  final List<OrderModel> recentOrders;
  final List<ProductModel> productsOverview;

  DashboardEntity({
    required this.totalProducts,
    required this.totalOrders,
    required this.pendingOrders,
    required this.categoriesCount,
    required this.recentOrders,
    required this.productsOverview,
  });
}