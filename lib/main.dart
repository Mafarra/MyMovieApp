import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_api/pages/splash.dart';
import 'package:movie_app_api/server/provider/movie_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MovieProvider>(
      create: (context) => MovieProvider(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Movie App',
          home: SplashPage(),
        ),
      ),
    );
  }
}
