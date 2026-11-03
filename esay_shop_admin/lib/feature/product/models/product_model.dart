import '../../../core/utils/extensions/date_time_extension.dart';

class ProductModel {
  final int? id;
  final String? name;
  final String? slug;
  final String? description;
  final num? price;
  final int? quantity;
  final int? categoryId;
  final String? categoryName;
  final int? visible;
  final String? image;
  final String? createdAt;

  ProductModel({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.price,
    this.quantity,
    this.categoryId,
    this.categoryName,
    this.visible,
    this.image,
    this.createdAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name']?.toString(),
      slug: json['slug']?.toString(),
      description: json['description']?.toString(),
      price: json['price'],
      quantity: json['quantity'] ?? json['qty'],
      categoryId: json['category_id'] ?? (json['category'] is Map ? json['category']['id'] : null),
      categoryName: json['category'] is Map ? json['category']['name'] : (json['category_name'] ?? json['category']),
      visible: json['visible'] ?? (json['isVisible'] == true ? 1 : 0),
      image: json['image_url'] ?? json['image_url'],
      createdAt: json['created_at']?.toString() ?? json['createdAt']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      if (slug != null) 'slug': slug,
      'description': description,
      'price': price,
      'quantity': quantity,
      'category_id': categoryId,
      'visible': visible,
      'image_url': image,
      if (createdAt != null) 'created_at': createdAt,
    };
  }
  String getFormattedDate() {
    if (createdAt == null) return 'N/A';
    DateTime dateTime = DateTime.parse(createdAt!);
    return dateTime.chatFormat;
  }
}