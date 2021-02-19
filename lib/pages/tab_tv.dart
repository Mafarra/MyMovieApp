import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app_api/pages/component/full_width_widget.dart';
import 'package:movie_app_api/pages/component/now_item_more_widget.dart';
import 'package:movie_app_api/pages/component/now_item_tv_widget.dart';
import 'package:movie_app_api/pages/detalies_movie_page.dart';
import 'package:movie_app_api/server/backend/api_manager.dart';
import 'package:movie_app_api/server/data/tv.dart';
import 'package:movie_app_api/server/provider/movie_provider.dart';
import 'package:movie_app_api/util/app_shaerd_data.dart';
import 'package:movie_app_api/util/string.dart';
import 'package:movie_app_api/util/style.dart';
import 'package:provider/provider.dart';

import 'all_view_movie_list.dart';
import 'component/custom_action_bar_search.dart';
import 'component/full_width_more_widget.dart';

class TabTv extends StatefulWidget {
  @override
  _TabTvState createState() => _TabTvState();
}

class _TabTvState extends State<TabTv> {
  @override
  void initState() {
    super.initState();
    getTvAiringToday(2);
    getTvPopular(1);
  }

  @override
  Widget build(BuildContext context) {
    screenUtil(context);
    context.watch<MovieProvider>().tvAiringTodayList;
    context.watch<MovieProvider>().tvTvPopularList;
    return Consumer<MovieProvider>(
      builder: (context, value, child) => Padding(
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
                      nowHeader + " Tv",
                      style: textHeaderTitle,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: value.tvAiringTodayList.length,
                        itemBuilder: (context, index) {
                          if (value.tvAiringTodayList.isEmpty) {
                            return Center(child: CircularProgressIndicator(),);
                          }
                          List<TvShow> list = value.tvAiringTodayList;

                          return (list.isNotEmpty &&
                              list.length - 1 == index)
                              ? NowItemMore(
                                  fun: () => Get.to(AllViewMovieList(
                                    type: nowHeader + " Tv",
                                  )),
                                )
                              : NowTvItem(
                                  fun: () => Get.to(DetailsMoviePage(
                                    tvShow: list[index],
                                  )),
                                  movie: list[index],
                                );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                popular + " Tv",
                style: textHeaderTitle,
              ),
              SizedBox(
                height: 10.h,
              ),
              ListView.builder(
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: value.tvTvPopularList.length,
                itemBuilder: (context, index) {
                  return (value.tvTvPopularList.isNotEmpty &&
                          value.tvTvPopularList.length - 1 == index)
                      ? FullWidthMoreWidget(
                          fun: () => Get.to(AllViewMovieList(
                            type: popular + " Tv",
                          )),
                        )
                      : FullWidthWidget(
                          fun: () => Get.to(DetailsMoviePage(
                            tvShow: value.tvTvPopularList[index],
                          )),
                          tvShow: value.tvTvPopularList[index],
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
