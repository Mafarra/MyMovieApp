import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app_api/pages/component/custom_action_bar_back.dart';
import 'package:movie_app_api/pages/component/now_item_tv_widget.dart';
import 'package:movie_app_api/pages/detalies_movie_page.dart';
import 'package:movie_app_api/server/backend/api_manager.dart';
import 'package:movie_app_api/server/data/movie.dart';
import 'package:movie_app_api/server/data/tv.dart';
import 'package:movie_app_api/server/provider/movie_provider.dart';
import 'package:movie_app_api/util/string.dart';
import 'package:movie_app_api/util/style.dart';
import 'package:provider/provider.dart';

import 'component/now_item_widget.dart';

class AllViewMovieList extends StatefulWidget {
  final String type;

  AllViewMovieList({Key key, this.type}) : super(key: key);

  @override
  _AllViewMovieListState createState() => _AllViewMovieListState();
}

class _AllViewMovieListState extends State<AllViewMovieList> {
  int pages = 1;
  bool isLoading = false;
  List<Movie> lnp = [];
  List<Movie> lpl = [];
  List<Movie> luc = [];
  List<TvShow> ltat = [];
  List<TvShow> ltpt = [];

  @override
  Widget build(BuildContext context) {
    context.watch<MovieProvider>().nowPopular;
    context.watch<MovieProvider>().nowPlayingList;
    context.watch<MovieProvider>().upcomingList;
    context.watch<MovieProvider>().tvAiringTodayList;
    context.watch<MovieProvider>().tvTvPopularList;
    lnp.addAll(context.watch<MovieProvider>().nowPopular);
    lpl.addAll(context.watch<MovieProvider>().nowPlayingList);
    luc.addAll(context.watch<MovieProvider>().upcomingList);
    ltat.addAll(context.watch<MovieProvider>().tvAiringTodayList);
    ltpt.addAll(context.watch<MovieProvider>().tvTvPopularList);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 48.h, left: 12.w, right: 12.w),
        child: NotificationListener(
          // ignore: missing_return
          onNotification: (ScrollNotification notification) {
            if (!isLoading &&
                notification.metrics.pixels ==
                    notification.metrics.maxScrollExtent) {
              if (widget.type == "movies") {
                getPopular(pages++);
              } else if (widget.type == nowHeader) {
                getNowPlaying(pages++);
              } else if (widget.type == popularHeader) {
                getUpcoming(pages++);
              } else if (widget.type == nowHeader + " Tv") {
                pages=2;
                getTvAiringToday(pages++);
              } else if (widget.type == popular + " Tv") {
                getTvPopular(pages++);
              }
              lnp.addAll(context.watch()<MovieProvider>().nowPopular);
              setState(() {
                isLoading = !isLoading;
              });
            }
          },
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
                    widget.type ?? nowHeader,
                    style: textHeaderTitle,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GridView.count(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                    childAspectRatio: 0.6,
                    physics: NeverScrollableScrollPhysics(),
                    children: widget.type == "movies"
                        ? List.generate(lnp.length, (index) {
                            return NowItem(
                              movie: lnp[index],
                              fun: () {
                                Get.to(DetailsMoviePage(
                                  movie: lnp[index],
                                ));
                              },
                            );
                          })
                        : widget.type == nowHeader
                            ? List.generate(lpl.length, (index) {
                                return NowItem(
                                  movie: lpl[index],
                                  fun: () {
                                    Get.to(DetailsMoviePage(
                                      movie: lpl[index],
                                    ));
                                  },
                                );
                              })
                            : widget.type == popularHeader
                                ? List.generate(luc.length, (index) {
                                    return NowItem(
                                      movie: luc[index],
                                      fun: () {
                                        Get.to(DetailsMoviePage(
                                          movie: luc[index],
                                        ));
                                      },
                                    );
                                  })
                                : widget.type == nowHeader + " Tv"
                                    ? List.generate(
                                        ltat
                                            .length, (index) {
                                        return NowTvItem(
                                          movie: ltat[index],
                                          fun: () {
                                            Get.to(DetailsMoviePage(
                                              tvShow: ltat[index],
                                            ));
                                          },
                                        );
                                      })
                                    : widget.type == popular + " Tv"
                                        ? List.generate(
                                            ltpt
                                                .length,
                                            (index) {
                                              return NowTvItem(
                                                movie: ltpt[index],
                                                fun: () {
                                                  Get.to(
                                                    DetailsMoviePage(
                                                      tvShow: ltpt[index],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          )
                                        : List.generate(10, (index) {
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
      ),
    );
  }
}
