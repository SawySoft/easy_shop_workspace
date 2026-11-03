import '../../../order/models/order_model.dart';
import '../../../product/models/product_model.dart';
import 'dashboard_entity.dart';

class DashboardModel extends DashboardEntity {
  DashboardModel({
    required super.totalProducts,
    required super.totalOrders,
    required super.pendingOrders,
    required super.categoriesCount,
    required super.recentOrders,
    required super.productsOverview,
  });

  factory DashboardModel.fromResponses({
    required dynamic productsData,
    required dynamic ordersData,
    required dynamic categoriesData,
  }) {
    final products = (productsData['data'] as List?)?.map((e) => ProductModel.fromJson(e)).toList() ?? [];

    final orders = (ordersData['data'] as List?)?.map((e) => OrderModel.fromJson(e)).toList() ?? [];

    final categoriesList = (categoriesData['data'] as List?) ?? [];
    final pendingCount = orders.where((o) {
      final status = o.status?.toString().trim().toLowerCase() ?? '';
      return status == 'pending';
    }).length;

    return DashboardModel(
      recentOrders: orders,
      // بنبعت كل الأوردرات
      pendingOrders: pendingCount,
      // العدد المضبوط للـ pending فقط
      totalOrders: orders.length,
      // العدد الكلي للإجمالي
      categoriesCount: categoriesList.length,
      productsOverview: products,
      totalProducts: products.length,
    );
  }
}
