import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/unit/enum.dart';
import 'package:movies/core/use_case/base_use_case.dart';
import 'package:movies/domain/use_cases/get_now_playing_use_case.dart';
import 'package:movies/presentation/controler/movies_bloc/movies_event.dart';
import 'package:movies/presentation/controler/movies_bloc/movies_state.dart';
import 'package:movies/domain/use_cases/get_popular_movies_use_case.dart';
import 'package:movies/domain/use_cases/get_top_rated_movies_use_case.dart';


class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  GetNowPlayingUseCase getNowPlayingUseCase;
  GetPopularMoviesUseCase getPopularMoviesUseCase;
  GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MoviesBloc(this.getNowPlayingUseCase,this.getPopularMoviesUseCase,this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getGetNowPlaying);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }
FutureOr<void> _getGetNowPlaying(
    GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit)
   async {
    final result= await getNowPlayingUseCase(NoParameters());
    result.fold(
            (l) => emit(state.copyWith( nowPlayingState: RequestState.error,
          nowPlayingMessage: l.errorMessageModel.statusMessage,)),
            (r) => emit(state.copyWith(
          nowPlayingMovies: r,
          nowPlayingState: RequestState.loaded,)));
  }
  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit)
  async {
    final result =await getPopularMoviesUseCase(NoParameters());
    result.fold(
            (l) =>emit(state.copyWith(
            popularState: RequestState.error,
            popularMessage: l.errorMessageModel.statusMessage)) ,
            (r) =>emit(state.copyWith(
            popularMovies: r,
            popularState: RequestState.loaded)));
  }
  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit)
  async {
    final result =await getTopRatedMoviesUseCase(NoParameters());
    result.fold(
            (l) =>emit(state.copyWith(
            topRatedState: RequestState.error,
            topRatedMessage: l.errorMessageModel.statusMessage
        )) ,
            (r) =>emit(state.copyWith( topRatedMovies: r,
            topRatedState: RequestState.loaded)));
  }
}