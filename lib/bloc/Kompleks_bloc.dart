
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/repository.dart';
import '../models/Kompleks.dart';
import 'dsk_event.dart';
import 'dsk_state.dart';

class KompleksBloc extends Bloc<DskEvent, DskState> {
  final Repository repository;

  KompleksBloc({required this.repository}) : super(DskEmtyState()) {
    on<DskLoadEvent>((event, emit) async {
      emit(DskLoadingState());
      try {
        final json = await repository.getall("kompleks/get");

        final loadedHouse = json.map((e) => Kompleks.fromJson(e)).toList();
        emit(HouseLoadedSatate(loadedHouse: loadedHouse));
      } catch (_) {
        throw Exception(DskErrorState());
      }
    });

    on<DskClearEvent>((event, emit) => emit(DskEmtyState()));
  }
}
