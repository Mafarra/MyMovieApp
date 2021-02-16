import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'color.dart';

screenUtil(BuildContext context) {
  ScreenUtil.init(context,
      width: 392.72727272727275,
      height: 803.6363636363636,
      allowFontScaling: true);
}

var safeAreaLight =
SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
  systemNavigationBarColor: colorWhite,
  statusBarColor: colorTrans,
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarIconBrightness: Brightness.dark,
));

var bottomNavDark =
SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
  systemNavigationBarColor: colorPrimaryColor,
  statusBarColor: colorPrimaryColor,
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarIconBrightness: Brightness.light,
));



void portraitOrientation(){
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
}