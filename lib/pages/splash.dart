import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movie_app_api/server/backend/api_manager.dart';
import 'package:movie_app_api/util/app_shaerd_data.dart';
import 'package:movie_app_api/util/color.dart';
import 'package:movie_app_api/util/style.dart';
import 'intro_page_one.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    screenUtil(context);
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    Future.delayed(Duration(seconds: 3)).then((value) => Get.off(IntroPageOne()));
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/svg/splash_background.png"),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(),
              Container(),
              SvgPicture.asset("assets/svg/LogoGroup.svg"),
              Container(),
              Container(),
              Container(),
              Text("developed by Osama M. A. Al-Dasoqi " , style: textCastMovieDetails.copyWith(color: colorWhite),),
            ],
          )),
    );
  }
}
