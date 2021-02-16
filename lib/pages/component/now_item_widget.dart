import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_api/util/color.dart';
import 'package:movie_app_api/util/style.dart';

class NowItem extends StatelessWidget {
  final Function fun;

  const NowItem({
    Key key,
    this.fun,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Container(
        margin: EdgeInsets.only(right: 12.w),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 240.h,
                width: 175.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  color: colorTextDark,
                  boxShadow: [elevation],
                  image: DecorationImage(
                    image: AssetImage("assets/svg/intro_three.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Justice League",
                style: textSubTitleMovie.copyWith(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
