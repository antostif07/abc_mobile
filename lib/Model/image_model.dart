class ImageModel {
  ImageModel({
    required this.id,
    required this.contentUrl,
  });

  int id;
  String contentUrl;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
      id: json['id'],
      contentUrl: json['contentUrl'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "contentUrl": contentUrl,
  };

  static List<ImageModel> imageFromJson(List<dynamic> str) =>
      List<ImageModel>.from(str.map((x) => ImageModel.fromJson(x)));
}