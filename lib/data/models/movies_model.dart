import 'package:movies/domain/entities/movie.dart';

class MoviesModel extends Movie{
  MoviesModel({required super.backdropPath,
    required super.genreIds,
    required super.id,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.releaseDate,
    required super.title,
    required super.voteAverage,
    required super.voteCount});
  factory MoviesModel.fromJson(Map<String, dynamic> json) =>
      MoviesModel(
        backdropPath: json['backdrop_path'],
        genreIds: List.from(json['genre_ids']),
        id: json['id'],
        overview:  json['overview'],
        popularity:json['popularity'],
        posterPath:  json['poster_path'],
        releaseDate:json['release_date'] ,
        title: json['title'],
        voteAverage: json['vote_average'].toDouble(),
        voteCount: json['vote_count'],
      );

}