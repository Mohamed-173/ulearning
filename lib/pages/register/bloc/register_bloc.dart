import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uleaningapp/pages/register/bloc/register_event.dart';
import 'package:uleaningapp/pages/register/bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<NameRegisterEvent>(_nameRegisterEvent);
    on<EmailRegisterEvent>(_emailRegisterEvent);
    on<PasswordRegisterEvent>(_passwordRegisterEvent);
    on<RePasswordRegisterEvent>(_rePasswordRegisterEvent);
  }

  void _nameRegisterEvent(
      NameRegisterEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(name: event.name));
  }

  void _emailRegisterEvent(
      EmailRegisterEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordRegisterEvent(
      PasswordRegisterEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _rePasswordRegisterEvent(
      RePasswordRegisterEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(rePassword: event.rePassword));
  }
}
