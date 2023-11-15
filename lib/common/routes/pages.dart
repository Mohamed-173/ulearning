// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uleaningapp/global.dart';
import 'package:uleaningapp/pages/application/application_page.dart';
import 'package:uleaningapp/pages/application/bloc/app_bloc.dart';
import 'package:uleaningapp/pages/home/bloc/home_page_bloc.dart';
import 'package:uleaningapp/pages/home/home_page_view.dart';

import 'package:uleaningapp/pages/register/bloc/register_bloc.dart';
import 'package:uleaningapp/pages/register/register_view.dart';
import 'package:uleaningapp/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:uleaningapp/pages/sign_in/sign_in.dart';
import 'package:uleaningapp/pages/welcome/blocs/welcome_bloc.dart';
import 'package:uleaningapp/pages/welcome/welcome_page_view.dart';

import 'routes.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutesName.initial,
        page: WelcomePageView(),
        bloc: BlocProvider(create: (_) => WelcomBloc()),
      ),
      PageEntity(
        route: AppRoutesName.signIn,
        page: SignIn(),
        bloc: BlocProvider(create: (_) => SignInBloc()),
      ),
      PageEntity(
        route: AppRoutesName.register,
        page: Register(),
        bloc: BlocProvider(create: (_) => RegisterBloc()),
      ),
      PageEntity(
        route: AppRoutesName.application,
        page: ApplicationPage(),
        bloc: BlocProvider(create: (_) => AppBloc()),
      ),
      PageEntity(
        route: AppRoutesName.homePageView,
        page: HomePageView(),
        bloc: BlocProvider(create: (_) => HomePageBloc()),
      ),
    ];
  }

// return all blocProviders as list
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProvider = <dynamic>[];

    for (var bloc in routes()) {
      if (bloc.bloc != null) {
        blocProvider.add(bloc.bloc);
      }
    }
    return blocProvider;
  }

  static MaterialPageRoute generateRouteSetting(RouteSettings setting) {
    if (setting.name != null) {
      var result = routes().where((element) => setting.name == element.route);
      if (result.isNotEmpty) {
        log("first log");
        bool openFirst = Global.storageServices.getDeviceFirstOpen();
        if (result.first.route == AppRoutesName.initial && openFirst) {
          var userLoggedIn = Global.storageServices.getDeviceLogedIn();
          print(userLoggedIn);
          if (userLoggedIn == true) {
            return MaterialPageRoute(
                builder: (_) => ApplicationPage(), settings: setting);
          }
          return MaterialPageRoute(builder: (_) => SignIn(), settings: setting);
        }
        if (result.first.route == AppRoutesName.register) {}
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: setting);
      }
    }

    return MaterialPageRoute(builder: (_) => SignIn(), settings: setting);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;
  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
