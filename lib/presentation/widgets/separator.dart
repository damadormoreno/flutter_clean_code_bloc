import 'package:clean_bloc_movies/common/constants/size_constans.dart';
import 'package:clean_bloc_movies/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:clean_bloc_movies/common/extensions/size_extension.dart';

class Separator extends StatelessWidget {
  const Separator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.dimen_1.h,
      width: Sizes.dimen_80.w,
      padding: EdgeInsets.only(
        top: Sizes.dimen_2.h,
        bottom: Sizes.dimen_6.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_1.h)),
        gradient: LinearGradient(colors: [
          AppColor.violet,
          AppColor.royalBlue,
        ]),
      ),
    );
  }
}
