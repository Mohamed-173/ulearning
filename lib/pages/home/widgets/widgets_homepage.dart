import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uleaningapp/common/widgets/common_widgets.dart';
import 'package:uleaningapp/pages/home/bloc/home_page_bloc.dart';
import 'package:uleaningapp/pages/home/bloc/home_page_event.dart';

import '../../../common/values/colors.dart';
import '../bloc/home_page_state.dart';

AppBar buildAppBar() {
  return AppBar(
    // backgroundColor: Colors.amber,
    title: Container(
      margin: EdgeInsets.symmetric(horizontal: 7.w),
      // color: Colors.green.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/icons/person.png")),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

/// Reusable Big Text
///
///  by default the size of [heightContainer] is 24.h by package
///
/// by default the size of [fontSize] :24.sp by package
Widget homePageText(String text,
    {double marginTop = 20,
    Color color = AppColors.primaryText,
    double? fontSize,
    double? heightContainer}) {
  return Container(
    margin: EdgeInsets.only(
      top: marginTop,
    ),
    height: heightContainer ?? 24.h,
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize ?? 24.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget searchView() {
  return Container(
    height: 40.h,
    // width: 300.w,
    // color: Colors.red,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            width: 280.w,
            height: 40.h,
            decoration: BoxDecoration(
                color: AppColors.primaryBackground,
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(
                  color: AppColors.primaryThirdElementText,
                )),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 17.w),
                  height: 16.h,
                  width: 16.w,
                  child: Image.asset("assets/icons/search.png"),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5.w),
                  height: 40.h,
                  width: 240.w,
                  child: Center(child: homeTextField()),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(5.r),
            ),
            height: 40.h,
            width: 40.w,
            child: Center(
              child: Image.asset(
                "assets/icons/options.png",
                fit: BoxFit.contain,
                width: 30,
                height: 30,
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget homeTextField() {
  return Container(
    // color: Colors.red,
    height: 40.h,
    width: 240.w,
    child: TextFormField(
      onChanged: (value) {},
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: "Search Your Course",
        hintStyle: TextStyle(
          color: AppColors.primarySecondaryElementText,
        ),
      ),
      style: TextStyle(
          color: AppColors.primaryText,
          fontWeight: FontWeight.normal,
          fontSize: 14.sp,
          fontFamily: "Avenir"),
      autocorrect: false,
      // obscureText: isSecure ?? false,
    ),
  );
}

Widget SliderView(BuildContext context) {
  return BlocBuilder<HomePageBloc, HomePageState>(
    builder: (context, state) {
      return Column(
        children: [
          Container(
            height: 160.h,
            width: 325.w,
            // color: Colors.red,
            child: PageView(
              onPageChanged: (index) {
                BlocProvider.of<HomePageBloc>(context)
                    .add(HomePageEvent(index: index));
              },
              children: [
                _sliderContainer(path: "assets/icons/art.png"),
                _sliderContainer(path: "assets/icons/Image1.png"),
                _sliderContainer(path: "assets/icons/Image2.png"),
              ],
            ),
          ),
          Center(
            child: DotsIndicator(
              dotsCount: 3,
              position: state.index,
              decorator: DotsDecorator(
                activeColor: AppColors.primaryElement,
                color: AppColors.primaryThirdElementText,
                size: Size.square(5.0),
                activeSize: Size(17, 5),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          )
        ],
      );
    },
  );
}

Container _sliderContainer({String path = "assets/icons/art.png"}) {
  return Container(
    height: 160.h,
    width: 325.w,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(path),
      ),
    ),
  );
}
