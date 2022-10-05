
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/repository.dart';
import '../models/House.dart';
import 'dsk_event.dart';
import 'dsk_state.dart';

class HouseBloc extends Bloc<DskEvent, DskState> {
  final Repository repository;

  HouseBloc({required this.repository}) : super(DskEmtyState()) {
    on<DskLoadEvent>((event, emit) async {
      emit(DskLoadingState());
      try {
        final json = await repository.getall("house/get");

        final loadedHouse = json.map((e) => House.fromJson(e)).toList();
        emit(HouseLoadedSatate(loadedHouse: loadedHouse));
      } catch (_) {
        throw Exception(DskErrorState());
      }
    });

    on<DskClearEvent>((event, emit) => emit(DskEmtyState()));
  }
}
