import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_api/server/data/tv.dart';
import 'package:movie_app_api/util/app_shaerd_data.dart';
import 'package:movie_app_api/util/color.dart';
import 'package:movie_app_api/util/string.dart';
import 'package:movie_app_api/util/style.dart';

class FullWidthMoreWidget extends StatelessWidget {
  final Function fun;
  final TvShow tvShow;

  const FullWidthMoreWidget({Key key, this.fun, this.tvShow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenUtil(context);
    return GestureDetector(
      onTap: fun,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        child: Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.only(bottom: 8.h),
          width: double.infinity,
          height: 180.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.w),
            color: colorYalow
          ),
          child: Center(child: Text(more , style: textWhiteWords,)),
        ),
      ),
    );
  }
}
