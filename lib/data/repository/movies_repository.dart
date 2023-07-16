import 'package:dartz/dartz.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/network/error_message_model.dart';
import 'package:movies/data/data_source/remote/movie_data_source.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/domain/entities/movie_detail.dart';
import 'package:movies/domain/entities/recommendation.dart';
import 'package:movies/domain/repository/base_movies_repository.dart';
import 'package:movies/domain/use_cases/get_movies_details_use_case.dart';
import 'package:movies/domain/use_cases/get_movies_recommendation_use_case.dart';

class MoviesRepository extends BaseMoviesRepository{
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<ServerException,List<Movie> >> getNowPlayingMovies() async{
 final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
 try{
   return Right(result);
  }on ServerException catch(error){
   return Left(ServerException(error.errorMessageModel.statusMessage  as ErrorMessageModel));
 }
    }

  @override
  Future<Either<ServerException,List<Movie> >>  getPopularMovies() async{
    final result = await baseMovieRemoteDataSource.getPopularMovies();

    try{
      return Right(result);
    }on ServerException catch(error){
      return Left(ServerException(error.errorMessageModel.statusMessage as ErrorMessageModel));
    }
  }

  @override
  Future<Either<ServerException,List<Movie> >> getTopRatedMovies()async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try{
      return Right(result);
    }on ServerException catch(error){
      return Left(ServerException(error.errorMessageModel.statusMessage as ErrorMessageModel));
    }
  
}

  @override
  Future<Either<ServerException, MovieDetail>> getMovieDetails(MovieDetailsParameters parameters) async{
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try{
      return Right(result);
    }on ServerException catch(error){
      return Left(ServerException(error.errorMessageModel.statusMessage as ErrorMessageModel));
    }
  }

  @override
  Future<Either<ServerException, List<Recommendation>>> getRecommendation(RecommendationParameters parameters)async {
    final result = await baseMovieRemoteDataSource.getRecommendation(parameters);
    try{
      return Right(result);
    }on ServerException catch(error){
      return Left(ServerException(error.errorMessageModel.statusMessage as ErrorMessageModel));
    }
  }
}