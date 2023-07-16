class Movie {
  final String backdropPath;
  final List<int>? genreIds;
  final int? id;
  final  String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final  double? voteAverage;
  final int? voteCount;
 const Movie(
      {required this.backdropPath,
       required this.genreIds,
       required this.id,
       required this.overview,
        required this.popularity,
      required  this.posterPath,
      required  this.releaseDate,
      required  this.title,
       required    this.voteAverage,
        required this.voteCount
      });
}