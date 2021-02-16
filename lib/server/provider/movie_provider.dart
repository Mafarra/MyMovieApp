import 'package:flutter/cupertino.dart';

class MovieProvider extends ChangeNotifier {
  int currentIndex = 0;

  setCurrentIndex(int i) {
    currentIndex = i;
    notifyListeners();
  }
}
