import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_api/server/data/cast.dart';
import 'package:movie_app_api/util/color.dart';
import 'package:movie_app_api/util/string.dart';
import 'package:movie_app_api/util/style.dart';

class CastItem extends StatelessWidget {
  final Function fun;
  final Cast cast;

  const CastItem({
    Key key,
    this.fun,
    this.cast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 4.w,
        ),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 140.h,
                width: 90.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  color: colorTextDark,
                  boxShadow: [elevation],
                  image: DecorationImage(
                    image: NetworkImage("${getImageUrl}${cast.profilePath}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                cast.name ?? "Justice League",
                style: textSubTitleMovie.copyWith(fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
