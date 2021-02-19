import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_api/util/color.dart';
import 'package:movie_app_api/util/style.dart';

class BoxData extends StatelessWidget {
  const BoxData({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 90.h,
      width: 110.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.w),
        boxShadow: [elevation],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "3210",
            style: textDescriptionMovieDetails.copyWith(
              color: colorAccent,
              fontSize: 22,
            ),
          ),
          Text(
            "like",
            style: textDescriptionMovieDetails.copyWith(
              color: colorTextLight,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
