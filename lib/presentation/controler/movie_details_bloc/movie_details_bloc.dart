import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/unit/enum.dart';
import 'package:movies/domain/use_cases/get_movies_details_use_case.dart';
import 'package:movies/domain/use_cases/get_movies_recommendation_use_case.dart';
import 'package:movies/presentation/controler/movie_details_bloc/movie_details_event.dart';
import 'package:movies/presentation/controler/movie_details_bloc/movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MoviesDetailsState> {
  MovieDetailsBloc(
      this.getMoviesDetailsUseCase,
      this.getMoviesRecommendationUseCase)
      : super(const MoviesDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }

  final GetMoviesDetailsUseCase getMoviesDetailsUseCase;
  final GetMoviesRecommendationUseCase getMoviesRecommendationUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MoviesDetailsState> emit) async {
    final result = await getMoviesDetailsUseCase(MovieDetailsParameters(
      movieId: event.id,
    ));

    result.fold(
          (l) => emit(state.copyWith(
        movieDetailsState: RequestState.error,
        movieDetailsMessage:l.errorMessageModel.statusMessage,
      )),
          (r) => emit(
        state.copyWith(
          movieDetail: r,
          movieDetailsState: RequestState.loaded,
        ),
      ),
    );
  }
  FutureOr<void> _getRecommendation(GetMovieRecommendationEvent event,
      Emitter<MoviesDetailsState> emit) async {
    final result = await getMoviesRecommendationUseCase(
     RecommendationParameters(id: event.id),
      );

    result.fold(
          (l) => emit(state.copyWith(
        recommendationState: RequestState.error,
        recommendationMessage:l.errorMessageModel.statusMessage,
      )),
          (r) => emit(
        state.copyWith(
          recommendation: r,
          recommendationState: RequestState.loaded,
        ),
      ),
    );
  }
}