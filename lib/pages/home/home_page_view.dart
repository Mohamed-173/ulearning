import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uleaningapp/common/values/colors.dart';
import 'package:uleaningapp/pages/home/widgets/widgets_homepage.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.primaryBackground,
          appBar: buildAppBar(),
          body: Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // first child  big text
                homePageText(
                  "Hello",
                  color: AppColors.primaryThirdElementText,
                ),
                //second child  big text
                homePageText(
                  "Mohamed",
                  marginTop: 5.h,
                ),
                SizedBox(
                  height: 20.h,
                ),
                //third child search view
                searchView(),
                SizedBox(
                  height: 20.h,
                ),
                SliderView(context),
                MenuView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
