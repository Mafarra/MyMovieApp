import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app_api/pages/component/full_width_widget.dart';
import 'package:movie_app_api/util/app_shaerd_data.dart';
import 'package:movie_app_api/util/string.dart';
import 'package:movie_app_api/util/style.dart';

import 'all_view_movie_list.dart';
import 'component/custom_action_bar_search.dart';
import 'component/grid_item_widget.dart';
import 'component/now_item_widget.dart';

class TabTv extends StatelessWidget {
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
            CustomActionBarSearch(
              title: "TV",
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 300.h,
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nowHeader,
                    style: textHeaderTitle,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          NowItem(
                            fun: () => Get.to(AllViewMovieList()),
                          ),
                          NowItem(
                            fun: () => Get.to(AllViewMovieList()),
                          ),
                          NowItem(
                            fun: () => Get.to(AllViewMovieList()),
                          ),
                          NowItem(
                            fun: () => Get.to(AllViewMovieList()),
                          ),
                        ]),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 20.h,
            ),
            Text(
              popular,
              style: textHeaderTitle,
            ),
            SizedBox(
              height: 10.h,
            ),

            ListView(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,

              children: [
                FullWidthWidget(),
                FullWidthWidget(),
                FullWidthWidget(),
                FullWidthWidget(),
                FullWidthWidget(),
                FullWidthWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
