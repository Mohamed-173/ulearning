import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uleaningapp/common/constant/constants.dart';
import 'package:uleaningapp/common/widgets/flutter_toast.dart';
import 'package:uleaningapp/global.dart';
import 'package:uleaningapp/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;

  SignInController(this.context);

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          //
          toastInfo(msg: "You need to fill email address");
          return;
        } else {
          print("email is : $emailAddress");
        }
        if (password.isEmpty) {
          toastInfo(msg: "You need to fill password");
          return;
          //
        }
        try {
          final credentail =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
          if (credentail.user == null) {
            toastInfo(msg: "you not exist");
          }
          if (!credentail.user!.emailVerified) {
            toastInfo(msg: "You need to verifiy your email account");
            //
          }

          final user = credentail.user;
          if (user != null) {
            //we got user verifid from firebase
            print("user is exist");
            Global.storageServices
                .setString(AppConst.Storage_USER_TOKEN_KEY, "123");
            Navigator.pushNamedAndRemoveUntil(
                context, '/application', (route) => false);
          } else {
            //   we have error from getting user from firebase
            toastInfo(msg: "you are not user of this app");
          }
          log("i am last");
        } on FirebaseAuthException catch (e) {
          if (e.code == "user-not-found") {
            // print("User-Not-Found-Firebase Exciption");
            toastInfo(msg: "User-Not-Found-Firebase Exciption");
          } else if (e.code == "wrong-password") {
            // print("wrong password provided for that user");
            toastInfo(msg: "wrong password provided for that user");
          } else if (e.code == "invalid-email") {
            // print("Your email format is wrong ");
            toastInfo(msg: "Your email format is wrong");
          }
        } catch (e) {
          print(e.toString());
        }
      }
    } catch (e) {
      print("e error is :${e.toString()}");
    }
  }

  // Future<void> handleSignOut() async {
  //   await FirebaseAuth.instance.signOut();
  // }
}
