import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_api/server/data/tv.dart';
import 'package:movie_app_api/util/app_shaerd_data.dart';
import 'package:movie_app_api/util/color.dart';
import 'package:movie_app_api/util/string.dart';
import 'package:movie_app_api/util/style.dart';

class FullWidthWidget extends StatelessWidget {
  final Function fun;
  final TvShow tvShow;

  const FullWidthWidget({Key key, this.fun, this.tvShow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenUtil(context);
    return GestureDetector(
      onTap: fun,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(bottom: 8.h),
              width: double.infinity,
              height: 180.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.w),
                boxShadow: [elevation],
                image: DecorationImage(
                    image: NetworkImage("${getImageUrl}${tvShow.posterPath}"),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/svg/ciercal_orange.png"),
                  child: Text(
                    "${tvShow.voteAverage}" ?? "9.8",
                    style: TextStyle(color: colorWhite),
                  ),
                ),
              ),
            ),
            Text(
              tvShow.title ?? tvShow.originalTitle ?? tvShow.overview.substring(0 , 30)??"Justice League",
              style: textSubTitleMovie,
            ),
          ],
        ),
      ),
    );
  }
}
