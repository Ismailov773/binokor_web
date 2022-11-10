import 'package:binokor_web/getconrollers/ApiConnector.dart';
import 'package:binokor_web/models/Kompleks.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  final api = ApiConnector();
  Kompleks? kompleks;
  int indexpage = 1;
  int indextab = 4;

  var listKompleks = <Kompleks>[].obs;

  void fetchListKompleks() async {
    var komplek = await api.getKomleks();
    if (komplek != null) {
      listKompleks.value = komplek;
    }
  }

  @override
  void onInit() {
    fetchListKompleks();
    super.onInit();
  }

  void changeKompleks(Kompleks newkompleks) {
    this.kompleks = newkompleks;
    // update();
  }

  void changeindexpage(int newindex) {
    this.indexpage = newindex;
  }

  void changeindextab(int newindex) {
    this.indextab = newindex;
  }
}



class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controller>(() => Controller());
  }
}
