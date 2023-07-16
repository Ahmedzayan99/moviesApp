import 'package:dio/dio.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/network/error_message_model.dart';
import 'package:movies/core/network/api_constance.dart';
import 'package:movies/data/models/movies_details_model.dart';
import 'package:movies/data/models/movies_model.dart';
import 'package:movies/data/models/recommendation_model.dart';
import 'package:movies/domain/use_cases/get_movies_details_use_case.dart';
import 'package:movies/domain/use_cases/get_movies_recommendation_use_case.dart';
abstract class BaseMovieRemoteDataSource{
  Future<List<MoviesModel>>getNowPlayingMovies();
  Future<List<MoviesModel>>getPopularMovies();
  Future<List<MoviesModel>>getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameters);
}
class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.getNowPlaying);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List).map(
              (e) => MoviesModel.fromJson(e)));
    }
    else {
      throw ServerException(ErrorMessageModel.fromJson(response.data),);
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.getPopularMovies);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List).map(
              (e) => MoviesModel.fromJson(e)));
    }
    else {
      throw ServerException(ErrorMessageModel.fromJson(response.data),);
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.getTopRatedMovies);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List).map(
              (e) => MoviesModel.fromJson(e)));
    }
    else {
      throw ServerException(ErrorMessageModel.fromJson(response.data),);
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters) async{
    final response =
        await Dio().get(ApiConstance.movieDetailsPath(parameters.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.recommendationPath(parameters.id));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
          (response.data["results"] as List).map(
                (e) => RecommendationModel.fromJson(e),
          ));
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data),
      );
    }
  }
  }