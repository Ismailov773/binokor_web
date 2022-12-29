import 'package:binokor_web/api/api.dart';
import 'package:binokor_web/models/Kompleks.dart';
import 'package:binokor_web/models/LightUser.dart';
import 'package:get/get.dart';

import '../models/Orderb.dart';

class ApiConnector extends GetConnect {
  // final Repository repository = Repository();
  final Api api = Api();

  Future<List<Kompleks>>? getKomleks(String url) async {
    final json = await api.getall(url);
    final loadedHouse = json.map((e) => Kompleks.fromJson(e)).toList();
    loadedHouse.sort((a, b) => a.id!.compareTo(b.id!));
    return loadedHouse;
  }

  Future<List<dynamic>> getAll(String url) async {
    final json = await api.getall(url);

    return json;
  }

  Future<LightUser> postLightUser(String url, LightUser lightUser) async {
    final json = await api.post(url, lightUser);

    return LightUser.fromJson(json);
  }
}
