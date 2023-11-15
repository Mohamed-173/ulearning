abstract class RegisterEvent {
  RegisterEvent();
}

class NameRegisterEvent extends RegisterEvent {
  final String name;
  NameRegisterEvent(this.name);
}

class EmailRegisterEvent extends RegisterEvent {
  final String email;
  EmailRegisterEvent(this.email);
}

class PasswordRegisterEvent extends RegisterEvent {
  final String password;
  PasswordRegisterEvent(this.password);
}

class RePasswordRegisterEvent extends RegisterEvent {
  final String rePassword;
  RePasswordRegisterEvent(this.rePassword);
}
