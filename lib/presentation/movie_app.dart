import 'package:clean_bloc_movies/common/constants/languages.dart';
import 'package:clean_bloc_movies/common/screen_util/screenutil.dart';
import 'package:clean_bloc_movies/di/get_it.dart';
import 'package:clean_bloc_movies/presentation/app_localizations.dart';
import 'package:clean_bloc_movies/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:clean_bloc_movies/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:clean_bloc_movies/presentation/journeys/home/home_screen.dart';
import 'package:clean_bloc_movies/presentation/themes/app_color.dart';
import 'package:clean_bloc_movies/presentation/themes/theme_text.dart';
import 'package:clean_bloc_movies/presentation/wiredash_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({Key key}) : super(key: key);

  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  LanguageBloc _languageBloc;
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _languageBloc = getItInstance<LanguageBloc>();
  }

  @override
  void dispose() {
    _languageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return BlocProvider<LanguageBloc>.value(
      value: _languageBloc,
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          if (state is LanguageLoaded) {
            return WiredashApp(
              navigatorKey: _navigatorKey,
              languageCode: state.locale.languageCode,
              child: MaterialApp(
                navigatorKey: _navigatorKey,
                debugShowCheckedModeBanner: false,
                title: 'Movie App',
                theme: ThemeData(
                  unselectedWidgetColor: AppColor.royalBlue,
                  primaryColor: AppColor.vulcan,
                  accentColor: AppColor.royalBlue,
                  scaffoldBackgroundColor: AppColor.vulcan,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  textTheme: ThemeText.getTextTheme(),
                  appBarTheme: const AppBarTheme(elevation: 0),
                ),
                supportedLocales:
                    Languages.languages.map((e) => Locale(e.code)).toList(),
                locale: state.locale,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                home: HomeScreen(),
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
