import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_api/util/color.dart';
import 'package:movie_app_api/util/style.dart';

class GridItemMovie extends StatelessWidget {
  final Function fun;
  const GridItemMovie({
    Key key, this.fun,
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
            image: AssetImage("assets/svg/intro_two.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Container(
            alignment: Alignment.bottomLeft,
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.only(left: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Spacer(),
                Text(
                  "2016",
                  style: textCastMovieDetails.copyWith(
                      fontFamily: "SFProDisplay-Regular", color: colorTextLight),
                ),
                Text(
                  "data",
                  style: textCastMovieDetails.copyWith(
                      fontFamily: "SFProDisplay-Bold", color: colorWhite),
                ),
                SizedBox(
                  height: 9.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
