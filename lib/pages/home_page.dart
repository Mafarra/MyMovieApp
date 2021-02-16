import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app_api/pages/tab_home.dart';
import 'package:movie_app_api/pages/tab_profile.dart';
import 'package:movie_app_api/pages/tab_tv.dart';
import 'package:movie_app_api/server/provider/movie_provider.dart';
import 'package:movie_app_api/util/app_shaerd_data.dart';
import 'package:movie_app_api/util/color.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);

  }

  @override
  Widget build(BuildContext context) {
    screenUtil(context);
    safeAreaLight;
    return Scaffold(
      body: TabBarView(controller: _controller, children: [
        TabHome(),
        TabTv(),
        TabProfile(),
      ]),
      bottomNavigationBar: Selector<MovieProvider, int>(
        selector: (x, y) => y.currentIndex,
        builder: (context, value, child) => BottomNavigationBar(
          selectedItemColor: colorPrimaryColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: value,
          onTap: (values) {
            Provider.of<MovieProvider>(context, listen: false)
                .setCurrentIndex(values);
            print("${context.read<MovieProvider>().currentIndex} $values");
            _controller.animateTo(context.read<MovieProvider>().currentIndex);
          },
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(4.w),
                  child: SvgPicture.asset(
                    "assets/svg/logo.svg",
                    color: value == 0 ? colorPrimaryColor : colorIcon,
                    width: 24.w,
                    height: 24.w,
                  ),
                ),
                label: "MOIVES"),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(4.w),
                  child: SvgPicture.asset(
                    "assets/svg/tv_icon.svg",
                    color: value == 1 ? colorPrimaryColor : colorIcon,
                  ),
                ),
                label: "TV"),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(4.w),
                  child: SvgPicture.asset(
                    "assets/svg/profile.svg",
                    color: value == 2 ? colorPrimaryColor : colorIcon,
                  ),
                ),
                label: "PROFILE"),
          ],
        ),
      ),
    );
  }
}
