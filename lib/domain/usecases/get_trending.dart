import 'package:clean_bloc_movies/domain/entities/app_error.dart';
import 'package:clean_bloc_movies/domain/entities/movie_entity.dart';
import 'package:clean_bloc_movies/domain/entities/no_params.dart';
import 'package:clean_bloc_movies/domain/repositories/movie_repository.dart';
import 'package:clean_bloc_movies/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetTrending extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository repository;

  GetTrending(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await repository.getTrending();
  }
}
