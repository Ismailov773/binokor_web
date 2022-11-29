import 'package:binokor_web/getconrollers/ApiConnector.dart';
import 'package:binokor_web/models/ImageDom.dart';
import 'package:binokor_web/models/Job.dart';
import 'package:binokor_web/models/Kompleks.dart';
import 'package:binokor_web/models/LightUser.dart';
import 'package:binokor_web/models/News.dart';
import 'package:get/get.dart';

import '../models/Dom.dart';
import '../models/Make.dart';
import '../models/Meneger.dart';
import '../models/Orderb.dart';

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
  var listImageDom = <ImageDom>[].obs;
  Make? make;
  List<Orderb> orderlist = <Orderb>[].obs;

  Future<LightUser> postLightUser(String url, LightUser user) async {
    return await api.postLightUser(url, user);
  }

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

  changeindexpage(int newindex) {
    indexpage.value = newindex;
    // notifyChildrens();
    update();
  }

  changeindextab(int newindex) {
    this.indextab.value = newindex;
    // notifyChildrens();

    update();
  }

  changeMake(Make newMake) {
    this.make = newMake;
  }

  addOrder(Orderb order) {
    this.orderlist.add(order);
  }

  removeOrder(Orderb order) {
    this.orderlist.remove(order);
  }

  changeKompleks(Kompleks newkompleks) {
    this.kompleks = newkompleks;
    listImageDom.clear();
    {
      if (kompleks!.domSet!.length != 0) {
        for (Dom dom in kompleks!.domSet!) {
          for (ImageDom imageDom in dom.imageDataList!) {
            // if (imageDom.layout!) {
            listImageDom.add(imageDom);
            // }
          }
        }
      }
    }
    update();
  }
}

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controller>(() => Controller());
  }
}
