import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uleaningapp/pages/home/bloc/home_page_event.dart';
import 'package:uleaningapp/pages/home/bloc/home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageState()) {
    on<HomePageEvent>(_homePageEvent);
  }

  _homePageEvent(HomePageEvent event, Emitter<HomePageState> emit) {
    emit(
      HomePageState().copyWith(index: event.index),
    );
  }
}
