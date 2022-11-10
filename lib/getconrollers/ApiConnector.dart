import 'package:binokor_web/api/repository.dart';
import 'package:binokor_web/models/Kompleks.dart';
import 'package:get/get.dart';

class ApiConnector extends GetConnect{

  final Repository repository = Repository();

  Future<List<Kompleks>>? getKomleks() async {
    final json = await repository.getall("kompleks/get");
    final loadedHouse = json.map((e) => Kompleks.fromJson(e)).toList();
    return loadedHouse;
  }
}