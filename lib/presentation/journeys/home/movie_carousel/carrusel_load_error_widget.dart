import 'package:clean_bloc_movies/common/constants/size_constans.dart';
import 'package:clean_bloc_movies/common/constants/translation_constants.dart';
import 'package:clean_bloc_movies/domain/entities/app_error.dart';
import 'package:clean_bloc_movies/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:clean_bloc_movies/common/extensions/string_extensions.dart';
import 'package:clean_bloc_movies/presentation/widgets/button.dart';
import 'package:clean_bloc_movies/common/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';

class AppErrorWidget extends StatelessWidget {
  final AppErrorType appErrorType;
  final Function onPressed;
  const AppErrorWidget({
    Key key,
    @required this.appErrorType,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_32),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            appErrorType == AppErrorType.api
                ? TranslationConstants.somethingWentWrong.t(context)
                : TranslationConstants.checkNetwork.t(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          ButtonBar(
            children: [
              Button(
                text: TranslationConstants.retry,
                onButtonPressed: onPressed,
              ),
              Button(
                text: TranslationConstants.feedback,
                onButtonPressed: () => Wiredash.of(context).show(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
