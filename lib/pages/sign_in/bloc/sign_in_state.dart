// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_in_bloc.dart';

// @immutable
class SignInState extends Equatable {
  final String email;
  final String password;
  const SignInState({
    this.email = '',
    this.password = '',
  });
  SignInState copyWith({
    String? email,
    String? password,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [email, password];
}

// class SignInInitial extends SignInState {}
