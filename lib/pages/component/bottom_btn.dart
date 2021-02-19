import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app_api/util/style.dart';

class BottomBtn extends StatelessWidget {
  final String imagePath , title;
  const BottomBtn({
    Key key, this.imagePath, this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30.w),
          alignment: Alignment.center,
          width: 50.w,
          height: 50.h,
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              shape: BoxShape.circle,
              boxShadow: [elevation]
          ),
          child: SvgPicture.asset(imagePath??"assets/svg/like.svg" , fit: BoxFit.cover,width: 24 , height: 24,),
        ),
        SizedBox(height: 10.h,),
        Text(title??"data" , style: textSubTitleMovie.copyWith( fontFamily: "SFProDisplay-Regular"),),
      ],
    );
  }
}