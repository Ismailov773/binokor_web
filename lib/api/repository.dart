

import '../models/Catalog.dart';
import 'api.dart';

class Repository {
  final Api api = Api();

  Future<List<dynamic>> getall(String url) => api.getall(url);

}
