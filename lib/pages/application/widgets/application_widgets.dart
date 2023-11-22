import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uleaningapp/pages/home/home_page_view.dart';
import 'package:uleaningapp/pages/profile/profile_page_view.dart';

import '../../../common/values/colors.dart';

Widget buildPage(int index) {
  List<Widget> _widgets = [
    //first page home page
    const HomePageView(),
    //second page
    Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 200.w,
            height: 200.h,
            child: Image.asset("assets/icons/unconst.png")),
        const Text(
          "Search",
        ),
      ],
    )),
    //third page
    Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 200.w,
            height: 200.h,
            child: Image.asset("assets/icons/unconst.png")),
        const Text("Course"),
      ],
    )),
    //fourth page
    Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 200.w,
            height: 200.h,
            child: Image.asset("assets/icons/unconst.png")),
        const Text("Chat"),
      ],
    )),
    // fifth page profile page
    const ProfilePageView()
  ];

  return _widgets[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
    label: "home",
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset("assets/icons/home.png"),
    ),
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(
        "assets/icons/home.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "search",
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset("assets/icons/search2.png"),
    ),
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(
        "assets/icons/search2.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "course",
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset("assets/icons/play-circle1.png"),
    ),
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(
        "assets/icons/play-circle1.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "chat",
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset("assets/icons/message-circle.png"),
    ),
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(
        "assets/icons/message-circle.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "profile",
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset("assets/icons/person2.png"),
    ),
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(
        "assets/icons/person2.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
];
