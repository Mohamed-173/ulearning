import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uleaningapp/common/constant/constants.dart';
import 'package:uleaningapp/common/values/colors.dart';
import 'package:uleaningapp/global.dart';
import 'package:uleaningapp/main.dart';
import 'package:uleaningapp/pages/welcome/blocs/welcom_event.dart';

import 'blocs/welcom_state.dart';
import 'blocs/welcome_bloc.dart';

class WelcomePageView extends StatefulWidget {
  const WelcomePageView({super.key});

  @override
  State<WelcomePageView> createState() => _WelcomePageViewState();
}

class _WelcomePageViewState extends State<WelcomePageView> {
  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryBackground,
      child: Scaffold(
        body: BlocBuilder<WelcomBloc, WelcomState>(
          builder: (context, state) {
            return Container(
              color: AppColors.primaryBackground,
              margin: EdgeInsets.only(top: 45.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      BlocProvider.of<WelcomBloc>(context)
                          .add(UpdateValueEvent(newValue: index));
                    },
                    children: [
                      _page(
                        index: 1,
                        context: context,
                        buttonName: "next",
                        title: "First See Learning",
                        subTitle:
                            "Forget about a for of papaer all knowlidge in one learning ",
                        imagePath: "assets/images/reading.png",
                      ),
                      _page(
                        index: 2,
                        context: context,
                        buttonName: "next",
                        title: "Connect With Everyone",
                        subTitle:
                            "Always keep in touch with your tutor & Friend. Let's get connected!",
                        imagePath: "assets/images/man.png",
                      ),
                      _page(
                        index: 3,
                        context: context,
                        buttonName: "get Started",
                        title: "Always Fascinated Learning",
                        subTitle:
                            "Anywhere, anytime. the time is your discretion so study whenever you want",
                        imagePath: "assets/images/boy.png",
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 90.h,
                    child: DotsIndicator(
                      onTap: (index) {
                        pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.decelerate,
                        );
                      },
                      position: state.page,
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                        color: AppColors.primaryThirdElementText,
                        activeColor: AppColors.primaryElement,
                        size: const Size.square(8.0),
                        activeSize: const Size(18.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _page({
    int? index,
    required BuildContext context,
    String? buttonName,
    String? title,
    String? subTitle,
    String? imagePath,
  }) {
    return Column(
      children: [
        SizedBox(
            width: 345.w,
            height: 345.w,
            child: Image.asset(
              imagePath!,
              fit: BoxFit.cover,
            )),
        Container(
          child: Text(
            title ?? "Title",
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            subTitle ?? "SubTitle",
            style: TextStyle(
              color: AppColors.primarySecondaryElementText,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index! < 3) {
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate);
            } else {
              //! jump to new Page
              Global.storageServices
                  .setBool(AppConst.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              print("value is ${Global.storageServices.getDeviceFirstOpen()}");

              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/sign_in", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 75.h, right: 25.w, left: 25.w),
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.all(
                  Radius.circular(15.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  )
                ]),
            child: Center(
              child: Text(
                buttonName ?? "buttonName",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
