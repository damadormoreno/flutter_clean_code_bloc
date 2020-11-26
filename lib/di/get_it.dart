import 'package:clean_bloc_movies/data/core/api_client.dart';
import 'package:clean_bloc_movies/data/data_sources/movie_remote_data_source.dart';
import 'package:clean_bloc_movies/data/repositories/movie_repository_impl.dart';
import 'package:clean_bloc_movies/domain/entities/language_entity.dart';
import 'package:clean_bloc_movies/domain/repositories/movie_repository.dart';
import 'package:clean_bloc_movies/domain/usecases/get_coming_soon.dart';
import 'package:clean_bloc_movies/domain/usecases/get_playing_now.dart';
import 'package:clean_bloc_movies/domain/usecases/get_popular.dart';
import 'package:clean_bloc_movies/domain/usecases/get_trending.dart';
import 'package:clean_bloc_movies/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:clean_bloc_movies/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:clean_bloc_movies/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:clean_bloc_movies/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getItInstance = GetIt.I;

Future init() async {
  ///All dependencies goes here
  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getItInstance()));

  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));

  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));
  getItInstance.registerLazySingleton<GetComingSoon>(
      () => GetComingSoon(getItInstance()));
  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(getItInstance()));

  getItInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getItInstance()));

  getItInstance.registerFactory(() => MovieCarouselBloc(
        getTrending: getItInstance(),
        movieBackdropBloc: getItInstance(),
      ));

  getItInstance.registerFactory(() => MovieBackdropBloc());

  getItInstance.registerFactory(() => MovieTabbedBloc(
        getPopular: GetPopular(getItInstance()),
        getComingSoon: GetComingSoon(getItInstance()),
        getPlayingNow: GetPlayingNow(getItInstance()),
      ));

  getItInstance.registerSingleton<LanguageBloc>(LanguageBloc());
}
