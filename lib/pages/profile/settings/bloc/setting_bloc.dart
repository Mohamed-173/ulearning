import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingInitial()) {
    on<TriggerSetting>(_triggerSettings);
  }

  _triggerSettings(TriggerSetting event, Emitter<SettingState> emit) {
    emit(
      const SettingState(),
    );
  }
}
