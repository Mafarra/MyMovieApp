import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app_api/pages/component/movie_widget.dart';
import 'package:movie_app_api/util/app_shaerd_data.dart';
import 'package:movie_app_api/util/color.dart';
import 'package:movie_app_api/util/style.dart';

import 'all_view_movie_list.dart';
import 'component/profile_grid_widget.dart';

class TabProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    screenUtil(context);
    return Padding(
      padding: EdgeInsets.only(top: 48.h, left: 12.w, right: 12.w),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "profile",
                  style: textTitleActionBar,
                ),
                IconButton(
                  icon: Icon(Icons.settings, color: colorTextDark),
                  onPressed: () {},
                ),
              ],
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 23.h,
                  ),
                  Container(
                    width: 120.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [elevation],
                      image: DecorationImage(
                          image: AssetImage("assets/svg/osama.jpeg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Osama M. A. Al-Dasoqi",
                    style: textBackActionBar.copyWith(
                        fontSize: 20, fontFamily: "SFProDisplay-Semibold"),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BoxData(),
                      BoxData(),
                      BoxData(),
                    ],
                  ),
                ],
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                GridView.count(
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 0.625,
                  children: List.generate(20, (index) {
                    return ProfileGridWidget(fun: ()=> Get.to(AllViewMovieList()) ,);
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
