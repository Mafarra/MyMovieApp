import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app_api/pages/component/custom_action_bar_back.dart';
import 'package:movie_app_api/pages/detalies_movie_page.dart';
import 'package:movie_app_api/util/string.dart';
import 'package:movie_app_api/util/style.dart';

import 'component/now_item_widget.dart';

class AllViewMovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 48.h, left: 12.w, right: 12.w),
        child: SingleChildScrollView(
            child: Column(
          children: [
            CustomActionBarBack(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  nowHeader,
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
                  childAspectRatio: 0.6,
                  children: List.generate(100, (index) {
                    return NowItem(
                      fun: () {
                        Get.to(DetailsMoviePage());
                      },
                    );
                  }),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
