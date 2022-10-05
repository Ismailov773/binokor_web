import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/uij.dart';

class Api {
  Map<String, String> header = {
    "Content-Type": "application/json",
  };

  Future<List<dynamic>> getall(String url) async {
    Uri uri = Uri.parse("${UiJ.url}${url}");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));

      return json; //json.map((e) => Catalog.fromJson(e)).toList();
    } else {
      throw Exception("Error");
    }
  }


}
