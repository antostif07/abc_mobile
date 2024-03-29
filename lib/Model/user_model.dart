import 'dart:convert';

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  int id;
  String name;
  String? email;
  String phone;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone']
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone
  };

  static List<UserModel> userFromJson(String str) =>
      List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));
}