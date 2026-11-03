class MerchantModel {
  final int id;
  final String name;
  final String? email;
  final String? phone;
  final String? nationalId;
  final String? businessName;
  final String? address;
  final double? latitude;
  final double? longitude;
  final String? createdAt;
  final String? updatedAt;
  final String? pictureUrl;
  final String? commercialRegisterUrl;
  final String? taxCardUrl;

  MerchantModel({
    required this.id,
    required this.name,
    this.email,
    this.phone,
    this.nationalId,
    this.businessName,
    this.address,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.updatedAt,
    this.pictureUrl,
    this.commercialRegisterUrl,
    this.taxCardUrl,
  });

  factory MerchantModel.fromJson(Map<String, dynamic> json) {
    return MerchantModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'],
      phone: json['phone'],
      nationalId: json['national_id'],
      businessName: json['business_name'],
      address: json['address'],
      latitude: json['latitude'] != null ? (json['latitude'] as num).toDouble() : null,
      longitude: json['longitude'] != null ? (json['longitude'] as num).toDouble() : null,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      pictureUrl: json['picture_url'],
      commercialRegisterUrl: json['commercial_register_url'],
      taxCardUrl: json['tax_card_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'national_id': nationalId,
      'business_name': businessName,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'picture_url': pictureUrl,
      'commercial_register_url': commercialRegisterUrl,
      'tax_card_url': taxCardUrl,
    };
  }
}