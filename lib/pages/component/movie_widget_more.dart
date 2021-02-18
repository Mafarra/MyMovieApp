import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_api/server/data/movie.dart';
import 'package:movie_app_api/util/color.dart';
import 'package:movie_app_api/util/string.dart';
import 'package:movie_app_api/util/style.dart';

class MovieWidgetMore extends StatelessWidget {
  final Function fun;
  final Movie movie;
  final String image;

  const MovieWidgetMore({
    Key key,
    this.fun,
    this.movie,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Container(
        margin: EdgeInsets.only(right: 10.w, top: 5.h, bottom: 5.h),
        width: 320.w,
        height: 160.h,
        decoration: BoxDecoration(
          color: colorYalow,
          borderRadius: BorderRadius.circular(10.w),
          boxShadow: [elevation],
        ),
        child: Center(
          child: Text(
            more,
            style: textWhiteWords,
          ),
        ),
      ),
    );
  }
}
