import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app_api/util/color.dart';
import 'package:movie_app_api/util/style.dart';

class CustomActionBarBack extends StatelessWidget {
  final String title;
  final bool isLight;

  const CustomActionBarBack({Key key, this.title, this.isLight = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios,
              color: isLight ? colorWhite : colorTextDark),
          onPressed: () {
            Get.back();
          },
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          title ?? "Back",
          style: textTitleActionBar.copyWith(
              color: isLight ? colorWhite : colorTextDark),
        ),
      ],
    );
  }
}
