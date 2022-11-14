import 'package:binokor_web/getconrollers/ApiConnector.dart';
import 'package:binokor_web/models/Kompleks.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  final api = ApiConnector();
  Kompleks? kompleks;
  var indexpage = 0.obs;
  var indextab = 0.obs;

  var listKompleks = <Kompleks>[].obs;


  fetchListKompleks() async {
    var komplek = await api.getKomleks();
    if (komplek != null) {
      listKompleks.value = komplek;
      listKompleks.value.sort((a,b) => a.id!.compareTo(b.id!));
    }

  }

  @override
  onInit() {
    fetchListKompleks();
    indexpage.value =1;
    indextab.value = 1;
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
}

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controller>(() => Controller());
  }
}
