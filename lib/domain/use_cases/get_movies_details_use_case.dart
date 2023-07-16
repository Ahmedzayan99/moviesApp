import 'package:dartz/dartz.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/use_case/base_use_case.dart';
import 'package:movies/domain/entities/movie_detail.dart';
import 'package:movies/domain/repository/base_movies_repository.dart';

class GetMoviesDetailsUseCase extends BaseUseCase<MovieDetail,MovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMoviesDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<ServerException, MovieDetail>> call(MovieDetailsParameters parameters) async{
      return  await baseMoviesRepository.getMovieDetails(parameters);
  }
}
class MovieDetailsParameters {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

}