import 'package:clean_bloc_movies/common/constants/size_constans.dart';
import 'package:clean_bloc_movies/common/constants/translation_constants.dart';
import 'package:clean_bloc_movies/presentation/themes/app_color.dart';
import 'package:clean_bloc_movies/common/extensions/size_extension.dart';
import 'package:clean_bloc_movies/common/extensions/string_extensions.dart';
import 'package:clean_bloc_movies/presentation/widgets/button.dart';
import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Widget image;

  const AppDialog({
    Key key,
    @required this.title,
    @required this.description,
    @required this.buttonText,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.vulcan,
      elevation: Sizes.dimen_32,
      insetPadding: EdgeInsets.all(Sizes.dimen_32.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_8.w)),
      ),
      child: Container(
        padding: EdgeInsets.only(
          top: Sizes.dimen_4.h,
          left: Sizes.dimen_16.w,
          right: Sizes.dimen_16.w,
        ),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: AppColor.vulcan,
            blurRadius: Sizes.dimen_16,
          ),
        ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title.t(context),
              style: Theme.of(context).textTheme.headline5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.dimen_6,
              ),
              child: Text(
                description.t(context),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            if (image != null) image,
            Button(
              text: TranslationConstants.okay,
              onButtonPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    );
  }
}
