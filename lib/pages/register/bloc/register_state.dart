class RegisterState {
  final String name;
  final String email;
  final String password;
  final String rePassword;

  const RegisterState({
    this.name = '',
    this.email = '',
    this.password = '',
    this.rePassword = '',
  });

  RegisterState copyWith({
    String? name,
    String? email,
    String? password,
    String? rePassword,
  }) {
    return RegisterState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
    );
  }
}
