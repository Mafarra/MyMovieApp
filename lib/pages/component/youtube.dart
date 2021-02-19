import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_api/server/data/video.dart';
import 'package:movie_app_api/util/color.dart';
import 'package:movie_app_api/util/style.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeItem extends StatefulWidget {
  YoutubePlayerController controller;
  bool isPlayerReady;
  final VideoData videoData;

  YoutubeItem(
      {Key key,
        this.controller,
        this.isPlayerReady = false,
        this.videoData})
      : super(key: key);

  @override
  _YoutubeItemState createState() => _YoutubeItemState();
}

class _YoutubeItemState extends State<YoutubeItem> {
  YoutubePlayerController _controller;
  bool _isPlayerReady = false;
  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  String videoId = "iLnmTe5Q2Qw";
  listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId:widget.videoData.key ?? videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        enableCaption: true,
        disableDragSeek: false,
        loop: true,
        isLive: false,
      ),
    );
    widget.controller = _controller;
    widget.isPlayerReady = _isPlayerReady;
    _videoMetaData =  YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }
  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    widget.controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    widget.controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [elevation],
            ),
            child: YoutubePlayer(
              width: double.infinity,
              controller: widget.controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: colorAccent,
              progressColors: ProgressBarColors(
                playedColor: colorAccent,
                handleColor: colorRedError,
              ),
              onReady: () {
                widget.isPlayerReady = true;
                widget.controller.addListener(listener());
              },
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    widget.videoData.name ??
                        "name",
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: textTitleMovieDetails.copyWith(
                        fontSize: 16, color: colorTextDark),
                  ),
                  flex: 4,
                ),

                Expanded(
                  child: Text(
                    widget.videoData.type ??
                        "type",
                    textAlign: TextAlign.center,
                    style: textSubTitleMovieDetails.copyWith(fontSize: 13),
                  ),
                  flex: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
