import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_api/pages/intro_page_three.dart';
import 'package:movie_app_api/util/string.dart';

import 'component/intro_home_widget.dart';

class IntroPageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IntroPageWidget(
            title: introTwo,
            fun: () => Get.off(IntroPageThree()),
            btnTitle: introNextBtn,
            imagePath: "assets/svg/intro_two.png",
          ),
        ],
      ),
    );
  }
}
