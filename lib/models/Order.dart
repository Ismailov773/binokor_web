import 'package:binokor_web/models/Make.dart';

class Order {
  Make? make;
  String? concrete;
  String? heigth;
  int? id;
  String? length;
  String? mass;
  String? name;
  String? volume;
  String? weigth;

  int? count = 0;

  Order({this.make, this.concrete, this.heigth, this.id, this.length, this.mass, this.name,
      this.volume, this.weigth, this.count});
}
