import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app_api/pages/all_view_movie_list.dart';
import 'package:movie_app_api/pages/component/grid_item_more_widget.dart';
import 'package:movie_app_api/pages/component/movie_widget_more.dart';
import 'package:movie_app_api/pages/component/now_item_more_widget.dart';
import 'package:movie_app_api/pages/detalies_movie_page.dart';
import 'package:movie_app_api/server/backend/api_manager.dart';
import 'package:movie_app_api/server/provider/movie_provider.dart';
import 'package:movie_app_api/util/string.dart';
import 'package:movie_app_api/util/style.dart';
import 'package:provider/provider.dart';

import 'component/custom_action_bar_search.dart';
import 'component/grid_item_widget.dart';
import 'component/movie_widget.dart';
import 'component/now_item_widget.dart';

class TabHome extends StatefulWidget {
  @override
  _TabHomeState createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  @override
  void initState() {
    super.initState();
    getPopular(1);
    getNowPlaying(1);
    getUpcoming(1);
  }

  @override
  Widget build(BuildContext context) {
    context.watch<MovieProvider>().nowPopular;
    context.watch<MovieProvider>().nowPlayingList;
    context.watch<MovieProvider>().upcomingList;
    return Consumer<MovieProvider>(
      builder: (context, value, child) => Padding(
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
                child: ListView.builder(
                  itemCount: value.nowPopular.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return (value.nowPopular.length != null &&
                            value.nowPopular.length - 1 == index)
                        ? MovieWidgetMore(
                            fun: () => Get.to(AllViewMovieList(type: "movies",)),
                            movie: value.nowPopular[index],
                          )
                        : MovieWidget(
                            fun: () => Get.to(DetailsMoviePage(
                                movie: value.nowPopular[index]
                            )),
                            movie: value.nowPopular[index],
                          );
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
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
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: value.nowPlayingList.length,
                        itemBuilder: (context, index) {
                          return (value.nowPlayingList.isNotEmpty &&
                                  value.nowPlayingList.length - 1 == index)
                              ? NowItemMore(
                                  fun: () => Get.to(AllViewMovieList(type: nowHeader,)),
                                )
                              : NowItem(
                                  fun: () => Get.to(DetailsMoviePage(
                                      movie: value.nowPlayingList[index]
                                  )),
                                  movie: value.nowPlayingList[index],
                                );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
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
                    children: List.generate(value.upcomingList.length, (index) {
                      return (value.upcomingList.isNotEmpty &&
                              value.upcomingList.length - 1 == index)
                          ? GridItemMovieMore(fun: ()=> Get.to(AllViewMovieList(
                        type: popularHeader,
                      )),)
                          : GridItemMovie(
                              fun: () => Get.to(DetailsMoviePage(movie: value.upcomingList[index],)),
                              movie: value.upcomingList[index],
                            );
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
