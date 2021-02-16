import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_api/util/color.dart';
import 'package:movie_app_api/util/style.dart';

class IntroPageWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String btnTitle;
  final Function fun;

  const IntroPageWidget({
    Key key,
    this.imagePath,
    this.title,
    this.btnTitle,
    this.fun,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imagePath ?? "assets/svg/intro_one.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(),
            Container(),
            Text(
              title ?? "Get the first\nMovie &TV information",
              style: textLargeIntroText,
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              onTap: fun,
              child: Container(
                padding: EdgeInsets.all(10.h),
                margin: EdgeInsets.symmetric(horizontal: 80.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.w),
                  border: Border.all(color: colorWhite, width: 1.w),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      btnTitle ?? "start",
                      style: textWhiteWords,
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: colorWhite,
                    ),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
