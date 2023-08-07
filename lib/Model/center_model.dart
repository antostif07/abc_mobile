import 'image_model.dart';

class CenterModel {
  CenterModel({
    required this.id,
    required this.name,
    required this.description,
    this.cover
  });

  int id;
  String name;
  String? description;
  ImageModel? cover;

  factory CenterModel.fromJson(Map<String, dynamic> json) => CenterModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      cover: ImageModel.fromJson(json['cover'])
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "cover": cover
  };

  static List<CenterModel> centerFromJson(List<dynamic> str) =>
      List<CenterModel>.from(str.map((x) => CenterModel.fromJson(x)));
}