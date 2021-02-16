import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app_api/pages/all_view_movie_list.dart';
import 'package:movie_app_api/util/string.dart';
import 'package:movie_app_api/util/style.dart';

import 'component/custom_action_bar_search.dart';
import 'component/grid_item_widget.dart';
import 'component/movie_widget.dart';
import 'component/now_item_widget.dart';

class TabHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 48.h, left: 12.w, right: 12.w),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomActionBarSearch(),
            Container(
              height: 170.h,
              alignment: Alignment.topLeft,
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    MovieWidget(fun: ()=> Get.to(AllViewMovieList()),),
                    MovieWidget(),
                    MovieWidget(),
                    MovieWidget(),
                    MovieWidget(),
                  ]),
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
                          NowItem(fun: ()=> Get.to(AllViewMovieList()),),
                        ]),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  popularHeader,
                  style: textHeaderTitle,
                ),
                SizedBox(
                  height: 10.h,
                ),
                GridView.count(
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 0.7,
                  children: List.generate(100, (index) {
                    return GridItemMovie(fun: ()=> Get.to(AllViewMovieList()) ,);
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
