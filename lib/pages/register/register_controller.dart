import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uleaningapp/common/widgets/flutter_toast.dart';
import 'package:uleaningapp/pages/register/bloc/register_bloc.dart';

class RegisterController {
  final BuildContext context;

  RegisterController({required this.context});

  Future<void> handleRegisteration(String register) async {
    final state = context.read<RegisterBloc>().state;
    final name = state.name;
    final email = state.email;
    final password = state.password;
    final rePassword = state.rePassword;
    if (name.isEmpty) {
      toastInfo(msg: "Name can not be Empty");
      return;
    }

    if (email.isEmpty) {
      toastInfo(msg: "EMail can not be Empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password can not be Empty");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "ConfirmPassword can not be Empty");

      return;
    }
    if (password != rePassword) {
      toastInfo(msg: "your confirm password not same as password ");
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(name);
        toastInfo(
            msg:
                "an email has been sent to your register email. To activate it please check your email box and click the link.");

        if (context.mounted) Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        toastInfo(msg: "The email already in use");
      } else if (e.code == "invalid-email") {
        toastInfo(msg: "Email address not validate format");
      } else if (e.code == "operation-not-allowed") {
        toastInfo(msg: "Create Email/Password are not enabled");
      } else if (e.code == "weak-password") {
        toastInfo(msg: "The password is set is weak ");
      }
    }
  }
}
