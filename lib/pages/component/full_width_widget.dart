import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_api/util/app_shaerd_data.dart';
import 'package:movie_app_api/util/color.dart';
import 'package:movie_app_api/util/style.dart';

class FullWidthWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    screenUtil(context);
    return Container(
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
              image: DecorationImage(
                image: AssetImage("assets/svg/intro_three.png"),
                fit: BoxFit.cover
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(backgroundImage: AssetImage("assets/svg/ciercal_orange.png"), child: Text("9.8" , style: TextStyle(color: colorWhite),),),
            ),

          ),

          Text("Stranger Things (2016-)" ,style: textSubTitleMovie,),
        ],
      ),
    );
  }
}
