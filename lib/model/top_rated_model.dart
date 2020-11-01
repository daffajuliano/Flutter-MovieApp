// To parse this JSON data, do
//
//     final topRatedModel = topRatedModelFromJson(jsonString);

import 'dart:convert';

TopRatedModel topRatedModelFromJson(String str) => TopRatedModel.fromJson(json.decode(str));

String topRatedModelToJson(TopRatedModel data) => json.encode(data.toJson());

class TopRatedModel {
  TopRatedModel({
    this.popularity,
    this.id,
    this.video,
    this.voteCount,
    this.voteAverage,
    this.title,
    this.releaseDate,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.posterPath,
  });

  double popularity;
  int id;
  bool video;
  int voteCount;
  double voteAverage;
  String title;
  DateTime releaseDate;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String backdropPath;
  bool adult;
  String overview;
  String posterPath;

  factory TopRatedModel.fromJson(Map<String, dynamic> json) => TopRatedModel(
        popularity: json["popularity"].toDouble(),
        id: json["id"],
        video: json["video"],
        voteCount: json["vote_count"],
        voteAverage: json["vote_average"].toDouble(),
        title: json["title"],
        releaseDate: DateTime.parse(json["release_date"]),
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        backdropPath: json["backdrop_path"],
        adult: json["adult"],
        overview: json["overview"],
        posterPath: json["poster_path"],
      );

  Map<String, dynamic> toJson() => {
        "popularity": popularity,
        "id": id,
        "video": video,
        "vote_count": voteCount,
        "vote_average": voteAverage,
        "title": title,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "backdrop_path": backdropPath,
        "adult": adult,
        "overview": overview,
        "poster_path": posterPath,
      };
}
