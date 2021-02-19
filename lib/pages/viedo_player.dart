import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app_api/server/data/movie.dart';
import 'package:movie_app_api/server/data/tv.dart';
import 'package:movie_app_api/server/data/video.dart';
import 'package:movie_app_api/server/provider/movie_provider.dart';
import 'package:movie_app_api/util/app_shaerd_data.dart';
import 'package:movie_app_api/util/color.dart';
import 'package:movie_app_api/util/style.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'component/youtube.dart';

class VideoPlayers extends StatefulWidget {
  final Movie movie;
  final TvShow tvShow;

  const VideoPlayers({
    Key key,
    this.movie,
    this.tvShow,
  }) : super(key: key);

  @override
  _VideoPlayersState createState() => _VideoPlayersState();
}

class _VideoPlayersState extends State<VideoPlayers> {
  YoutubePlayerController _controller;
  bool _isPlayerReady = false;
  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  String videoId = "iLnmTe5Q2Qw";


  @override
  Widget build(BuildContext context) {
    context.watch<MovieProvider>().listVideoData;
    safeAreaLight;
    return WillPopScope(
      onWillPop: () {
        Get.back();
        return Future.value(true);
      },
      child: Selector<MovieProvider, List<VideoData>>(
        selector: (x, y) => y.listVideoData,
        builder: (context, value, child) => Scaffold(
          body: SingleChildScrollView(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 4.w ,vertical: 34.h),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if(value == null){
                  return Center(child: ErrorWidget.withDetails(message: "Error 404", error:FlutterError("there are error"),),);
                }
                return YoutubeItem(
                  /*controller: _controller,
                  isPlayerReady: _isPlayerReady,*/
                  videoData: value[index],
                );
              },
              itemCount: value.length,
            ),
          ),
        ),
      ),
    );
  }




}

