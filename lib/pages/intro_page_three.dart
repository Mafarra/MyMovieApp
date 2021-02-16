import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_api/pages/home_page.dart';
import 'package:movie_app_api/util/string.dart';

import 'component/intro_home_widget.dart';

class IntroPageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IntroPageWidget(
            title: introThree,
            fun: () => Get.off(HomePage()),
            btnTitle: introStartBtn,
            imagePath: "assets/svg/intro_three.png",
          ),
        ],
      ),
    );
  }
}
