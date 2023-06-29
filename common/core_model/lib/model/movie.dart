import 'dart:convert';

import 'genre.dart';

String movieToJson(Movie data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Movie {
  int id;
  bool adult = false;
  String backdropPath = "";
  String originalLanguage = "";
  String originalTitle = "";
  String overview = "";
  double popularity = 0.0;
  String posterPath = "";
  String releaseDate = "";
  String title = "";
  bool video = false;
  double voteAverage = 0.0;
  int voteCount = 0;
  List<Genre> genres = List.empty();
  Movie({
    required this.id,
    required this.title,
    required this.adult,
    required this.backdropPath,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.genres,
  });


  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "backdropPath": backdropPath,
        "originalLanguage": originalLanguage,
        "originalTitle": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "posterPath": posterPath,
        "releaseDate": releaseDate,
        "video": video,
        "voteAverage": voteAverage,
      };
}
