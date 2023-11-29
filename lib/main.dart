// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:uleaningapp/common/values/colors.dart';

import 'common/routes/routes.dart';
import 'global.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await Global.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        // its standard size
        designSize: const Size(375, 812),
        builder: (BuildContext context, Widget? child) => MaterialApp(
          theme: ThemeData(
            // primarySwatch: Colors.blue,
            appBarTheme: const AppBarTheme(
              // foreground for secondary child color like {text} and {icons}
              foregroundColor: AppColors.primaryText,
              // toolbarTextStyle: TextStyle(
              //   color: AppColors.primaryText,
              // ),
              iconTheme: IconThemeData(
                color: AppColors.primaryText,
              ),
              color: Colors.white,
              centerTitle: true,
              elevation: 0,
            ),

            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: AppColors.primaryElement),
          ),
          onGenerateRoute: AppPages.generateRouteSetting,
        ),
      ),
    );
  }
}
