import 'package:dartz/dartz.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/use_case/base_use_case.dart';
import 'package:movies/domain/entities/recommendation.dart';
import 'package:movies/domain/repository/base_movies_repository.dart';

class GetMoviesRecommendationUseCase extends BaseUseCase<List<Recommendation>,RecommendationParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMoviesRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<ServerException, List<Recommendation>>> call(RecommendationParameters parameters) async{
    return  await baseMoviesRepository.getRecommendation(parameters);
  }
}
class RecommendationParameters  {
  final int id;

  const RecommendationParameters ({required this.id});

}