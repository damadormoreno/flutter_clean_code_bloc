import 'package:clean_bloc_movies/domain/entities/app_error.dart';
import 'package:clean_bloc_movies/domain/entities/movie_detail_entity.dart';
import 'package:clean_bloc_movies/domain/entities/movie_params.dart';
import 'package:clean_bloc_movies/domain/repositories/movie_repository.dart';
import 'package:clean_bloc_movies/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetMovieDetail extends UseCase<MovieDetailEntity, MovieParams> {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  @override
  Future<Either<AppError, MovieDetailEntity>> call(
      MovieParams movieParams) async {
    return await repository.getMovieDetail(movieParams.id);
  }
}
