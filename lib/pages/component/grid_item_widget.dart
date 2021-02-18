import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_api/server/data/movie.dart';
import 'package:movie_app_api/util/color.dart';
import 'package:movie_app_api/util/string.dart';
import 'package:movie_app_api/util/style.dart';

class GridItemMovie extends StatelessWidget {
  final Function fun;
  final Movie movie;

  const GridItemMovie({
    Key key,
    this.fun,
    this.movie,
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
          color: colorTextDark,
          boxShadow: [elevation],
          image: DecorationImage(
            image: NetworkImage("${getImageUrl}${movie.posterPath}"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Container(
            alignment: Alignment.topRight,
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.only(left: 10.w),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/svg/ciercal_orange.png"),
                child: Text(
                  "${movie.voteAverage}" ?? "9.8",
                  style: TextStyle(color: colorWhite),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
