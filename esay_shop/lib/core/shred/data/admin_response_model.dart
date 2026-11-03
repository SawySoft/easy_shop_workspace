class ClientResponseModel {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? address;
  final String? latitude;
  final String? longitude;
  final String? nationalId;
  final String? pictureUrl;
  final String? taxCardUrl;
  final String? businessName;
  final String? commercialRegisterUrl;

  ClientResponseModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.latitude,
    this.longitude,
    this.pictureUrl,
    this.taxCardUrl,
    this.nationalId,
    this.businessName,
    this.commercialRegisterUrl,
  });

  factory ClientResponseModel.fromJson(Map<String, dynamic> json) {
    return ClientResponseModel(
      id: json['id'],
      name: json['name']?.toString(),
      email: json['email']?.toString(),
      phone: json['phone']?.toString(),
      address: json['address']?.toString(),
      latitude: json['latitude']?.toString(),
      longitude: json['longitude']?.toString(),
      nationalId: json['national_id']?.toString(),
      pictureUrl: json['picture_url']?.toString(),
      taxCardUrl: json['tax_card_url']?.toString(),
      businessName: json['business_name']?.toString(),
      commercialRegisterUrl: json['commercial_register_url']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'picture_url': pictureUrl,
      'national_id': nationalId,
      'tax_card_url': taxCardUrl,
      'business_name': businessName,
      'commercial_register_url': commercialRegisterUrl,
    };
  }
}