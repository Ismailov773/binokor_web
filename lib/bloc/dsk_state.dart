

import '../models/Catalog.dart';
import '../models/House.dart';
import '../models/Make.dart';
import '../models/Meneger.dart';

abstract class DskState {}

class DskEmtyState extends DskState {}

class DskLoadingState extends DskState {}

class DskErrorState extends DskState {}

class CatalogLoadedState extends DskState {
  List<Catalog> loadedCatalog;
  CatalogLoadedState({required this.loadedCatalog});
}

class MenegerLoadedState extends DskState {
  List<Meneger> loadedMeneger;
  MenegerLoadedState({required this.loadedMeneger});
}

class HouseLoadedSatate extends DskState{
  List<House> loadedHouse;
  HouseLoadedSatate({required this.loadedHouse});
}

class MakeLoadedState extends DskState{
  List<Make> loadedMake;

  MakeLoadedState({ required this.loadedMake});
}
