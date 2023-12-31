import 'package:movies/core/unit/enum.dart';
import 'package:movies/data/models/movies_model.dart';
import 'package:movies/domain/entities/movie.dart';

class MoviesState  {
  final List<Movie> nowPlayingMovies;
   final  RequestState nowPlayingState;
  final String nowPlayingMessage;
  final List<Movie> popularMovies;
  final  RequestState popularState;
  final String popularMessage;
  final List<Movie> topRatedMovies;
  final  RequestState topRatedState;
  final String topRatedMessage;


  const MoviesState({
   this.nowPlayingMovies = const[],
   this.nowPlayingState =RequestState.loading,
   this.nowPlayingMessage ='',
    this.popularMovies= const[],
    this.popularState=RequestState.loading,
    this.popularMessage='',
    this.topRatedMovies= const[],
    this.topRatedState=RequestState.loading,
    this.topRatedMessage='',
 });
  MoviesState copyWith({
     List<Movie>? nowPlayingMovies,
      RequestState? nowPlayingState,
     String? nowPlayingMessage,
     List<Movie>? popularMovies,
      RequestState? popularState,
     String? popularMessage,
     List<Movie>? topRatedMovies,
      RequestState? topRatedState,
     String? topRatedMessage,
}){
    return MoviesState(
        nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
        nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
        nowPlayingState: nowPlayingState ?? this.nowPlayingState,
        popularMovies: popularMovies ?? this.popularMovies,
        popularMessage: popularMessage ?? this.popularMessage,
        popularState: popularState ?? this.popularState,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        topRatedMessage: topRatedMessage ?? this.topRatedMessage,
        topRatedState: topRatedState ?? this.topRatedState,
    );
  }
}