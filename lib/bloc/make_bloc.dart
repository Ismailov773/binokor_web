import 'package:binokor_web/bloc/dsk_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/repository.dart';
import '../models/Make.dart';
import 'dsk_event.dart';

class MakeBloc extends Bloc<DskEvent, DskState>{
  final Repository repository;


  MakeBloc({required this.repository}): super(DskEmtyState()){

    on<DskLoadEvent>((event, emit) async {
      emit(DskLoadingState());
      try {
        final json = await repository.getall("make/get");

        final loadedMake = json.map((e) => Make.fromJson(e)).toList();
        emit(MakeLoadedState(loadedMake: loadedMake));
      } catch (_) {
        throw Exception(DskErrorState());
      }
    });

    on<DskClearEvent>((event, emit) => emit(DskEmtyState()));
  }
}