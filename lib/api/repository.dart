

import '../models/Catalog.dart';
import 'api.dart';

class Repository {
  final Api api = Api();

  Future<List<dynamic>> getall(String url) => api.getall(url);

  // Future<List<ImageCatalog>> getimagecatalog(String id) => api.getImageCatalog(id);
}
