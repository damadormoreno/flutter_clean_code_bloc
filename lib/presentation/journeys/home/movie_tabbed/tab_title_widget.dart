import 'package:clean_bloc_movies/common/constants/size_constans.dart';
import 'package:clean_bloc_movies/common/extensions/string_extensions.dart';
import 'package:clean_bloc_movies/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:clean_bloc_movies/presentation/themes/theme_text.dart';
import 'package:clean_bloc_movies/common/extensions/size_extension.dart';

class TabTitleWidget extends StatelessWidget {
  final String title;
  final Function onTab;
  final bool isSelected;

  const TabTitleWidget({
    Key key,
    @required this.title,
    @required this.onTab,
    this.isSelected = false,
  })  : assert(title != null, 'Title cannot be null'),
        assert(onTab != null, 'onTab cannot be null'),
        assert(isSelected != null, 'isSelected cannot be null'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColor.royalBlue : Colors.transparent,
              width: Sizes.dimen_1.h,
            ),
          ),
        ),
        child: Text(
          title.t(context),
          style: isSelected
              ? Theme.of(context).textTheme.royalBlueSubtitle1
              : Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
