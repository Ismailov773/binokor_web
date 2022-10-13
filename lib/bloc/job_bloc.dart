import 'package:binokor_web/bloc/dsk_event.dart';
import 'package:binokor_web/bloc/dsk_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/repository.dart';
import '../models/Job.dart';

class JobBloc extends Bloc<DskEvent, DskState>{

  final Repository repository;

  JobBloc({required this.repository}) : super(DskEmtyState()) {
    on<DskLoadEvent>((event, emit) async {
      emit(DskLoadingState());
      try {
        final json = await repository.getall("job/get");

        final loadedjobs = json.map((e) => Job.fromJson(e)).toList();
        emit(JobLoadedState(loadedjods: loadedjobs));
      } catch (_) {
        throw Exception(DskErrorState());
      }
    });

    on<DskClearEvent>((event, emit) => emit(DskEmtyState()));
  }
}