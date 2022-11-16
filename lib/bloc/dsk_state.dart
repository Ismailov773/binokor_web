import '../models/Catalog.dart';
import '../models/Job.dart';
import '../models/Kompleks.dart';
import '../models/Make.dart';
import '../models/Meneger.dart';
import '../models/News.dart';

abstract class DskState {}

class DskEmtyState extends DskState {}

class DskLoadingState extends DskState {}

class DskErrorState extends DskState {}

class CatalogLoadedState extends DskState {
  List<Catalog> loadedCatalog;

  CatalogLoadedState({required this.loadedCatalog});
}

class HouseLoadedSatate extends DskState {
  List<Kompleks> loadedHouse;

  HouseLoadedSatate({required this.loadedHouse});
}

class NewsLoadedSatate extends DskState {
  List<News> loadedNews;

  NewsLoadedSatate({required this.loadedNews});
}

class JobLoadedState extends DskState {

  List<Job> loadedjods;
  JobLoadedState({required this.loadedjods});
}
