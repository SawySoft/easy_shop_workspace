import 'category_model.dart';
import 'merchant_model.dart';

class ProductModel {
  final int id;
  final String name;
  final String slug;
  final int price;
  final int quantity;
  final int categoryId;
  final String? description;
  final int visible;
  final int adminId;
  final String createdAt;
  final String updatedAt;
  final String imageUrl;
  final CategoryModel category;
  final MerchantModel admin;

  ProductModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.price,
    required this.quantity,
    required this.categoryId,
    this.description,
    required this.visible,
    required this.adminId,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
    required this.category,
    required this.admin,
  });

  factory ProductModel.empty() {
    return ProductModel(
      id: 0,
      name: '',
      slug: '',
      price: 0,
      quantity: 0,
      categoryId: 0,
      description: '',
      visible: 1,
      adminId: 0,
      createdAt: '',
      updatedAt: '',
      imageUrl: '',
      category: CategoryModel(
        id: 0,
        name: '',
        slug: '',
        createdAt: '',
        updatedAt: '',
      ),
      admin: MerchantModel(
        id: 0,
        name: '',
      ),
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      price: json['price'] ?? 0,
      quantity: json['quantity'] ?? 0,
      categoryId: json['category_id'] ?? 0,
      description: json['description'],
      visible: json['visible'] ?? 1,
      adminId: json['admin_id'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      imageUrl: json['image_url'] ?? '',
      category: json['category'] != null
          ? CategoryModel.fromJson(json['category'])
          : CategoryModel(id: 0, name: '', slug: '', createdAt: '', updatedAt: ''),
      admin: json['admin'] != null
          ? MerchantModel.fromJson(json['admin'])
          : MerchantModel(id: 0, name: ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'price': price,
      'quantity': quantity,
      'category_id': categoryId,
      'description': description,
      'visible': visible,
      'admin_id': adminId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'image_url': imageUrl,
      'category': category.toJson(),
      'admin': admin.toJson(),
    };
  }
}