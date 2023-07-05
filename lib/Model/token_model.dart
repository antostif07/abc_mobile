import 'dart:convert';

class TokenModel {
  TokenModel({
    required this.token,
  });

  String? token;

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
      token: json['token'],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };

  static List<TokenModel> tokenFromJson(String str) =>
      List<TokenModel>.from(json.decode(str).map((x) => TokenModel.fromJson(x)));
}