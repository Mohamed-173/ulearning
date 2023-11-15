import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:uleaningapp/common/values/colors.dart';
import 'package:uleaningapp/pages/application/widgets/application_widgets.dart';
import 'package:uleaningapp/pages/application/bloc/app_bloc.dart';
import 'package:uleaningapp/pages/application/bloc/app_event.dart';
import 'package:uleaningapp/pages/application/bloc/app_state.dart';

class ApplicationPage extends StatefulWidget {
  ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      return Container(
        color: AppColors.primaryBackground,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.primaryBackground,
            body: buildPage(state.index),
            bottomNavigationBar: Container(
              height: 58.h,
              width: 365.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.h),
                    topRight: Radius.circular(20.h)),
                color: AppColors.primaryElement,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: AppColors.primaryBackground,
                elevation: 0,
                currentIndex: state.index,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.grey,
                onTap: (index) {
                  context.read<AppBloc>().add(TriggerAppEvent(index: index));
                },
                items: bottomTabs,
              ),
            ),
          ),
        ),
      );
    });
  }
}
