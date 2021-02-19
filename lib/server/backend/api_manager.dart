import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:movie_app_api/server/data/cast.dart';
import 'package:movie_app_api/server/data/movie.dart';
import 'package:movie_app_api/server/data/tv.dart';
import 'package:movie_app_api/server/data/video.dart';
import 'package:movie_app_api/server/provider/movie_provider.dart';
import 'package:movie_app_api/util/custom_dialog.dart';
import 'package:movie_app_api/util/custom_progres_dialog.dart';
import 'package:provider/provider.dart';

String api_key = "api_key=c06efb2117f4a6fcba6ccb7bf6a5a001";
String baseUrl = "https://api.themoviedb.org/3/";
Logger logger = Logger();

getPopular(int pages) async {
  String url = "${baseUrl}movie/popular?${api_key}&page=$pages";
  try {
    Future.delayed(Duration.zero, () {
      CustomeProgress.pr.show();
    });
    Map map = {};
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      logger.e(response.body);
      map = json.decode(response.body);
      List results = map["results"];

      List<Movie> listMovie = results.map((e) => Movie.fromJson(e)).toList();
      Provider.of<MovieProvider>(Get.context, listen: false)
          .setPopularList(listMovie);
      CustomeProgress.pr.dismiss();
    } else {
      logger.e(response.body);
      CustomeProgress.pr.dismiss();
      CustomDialoug.showDialoug("Error", map["status_message"]);
    }
  } catch (e) {
    CustomeProgress.pr.dismiss();
    CustomDialoug.showDialoug("Error", e.toString());
    print(e);
  }
}

getNowPlaying(int pages) async {
  String url = "${baseUrl}movie/now_playing?${api_key}&page=$pages";
  try {
    Future.delayed(Duration.zero, () {
      CustomeProgress.pr.show();
    });
    Map map = {};
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      logger.d(response.body);
      map = json.decode(response.body);
      List result = map["results"];
      List<Movie> listMovie = result.map((e) => Movie.fromJson(e)).toList();
      Provider.of<MovieProvider>(Get.context, listen: false)
          .setNowPlaying(listMovie);
      CustomeProgress.pr.dismiss();
    } else {
      logger.e(response.body);
      CustomeProgress.pr.dismiss();
      CustomDialoug.showDialoug("Error", map["status_message"]);
    }
  } catch (e) {
    print(e);
    CustomeProgress.pr.dismiss();
    CustomDialoug.showDialoug("Error", e.toString());
  }
}

getUpcoming(int pages) async {
  String url = "${baseUrl}movie/upcoming?$api_key&page=$pages";

  try {
    Future.delayed(Duration.zero, () {
      CustomeProgress.pr.show();
    });
    Map map = {};
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      map = json.decode(response.body);
      List results = map["results"];
      List<Movie> list = results.map((e) => Movie.fromJson(e)).toList();
      Provider.of<MovieProvider>(Get.context, listen: false)
          .setUpComingList(list);
      logger.e(response.body);
      CustomeProgress.pr.dismiss();
    } else {
      logger.e(response.body);
      CustomeProgress.pr.dismiss();
      CustomDialoug.showDialoug("Error", map["status_message"]);
    }
  } catch (e) {
    print(e);
    CustomeProgress.pr.dismiss();
    CustomDialoug.showDialoug("Error", e.toString());
  }
}

//todo this for tv show

getTvAiringToday(int pages) async {
  String url = "${baseUrl}tv/airing_today?$api_key&page=$pages";
  try {
    Future.delayed(Duration.zero).then((value) => CustomeProgress.pr.show());
    http.Response response = await http.get(url);
    Map map = {};
    if (response.statusCode == 200) {
      map = json.decode(response.body);
      List results = map["results"];
      List<TvShow> list = results.map((e) => TvShow.fromJson(e)).toList();
      Provider.of<MovieProvider>(Get.context, listen: false)
          .setTvAiringTodayList(list);
      logger.d(map);
      CustomeProgress.pr.dismiss();
    } else {
      logger.e(response.body);
      CustomeProgress.pr.dismiss();
      CustomDialoug.showDialoug("Error", map["status_message"]);
    }
  } catch (e) {
    print(e);
    logger.e(e.toString());
    CustomeProgress.pr.dismiss();
    CustomDialoug.showDialoug("Error", e.toString());
  }
}

getTvPopular(int pages) async {
  String url = "${baseUrl}tv/popular?$api_key&page=$pages";
  try {
    Future.delayed(Duration.zero).then((value) => CustomeProgress.pr.show());
    http.Response response = await http.get(url);
    Map map = {};
    if (response.statusCode == 200) {
      map = json.decode(response.body);
      List results = map["results"];
      List<TvShow> listTvShow = results.map((e) => TvShow.fromJson(e)).toList();
      Provider.of<MovieProvider>(Get.context, listen: false)
          .setTvTvPopularList(listTvShow);
      CustomeProgress.pr.dismiss();
      logger.e(response.body);
    } else {
      logger.e(response.body);
      CustomeProgress.pr.dismiss();
      CustomDialoug.showDialoug("Error", map["status_message"]);
    }
  } catch (e) {
    logger.e(e.toString());
    CustomeProgress.pr.dismiss();
    CustomDialoug.showDialoug("Error", e.toString());
  }
}

getCastPerson(int id) async {
  String url = "${baseUrl}movie/$id/credits?$api_key";
  try {
    Future.delayed(Duration.zero).then((value) => CustomeProgress.pr.show());
    http.Response response = await http.get(url);
    Map map = {};
    if (response.statusCode == 200) {
      map = json.decode(response.body);
      List results = map["cast"];
      List<Cast> listCasts = results.map((e) => Cast.fromJson(e)).toList();
      Provider.of<MovieProvider>(Get.context, listen: false)
          .setListCastsPerson(listCasts);
      CustomeProgress.pr.dismiss();
    } else {
      logger.e(response.body);
      CustomeProgress.pr.dismiss();
      CustomDialoug.showDialoug("Error", map["status_message"]);
    }
  } catch (e) {
    logger.e(e.toString());
    CustomeProgress.pr.dismiss();
    CustomDialoug.showDialoug("Error", e.toString());
  }
}

//todo this for video
getVideo(int viewId) async {
  String url = "${baseUrl}movie/$viewId/videos?$api_key";
  try {
    Future.delayed(Duration.zero).then((value) => CustomeProgress.pr.show());
    http.Response response = await http.get(url);
    Map map = {};
    if (response.statusCode == 200) {
      map = json.decode(response.body);
      List result = map["results"];
      List<VideoData> listVideoData =
          result.map((e) => VideoData.fromJson(e)).toList();
      Provider.of<MovieProvider>(Get.context, listen: false)
          .setListVideoData(listVideoData);
      Logger().e(map);
      CustomeProgress.pr.dismiss();
    } else {
      logger.e(response.body);
      CustomeProgress.pr.dismiss();
      CustomDialoug.showDialoug("Error", map["status_message"]);
    }
  } catch (e) {
    logger.e(e.toString());
    CustomeProgress.pr.dismiss();
    CustomDialoug.showDialoug("Error", e.toString());
  }
}
