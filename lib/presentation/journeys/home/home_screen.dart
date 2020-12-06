import 'package:clean_bloc_movies/di/get_it.dart';
import 'package:clean_bloc_movies/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:clean_bloc_movies/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:clean_bloc_movies/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:clean_bloc_movies/presentation/journeys/drawer/navigation_drawer.dart';
import 'package:clean_bloc_movies/presentation/journeys/home/movie_carousel/carrusel_load_error_widget.dart';
import 'package:clean_bloc_movies/presentation/journeys/home/movie_carousel/movie_carousel_widget.dart';
import 'package:clean_bloc_movies/presentation/journeys/home/movie_tabbed/movie_tabbed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieCarouselBloc movieCarouselBloc;
  MovieBackdropBloc movieBackdropBloc;
  MovieTabbedBloc movieTabbedBloc;

  @override
  void initState() {
    super.initState();
    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    movieBackdropBloc = movieCarouselBloc.movieBackdropBloc;
    movieTabbedBloc = getItInstance<MovieTabbedBloc>();
    movieCarouselBloc.add(CarouselLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
    movieCarouselBloc?.close();
    movieBackdropBloc?.close();
    movieTabbedBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => movieCarouselBloc),
        BlocProvider(create: (context) => movieBackdropBloc),
        BlocProvider(create: (context) => movieTabbedBloc),
      ],
      child: Scaffold(
        drawer: const NavigationDrawer(),
        body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
          cubit: movieCarouselBloc,
          builder: (context, state) {
            if (state is MovieCarouselLoaded) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.6,
                    child: MovieCarouselWidget(
                      movies: state.movies,
                      defaultIndex: state.defaultIndex,
                    ),
                  ),
                  FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 0.4,
                    child: MovieTabbedWidget(),
                  ),
                ],
              );
            } else if (state is MovieCarouselError) {
              return AppErrorWidget(
                appErrorType: state.appErrorType,
                onPressed: () => movieCarouselBloc.add(CarouselLoadEvent()),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
