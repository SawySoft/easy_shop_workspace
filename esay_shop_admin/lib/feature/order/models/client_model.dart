class ClientModel {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? pictureUrl;

  ClientModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.pictureUrl,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      pictureUrl: json['picture_url'],
    );
  }
}