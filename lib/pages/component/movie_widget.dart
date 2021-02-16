import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_api/util/color.dart';
import 'package:movie_app_api/util/style.dart';

class MovieWidget extends StatelessWidget {
  final Function fun;

  const MovieWidget({
    Key key, this.fun,
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
          color: colorTextDark,
          borderRadius: BorderRadius.circular(10.w),
          boxShadow: [elevation],
          image: DecorationImage(
              image: AssetImage("assets/svg/intro_one.png"), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
