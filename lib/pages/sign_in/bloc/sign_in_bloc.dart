// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    // log("the email event is : ${event.email}");
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    // log("the password event is : ${event.password}");
    emit(state.copyWith(password: event.password));
  }
}
