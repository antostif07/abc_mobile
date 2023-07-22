class CenterModel {
  CenterModel({
    required this.id,
    required this.name,
    required this.description
  });

  int id;
  String name;
  String? description;

  factory CenterModel.fromJson(Map<String, dynamic> json) => CenterModel(
      id: json['id'],
      name: json['name'],
      description: json['description']
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
  };

  static List<CenterModel> centerFromJson(List<dynamic> str) =>
      List<CenterModel>.from(str.map((x) => CenterModel.fromJson(x)));
}