import 'package:dartz/dartz.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/domain/entities/movie_detail.dart';
import 'package:movies/domain/entities/recommendation.dart';
import 'package:movies/domain/use_cases/get_movies_details_use_case.dart';
import 'package:movies/domain/use_cases/get_movies_recommendation_use_case.dart';

abstract class BaseMoviesRepository{
  Future<Either<ServerException,List<Movie> >> getNowPlayingMovies();
  Future<Either<ServerException,List<Movie> >> getPopularMovies();
  Future<Either<ServerException,List<Movie> >>  getTopRatedMovies();
  Future<Either<ServerException, MovieDetail>> getMovieDetails(
      MovieDetailsParameters parameters);

  Future<Either<ServerException, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters);
}