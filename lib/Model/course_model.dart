import 'package:abc_mobile/Model/center_model.dart';

import 'image_model.dart';

class CourseModel {
  CourseModel({
    required this.id,
    required this.name,
    required this.center,
    this.description,
    this.briefDescription,
    this.cover
  });

  int id;
  String name;
  String? description;
  String? briefDescription;
  ImageModel? cover;
  CenterModel center;

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      briefDescription: json['briefDescription'],
      cover: ImageModel.fromJson(json['cover']), center: CenterModel.fromJson(json['center']),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "briefDescription": briefDescription,
    "cover": cover,
    "center": center
  };

  static List<CourseModel> courseFromJson(List<dynamic> str) =>
      List<CourseModel>.from(str.map((x) => CourseModel.fromJson(x)));
}