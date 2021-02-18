
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_api/server/data/movie.dart';
import 'package:movie_app_api/util/color.dart';
import 'package:movie_app_api/util/string.dart';
import 'package:movie_app_api/util/style.dart';

class GridItemMovieMore extends StatelessWidget {
  final Function fun;
  final Movie movie;
  const GridItemMovieMore({
    Key key,
    this.fun, this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Container(
        alignment: Alignment.bottomCenter,
        width: 110.w,
        height: 210.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.w),
          color: colorYalow,
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
