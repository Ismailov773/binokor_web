import 'package:binokor_web/getconrollers/ApiConnector.dart';
import 'package:binokor_web/models/Job.dart';
import 'package:binokor_web/models/Kompleks.dart';
import 'package:binokor_web/models/News.dart';
import 'package:binokor_web/models/Order.dart';
import 'package:get/get.dart';

import '../models/Make.dart';
import '../models/Meneger.dart';

class Controller extends GetxController {
  final api = ApiConnector();
  Kompleks? kompleks;
  var indexpage = 0.obs;
  var indextab = 0.obs;

  var listMeneger = <Meneger>[].obs;
  var listKompleks = <Kompleks>[].obs;
  var listMake = <Make>[].obs;
  var listJob = <Job>[].obs;
  var listnews = <News>[].obs;
  Make? make;
  List<Order> orderlist = <Order>[].obs;

  fetchListKompleks() async {
    var komplek = await api.getKomleks();
    if (komplek != null) {
      listKompleks.value = komplek;
      listKompleks.value.sort((a, b) => a.id!.compareTo(b.id!));
    }
  }

  fetchListMeneger() async {
    final json = await api.getAll("meneger/get");
    final loadedmeneger = json.map((e) => Meneger.fromJson(e)).toList();

    if (loadedmeneger != null) {
      listMeneger.value = loadedmeneger;
      listMeneger.value.sort((a, b) => a.id!.compareTo(b.id!));
    }
  }

  fetchListMake() async {
    final json = await api.getAll("make/get");
    final loadedmake = json.map((e) => Make.fromJson(e)).toList();

    if (loadedmake != null) {
      listMake.value = loadedmake;
      listMake.value.sort((a, b) => a.id!.compareTo(b.id!));
    }
  }

  fetchListjob() async {
    final json = await api.getAll("job/get");
    final loadedjob = json.map((e) => Job.fromJson(e)).toList();

    if (loadedjob != null) {
      listJob.value = loadedjob;
      listJob.value.sort((a, b) => a.id!.compareTo(b.id!));
    }
  }

  fetchListnews() async {
    final json = await api.getAll("news/get");
    final loadednews = json.map((e) => News.fromJson(e)).toList();

    if (loadednews != null) {
      listnews.value = loadednews;
      listnews.value.sort((a, b) => a.id!.compareTo(b.id!));
    }
  }

  @override
  onInit() {
    fetchListKompleks();
    fetchListMeneger();
    fetchListMake();
    fetchListjob();
    fetchListnews();
    indexpage.value = 1;
    indextab.value = 0;
    super.onInit();
  }

  changeKompleks(Kompleks newkompleks) {
    this.kompleks = newkompleks;
    update();
  }

  changeindexpage(int newindex) => indexpage.value = newindex;

  changeindextab(int newindex) {
    this.indextab.value = newindex;
    // update();
  }

  changeMake(Make newMake){
    this.make = newMake;
  }

  addOrder(Order order){
    this.orderlist.add(order);
  }
  removeOrder(Order order){
      this.orderlist.remove(order);
  }
}

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controller>(() => Controller());
  }
}
