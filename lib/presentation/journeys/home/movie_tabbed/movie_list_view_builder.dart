import 'package:clean_bloc_movies/common/constants/size_constans.dart';
import 'package:clean_bloc_movies/domain/entities/movie_entity.dart';
import 'package:clean_bloc_movies/presentation/journeys/home/movie_tabbed/movie_tab_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:clean_bloc_movies/common/extensions/size_extension.dart';

class MovieListViewBuilder extends StatelessWidget {
  final List<MovieEntity> movies;

  const MovieListViewBuilder({
    Key key,
    @required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_6),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: movies.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 14.w,
          );
        },
        itemBuilder: (context, index) {
          final MovieEntity movie = movies[index];
          return MovieTabCardWidget(
            movieId: movie.id,
            title: movie.title,
            posterPath: movie.posterPath,
          );
        },
      ),
    );
  }
}
