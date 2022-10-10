import 'dart:convert';

import 'package:binokor_web/bloc/dsk_event.dart';
import 'package:binokor_web/bloc/dsk_state.dart';
import 'package:binokor_web/models/News.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/repository.dart';

class NewsBloc extends Bloc<DskEvent, DskState> {
  final Repository repository;

  NewsBloc({required this.repository}) : super(DskEmtyState()) {
    on<DskLoadEvent>((event, emit) async {
      emit(DskLoadingState());
      try {
        final json = await repository.getall("news/get");
        final loadednews = json.map((e) => News.fromJson(e)).toList();
        emit(NewsLoadedSatate(loadedNews: loadednews));
      } catch (_) {
        throw Exception(DskErrorState());
      }
    });
    on<DskClearEvent>((event, emit) => emit(DskEmtyState()));
  }


}
