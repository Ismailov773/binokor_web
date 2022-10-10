
import 'package:flutter/material.dart';

class SimpleProvider with ChangeNotifier {
  int indexpage = 2;
  int indextab = 0;


  int get getindexpage => indexpage;
  int get getindextab => indextab;

  void changeindexpage(int newindex) {
    this.indexpage = newindex;
    notifyListeners();
  }
  void changeindextab(int newindex) {
    this.indextab = newindex;
    notifyListeners();
  }
}
