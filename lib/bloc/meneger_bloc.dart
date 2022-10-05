
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/repository.dart';
import '../models/Meneger.dart';
import 'dsk_event.dart';
import 'dsk_state.dart';

class MenegerBloc extends Bloc<DskEvent, DskState>{
  final Repository repository;

  MenegerBloc({required this.repository}) : super(DskEmtyState()) {
    on<DskLoadEvent>((event, emit) async {
      emit(DskLoadingState());
      try {
        final json = await repository.getall("meneger/get");

        final loadedmeneger = json.map((e) => Meneger.fromJson(e)).toList();
        emit(MenegerLoadedState(loadedMeneger: loadedmeneger));
      } catch (_) {
        throw Exception(DskErrorState());
      }
    });

    on<DskClearEvent>((event, emit) => emit(DskEmtyState()));
  }
}