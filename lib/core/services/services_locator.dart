import 'package:get_it/get_it.dart';
import 'package:movies/data/data_source/remote/movie_data_source.dart';
import 'package:movies/data/repository/movies_repository.dart';
import 'package:movies/domain/repository/base_movies_repository.dart';
import 'package:movies/domain/use_cases/get_movies_details_use_case.dart';
import 'package:movies/domain/use_cases/get_movies_recommendation_use_case.dart';
import 'package:movies/domain/use_cases/get_now_playing_use_case.dart';
import 'package:movies/domain/use_cases/get_popular_movies_use_case.dart';
import 'package:movies/domain/use_cases/get_top_rated_movies_use_case.dart';
import 'package:movies/presentation/controler/movie_details_bloc/movie_details_bloc.dart';
import 'package:movies/presentation/controler/movies_bloc/movies_bloc.dart';
import 'package:movies/presentation/controler/movies_bloc/movies_event.dart';
GetIt sl = GetIt.instance;
class ServicesLocator{
  void init(){
    ///bloc
    sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));
    ///UseCase
    sl.registerLazySingleton(() => GetMoviesRecommendationUseCase(sl()));
    sl.registerLazySingleton(() => GetMoviesDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetNowPlayingUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    ///Repository
   sl.registerLazySingleton<BaseMoviesRepository>(
             () => MoviesRepository(sl()));
    ///DataSource
     sl.registerLazySingleton<BaseMovieRemoteDataSource>(
                 () => MovieRemoteDataSource());

  }
}