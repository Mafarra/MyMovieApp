import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_api/server/data/movie.dart';
import 'package:movie_app_api/server/data/tv.dart';
import 'package:movie_app_api/util/app_shaerd_data.dart';
import 'package:movie_app_api/util/color.dart';
import 'package:movie_app_api/util/string.dart';
import 'package:movie_app_api/util/style.dart';

class NowTvItem extends StatelessWidget {
  final Function fun;
  final TvShow movie;

  const NowTvItem({
    Key key,
    this.fun,
    this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Container(
        margin: EdgeInsets.only(right: 12.w),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 240.h,
                width: 175.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  color: colorTextDark,
                  boxShadow: [elevation],
                  image: DecorationImage(
                    image: NetworkImage("https://image.tmdb.org/t/p/w500${movie.posterPath}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                movie.title ?? movie.originalTitle ?? (movie.overview.length >20)? movie.overview.substring(0 , 20):movie.overview??"Justice League",
                style: textSubTitleMovie.copyWith(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
