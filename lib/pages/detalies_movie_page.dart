import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movie_app_api/pages/component/cast_item_widget.dart';
import 'package:movie_app_api/pages/component/custom_action_bar_back.dart';
import 'package:movie_app_api/pages/viedo_player.dart';
import 'package:movie_app_api/util/app_shaerd_data.dart';
import 'package:movie_app_api/util/color.dart';
import 'package:movie_app_api/util/string.dart';
import 'package:movie_app_api/util/style.dart';

import 'all_view_movie_list.dart';

class DetailsMoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    screenUtil(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 410.h,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    height: 300.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/svg/view_image.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 25.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                flex: 4,
                                child: CustomActionBarBack(
                                  isLight: true,
                                )),
                            Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.share,
                                  color: colorWhite,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        GestureDetector(
                          onTap: () => Get.to(VideoPlayers()),
                          child: Center(
                            child: SvgPicture.asset("assets/svg/play_btn.svg"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        children: [
                          Container(
                            height: 190.h,
                            width: 140.w,
                            decoration: BoxDecoration(
                              boxShadow: [elevation],
                              borderRadius: BorderRadius.circular(10.w),
                              image: DecorationImage(
                                image: AssetImage("assets/svg/view_image.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            height: 190.h,
                            margin: EdgeInsets.only(left: 10.w),
                            padding: EdgeInsets.only(top: 20.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Justice league",
                                  style: textTitleMovieDetails,
                                ),
                                SizedBox(
                                  height: 33.h,
                                ),
                                Text(
                                  "3,292 People wathing\nAction, Adventure, Fantasy ",
                                  style: textSubTitleMovieDetails,
                                ),
                                Container(),
                                Row(
                                  children: [
                                    Text("9.8"),
                                    RatingBar.builder(
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemSize: 20.w,
                                      itemCount: 5,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: colorAccent,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    loremIpsom,
                    style: textDescriptionMovieDetails.copyWith(fontSize: 16 , letterSpacing: 1.5),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    cast,
                    style: textHeaderTitle.copyWith(fontSize: 14 ,),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    height: 190.h,
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                CastItem(
                                  fun: () => Get.to(AllViewMovieList()),
                                ),
                                CastItem(
                                  fun: () => Get.to(AllViewMovieList()),
                                ),
                                CastItem(
                                  fun: () => Get.to(AllViewMovieList()),
                                ),
                                CastItem(
                                  fun: () => Get.to(AllViewMovieList()),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
