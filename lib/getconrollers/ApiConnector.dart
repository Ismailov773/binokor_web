import 'package:binokor_web/api/repository.dart';
import 'package:binokor_web/models/Kompleks.dart';
import 'package:binokor_web/models/LightUser.dart';
import 'package:get/get.dart';

import '../models/Orderb.dart';

class ApiConnector extends GetConnect{

  final Repository repository = Repository();


  Future<List<Kompleks>>? getKomleks() async {
    final json = await repository.getall("kompleks/get");
    final loadedHouse = json.map((e) => Kompleks.fromJson(e)).toList();
    return loadedHouse;
  }

  Future<List<dynamic>> getAll(String url) async{

    final json = await repository.getall(url);

    return json;
  }

  Future<LightUser> postLightUser(String url, LightUser lightUser) async{

    final json = await repository.post(url, lightUser);

    return LightUser.fromJson(json);
  }
}