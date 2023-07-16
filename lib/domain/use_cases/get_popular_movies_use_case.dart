import 'package:dartz/dartz.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/use_case/base_use_case.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/domain/repository/base_movies_repository.dart';

class GetPopularMoviesUseCase extends  BaseUseCase<List<Movie>,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);
  @override
  Future<Either<ServerException,List<Movie> >>  call(NoParameters  parameters)async{
    return await baseMoviesRepository.getPopularMovies();
  }

}