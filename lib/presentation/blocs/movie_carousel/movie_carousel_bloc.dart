import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_bloc_movies/domain/entities/movie_entity.dart';
import 'package:clean_bloc_movies/domain/entities/no_params.dart';
import 'package:clean_bloc_movies/domain/usecases/get_trending.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;

  MovieCarouselBloc({@required this.getTrending})
      : super(MovieCarouselInitial());

  @override
  Stream<MovieCarouselState> mapEventToState(
    MovieCarouselEvent event,
  ) async* {
    if (event is CarouselLoadEvent) {
      final moviesEither = await getTrending(NoParams());
      yield moviesEither.fold(
        (l) => MovieCarouselError(),
        (movies) {
          return MovieCarouselLoaded(
            movies: movies,
            defaultIndex: event.defaultIndex,
          );
        },
      );
    }
  }
}
