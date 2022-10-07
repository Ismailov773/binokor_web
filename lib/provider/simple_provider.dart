
import 'package:flutter/material.dart';

class SimpleProvider with ChangeNotifier {
  int indexpage = 1;
  int indextab = 3;


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
