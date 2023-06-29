import 'dart:convert';

Genre genreFromJson(String str) {
  final jsonData = json.decode(str);
  return Genre.fromMap(jsonData);
}

String genreToJson(Genre data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Genre {
  int id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromMap(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}
