import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uleaningapp/pages/application/bloc/app_event.dart';
import 'package:uleaningapp/pages/application/bloc/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState()) {
    on<TriggerAppEvent>((event, emit) {
      log("${state.index}");
      emit(AppState(index: event.index));
    });
  }
}
