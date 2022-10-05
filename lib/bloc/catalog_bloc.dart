
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/repository.dart';
import '../models/Catalog.dart';
import 'dsk_event.dart';
import 'dsk_state.dart';

class CatalogBloc extends Bloc<DskEvent, DskState> {
  final Repository repository;

  CatalogBloc({required this.repository}) : super(DskEmtyState()) {
    on<DskLoadEvent>((event, emit) async {
      emit(DskLoadingState());
      try {
        final json = await repository.getall("catalog/get");

        final loadedCatalog = json.map((e) => Catalog.fromJson(e)).toList();
        emit(CatalogLoadedState(loadedCatalog: loadedCatalog));
      } catch (_) {
        throw Exception(DskErrorState());
      }
    });

    on<DskClearEvent>((event, emit) => emit(DskEmtyState()));
  }
}
