import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app_api/pages/component/custom_action_bar_back.dart';
import 'package:movie_app_api/pages/component/now_item_tv_widget.dart';
import 'package:movie_app_api/pages/detalies_movie_page.dart';
import 'package:movie_app_api/server/provider/movie_provider.dart';
import 'package:movie_app_api/util/string.dart';
import 'package:movie_app_api/util/style.dart';
import 'package:provider/provider.dart';

import 'component/now_item_widget.dart';

class AllViewMovieList extends StatelessWidget {
  final String type;

  const AllViewMovieList({Key key, this.type}) : super(key: key);

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
                  type ?? nowHeader,
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
                  children: type == "movies"
                      ? List.generate(
                          context.watch<MovieProvider>().nowPopular.length,
                          (index) {
                          return NowItem(
                            movie: context
                                .watch<MovieProvider>()
                                .nowPopular[index],
                            fun: () {
                              Get.to(DetailsMoviePage(
                                movie: context
                                    .read<MovieProvider>()
                                    .nowPopular[index],
                              ));
                            },
                          );
                        })
                      : type == nowHeader
                          ? List.generate(
                              context
                                  .watch<MovieProvider>()
                                  .nowPlayingList
                                  .length, (index) {
                              return NowItem(
                                movie: context
                                    .read<MovieProvider>()
                                    .nowPlayingList[index],
                                fun: () {
                                  Get.to(DetailsMoviePage(
                                    movie: context
                                        .read<MovieProvider>()
                                        .nowPlayingList[index],
                                  ));
                                },
                              );
                            })
                          : type == popularHeader
                              ? List.generate(
                                  context
                                      .watch<MovieProvider>()
                                      .upcomingList
                                      .length, (index) {
                                  return NowItem(
                                    movie: context
                                        .watch<MovieProvider>()
                                        .upcomingList[index],
                                    fun: () {
                                      Get.to(DetailsMoviePage(
                                        movie: context
                                            .watch<MovieProvider>()
                                            .upcomingList[index],
                                      ));
                                    },
                                  );
                                })
                              : type == nowHeader + " Tv"
                                  ? List.generate(
                                      context
                                          .watch<MovieProvider>()
                                          .tvAiringTodayList
                                          .length, (index) {
                                      return NowTvItem(
                                        movie: context
                                            .watch<MovieProvider>()
                                            .tvAiringTodayList[index],
                                        fun: () {
                                          Get.to(DetailsMoviePage(
                                            tvShow: context
                                                .watch<MovieProvider>()
                                                .tvAiringTodayList[index],
                                          ));
                                        },
                                      );
                                    })
                                  : type == popular + " Tv"
                                      ? List.generate(
                                          context
                                              .watch<MovieProvider>()
                                              .tvTvPopularList
                                              .length,
                                          (index) {
                                            return NowTvItem(
                                            movie:  context
                                                .watch<MovieProvider>()
                                                .tvTvPopularList[index],
                                            fun: () {
                                              Get.to(DetailsMoviePage(
                                                tvShow: context
                                                    .watch<MovieProvider>()
                                                    .tvTvPopularList[index],
                                              ),);
                                            },
                                          );
                                          },
                                        )
                                      : List.generate(100, (index) {
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
