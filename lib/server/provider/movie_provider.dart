import 'package:flutter/cupertino.dart';
import 'package:movie_app_api/server/data/cast.dart';
import 'package:movie_app_api/server/data/movie.dart';
import 'package:movie_app_api/server/data/tv.dart';
import 'package:movie_app_api/server/data/video.dart';

class MovieProvider extends ChangeNotifier {
  int currentIndex = 0;
  List<Movie> nowPopular = [];
  List<Movie> nowPlayingList = [];
  List<Movie> upcomingList = [];
  List<TvShow> tvAiringTodayList = [];
  List<TvShow> tvTvPopularList = [];
  List<Cast> personListCast = [];
  List<VideoData> listVideoData = [];

  setListVideoData(List<VideoData> listVideoData) {
    this.listVideoData = listVideoData;
    notifyListeners();
  }

  setListCastsPerson(List<Cast> personListCast) {
    this.personListCast = personListCast;
    notifyListeners();
  }

  setTvTvPopularList(List<TvShow> tvTvPopularList) {
    this.tvTvPopularList = tvTvPopularList;
    notifyListeners();
  }

  setTvAiringTodayList(List<TvShow> tvAiringTodayList) {
    this.tvAiringTodayList = tvAiringTodayList;
    notifyListeners();
  }

  setUpComingList(List<Movie> upcomingList) {
    this.upcomingList = upcomingList;
    notifyListeners();
  }

  setNowPlaying(List<Movie> nowPlayingList) {
    this.nowPlayingList = nowPlayingList;
    notifyListeners();
  }

  setPopularList(List<Movie> movie) {
    nowPopular = movie;
    notifyListeners();
  }

  setCurrentIndex(int i) {
    currentIndex = i;
    notifyListeners();
  }
}
