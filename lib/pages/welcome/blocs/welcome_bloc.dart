import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uleaningapp/pages/welcome/blocs/welcom_event.dart';
import 'package:uleaningapp/pages/welcome/blocs/welcom_state.dart';

class WelcomBloc extends Bloc<WelcomEvent, WelcomState> {
  WelcomBloc() : super(WelcomState()) {
    // log(state.page.toString());
    on<UpdateValueEvent>((event, emit) {
      state.page = event.newValue;
      // log(state.page.toString());
      emit(WelcomState(page: state.page));
    });
  }
}
