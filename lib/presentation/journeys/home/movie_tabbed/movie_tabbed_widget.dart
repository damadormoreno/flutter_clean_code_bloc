import 'package:clean_bloc_movies/common/constants/size_constans.dart';
import 'package:clean_bloc_movies/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:clean_bloc_movies/common/extensions/size_extension.dart';
import 'package:clean_bloc_movies/presentation/journeys/home/movie_tabbed/movie_list_view_builder.dart';
import 'package:clean_bloc_movies/presentation/journeys/home/movie_tabbed/movie_tabbed_constants.dart';
import 'package:clean_bloc_movies/presentation/journeys/home/movie_tabbed/tab_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieTabbedWidget extends StatefulWidget {
  MovieTabbedWidget({Key key}) : super(key: key);

  @override
  _MovieTabbedWidgetState createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget> {
  MovieTabbedBloc get movieTabbedBloc =>
      BlocProvider.of<MovieTabbedBloc>(context);

  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: currentTabIndex));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: Sizes.dimen_4.h),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0;
                      i < MovieTabbedConstants.movieTabs.length;
                      i++)
                    TabTitleWidget(
                      title: MovieTabbedConstants.movieTabs[i].title,
                      onTab: () => _onTabTapped(i),
                      isSelected: MovieTabbedConstants.movieTabs[i].index ==
                          state.currentTabIndex,
                    ),
                ],
              ),
              if (state is MovieTabChanged)
                Expanded(
                  child: MovieListViewBuilder(movies: state.movies),
                ),
            ],
          ),
        );
      },
    );
  }

  void _onTabTapped(int index) {
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: index));
  }
}
