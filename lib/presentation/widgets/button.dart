import 'package:clean_bloc_movies/common/constants/size_constans.dart';
import 'package:clean_bloc_movies/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:clean_bloc_movies/common/extensions/string_extensions.dart';
import 'package:clean_bloc_movies/common/extensions/size_extension.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onButtonPressed;

  const Button({
    Key key,
    @required this.text,
    @required this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.royalBlue,
              AppColor.violet,
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_20.w))),
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
      height: Sizes.dimen_16.h,
      child: FlatButton(
        onPressed: onButtonPressed,
        child: Text(
          text.t(context),
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
