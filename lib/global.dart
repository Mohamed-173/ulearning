import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uleaningapp/common/services/storage_services.dart';

class Global {
  static late StorageServices storageServices;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    storageServices = await StorageServices().init();
    // FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //   if (user == null) {
    //     print('User is currently signed out!');
    //   } else {
    //     print('User is signed in!${user.uid}');
    //   }
    // });
  }
}
