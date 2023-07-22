import 'dart:convert';

class ErrorModel {
  ErrorModel({
    required this.message,
  });

  String message;

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
      message: json['message']
  );

  Map<String, dynamic> toJson() => {
    "message": message
  };

  static List<ErrorModel> errorFromJson(String str) =>
      List<ErrorModel>.from(json.decode(str).map((x) => ErrorModel.fromJson(x)));
}