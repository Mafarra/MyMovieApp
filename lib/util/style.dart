import 'package:flutter/cupertino.dart';
import 'package:movie_app_api/util/color.dart';

var textTitleActionBar = TextStyle(
  color: colorTextDark,
  fontSize: 24,
  fontFamily: "SFProDisplay-Bold",
);

var textHeaderTitle = TextStyle(
  color: colorTextLight,
  fontSize: 18,
  fontFamily: "SFProDisplay-Bold",
);

var textSubTitleMovie = TextStyle(
  color: colorTextLight,
  fontSize: 15,
  fontFamily: "SFProDisplay-Bold",
);

var textWhiteWords = textSubTitleMovie.copyWith(
  color: colorWhite,
  fontSize: 20,
  fontFamily: "SFProDisplay-Medium",
);

var textBackActionBar = TextStyle(
  color: colorTextDark,
  fontSize: 20,
  fontFamily: "SFProDisplay-Regular",
);

var textTitleMovieDetails = TextStyle(
  color: colorWhite,
  fontSize: 20,
  fontFamily: "SFProDisplay-Bold",
);

var textSubTitleMovieDetails = TextStyle(
  color: colorTextDark,
  fontSize: 15,
  fontFamily: "SFProDisplay-Light",
);

var textDescriptionMovieDetails = TextStyle(
  color: colorTextLight,
  fontSize: 20,
  fontFamily: "SFProDisplay-Regular",
);

var textCastMovieDetails = TextStyle(
  color: colorTextDark,
  fontSize: 12,
  fontFamily: "SFProDisplay-Medium",
);

var textLargeIntroText = TextStyle(
  color: colorWhite,
  fontSize: 24,
  fontFamily: "SFProDisplay-Bold",
);

var elevation = BoxShadow(
    color: colorTextDark.withOpacity(0.2),
    blurRadius: 10.0,
    spreadRadius: 0.0,
    offset: Offset(0.0, 2.0));
