import 'package:clean_bloc_movies/common/screen_util/screenutil.dart';
import 'package:clean_bloc_movies/presentation/journeys/home/home_screen.dart';
import 'package:clean_bloc_movies/presentation/themes/app_color.dart';
import 'package:clean_bloc_movies/presentation/themes/theme_text.dart';
import 'package:flutter/material.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        primaryColor: AppColor.vulcan,
        scaffoldBackgroundColor: AppColor.vulcan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeText.getTextTheme(),
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      home: HomeScreen(),
    );
  }
}
