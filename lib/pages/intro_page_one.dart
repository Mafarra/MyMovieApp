import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_api/pages/intro_page_two.dart';
import 'package:movie_app_api/util/string.dart';

import 'component/intro_home_widget.dart';

class IntroPageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IntroPageWidget(
            title: introOne,
            fun: ()=> Get.off(IntroPageTwo()),
            btnTitle: introNextBtn,
            imagePath: "assets/svg/intro_one.png",
          ),
        ],
      ),
    );
  }
}
