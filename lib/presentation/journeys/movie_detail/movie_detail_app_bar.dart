import 'package:clean_bloc_movies/common/constants/size_constans.dart';
import 'package:clean_bloc_movies/common/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class MovieDetailAppBar extends StatelessWidget {
  const MovieDetailAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: Sizes.dimen_12.h,
          ),
        ),
        Icon(
          Icons.favorite_border,
          color: Colors.white,
          size: Sizes.dimen_12.h,
        ),
      ],
    );
  }
}
