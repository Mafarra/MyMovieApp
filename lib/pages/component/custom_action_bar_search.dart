import 'package:flutter/material.dart';
import 'package:movie_app_api/util/color.dart';
import 'package:movie_app_api/util/style.dart';

class CustomActionBarSearch extends StatelessWidget {
  final String title;
  final Function function;

  const CustomActionBarSearch({
    Key key,
    this.title,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title ?? "MOVIES",
          style: textTitleActionBar,
        ),
        IconButton(
          icon: Icon(Icons.search, color: colorTextDark),
          onPressed: function,
        ),
      ],
    );
  }
}