import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movie_app_api/pages/component/cast_item_widget.dart';
import 'package:movie_app_api/pages/component/custom_action_bar_back.dart';
import 'package:movie_app_api/pages/viedo_player.dart';
import 'package:movie_app_api/server/backend/api_manager.dart';
import 'package:movie_app_api/server/data/cast.dart';
import 'package:movie_app_api/server/data/movie.dart';
import 'package:movie_app_api/server/data/tv.dart';
import 'package:movie_app_api/server/provider/movie_provider.dart';
import 'package:movie_app_api/util/app_shaerd_data.dart';
import 'package:movie_app_api/util/color.dart';
import 'package:movie_app_api/util/custom_dialog.dart';
import 'package:movie_app_api/util/string.dart';
import 'package:movie_app_api/util/style.dart';
import 'package:provider/provider.dart';

import 'component/bottom_btn.dart';

class DetailsMoviePage extends StatefulWidget {
  final Movie movie;
  final TvShow tvShow;

  const DetailsMoviePage({Key key, this.movie, this.tvShow}) : super(key: key);

  @override
  _DetailsMoviePageState createState() => _DetailsMoviePageState();
}

class _DetailsMoviePageState extends State<DetailsMoviePage> {
  @override
  void initState() {
    super.initState();
    getCastPerson(widget.movie == null ? widget.tvShow.id : widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    screenUtil(context);
    context.watch<MovieProvider>().personListCast;
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
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
                      boxShadow: [elevation],
                      image: DecorationImage(
                        image: NetworkImage(
                            "${getImageUrl}${widget.movie == null ? widget.tvShow.posterPath : widget.movie.posterPath}"),
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
                          onTap: () async {
                            await getVideo(widget.movie == null
                                ? widget.tvShow.id
                                : widget.movie.id);
                            if (context
                                .read<MovieProvider>()
                                .listVideoData
                                .isEmpty) {
                              CustomDialoug.showDialoug("No Video", "there is no video");
                              return;
                            }
                            return Get.to(VideoPlayers(
                              movie: widget.movie,
                              tvShow: widget.tvShow,
                            ));
                          },
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
                                image: NetworkImage(
                                    "${getImageUrl}${widget.movie == null ? widget.tvShow.backdropPath : widget.movie.backdropPath}"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            height: 190.h,
                            margin: EdgeInsets.only(left: 10.w, right: 10.w),
                            padding: EdgeInsets.only(top: 20.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(),
                                Text(
                                  "${widget.movie == null ? widget.tvShow.title ?? "The Little Things" : widget.movie.title ?? "The Little Things"}",
                                  style: textTitleMovieDetails,
                                ),
                                SizedBox(
                                  height: 23.h,
                                ),
                                Text(
                                  "${widget.movie == null ? widget.tvShow.originalTitle ?? "The Little Things" : widget.movie.originalTitle ?? "The Little Things"}",
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                  style: textSubTitleMovieDetails,
                                ),
                                Container(),
                                Row(
                                  children: [
                                    Text(
                                        "${widget.movie == null ? widget.tvShow.voteAverage : widget.movie.voteAverage}"),
                                    RatingBar.builder(
                                      initialRating: widget.movie == null
                                          ? widget.tvShow.voteAverage
                                          : widget.movie.voteAverage,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemSize: 15.w,
                                      itemCount: 7,
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
                    "${widget.movie == null ? widget.tvShow.overview : widget.movie.overview}",
                    style: textDescriptionMovieDetails.copyWith(
                        fontSize: 16, letterSpacing: 1.5),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    cast,
                    style: textHeaderTitle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Selector<MovieProvider, List<Cast>>(
                    selector: (x, y) => y.personListCast,
                    builder: (context, value, child) => Container(
                      height: 190.h,
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: value.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => CastItem(
                                cast: value[index],
                                /* fun: () => Get.to(AllViewMovieList()),*/
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),

            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20.h),
              decoration: BoxDecoration(
                color: Color(0xffF8F8F8),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BottomBtn(title: likes, imagePath: "assets/svg/like.svg" ,),
                    BottomBtn(title: FAVORITE, imagePath: "assets/svg/star.svg",),
                    BottomBtn( title: COMMNET,imagePath: "assets/svg/commit.svg",),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


