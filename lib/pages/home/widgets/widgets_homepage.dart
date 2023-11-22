import 'dart:developer';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

Widget searchView({required BuildContext context}) {
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
                SizedBox(
                  height: 40.h,
                  width: 240.w,
                  child: Center(
                    child: homeTextField(
                      focusNode: FocusNode(),
                      onSubmet: (_) {
                        // FocusScope.of(context).requestFocus(FocusNode());
                        // FocusManager.instance.primaryFocus!.unfocus();
                        log("onSubmeted");
                      },
                    ),
                  ),
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
              borderRadius: BorderRadius.circular(15.r),
            ),
            height: 40.h,
            width: 40.w,
            child: Center(
              child: Image.asset(
                "assets/icons/options.png",
                fit: BoxFit.contain,
                width: 25,
                height: 25,
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget homeTextField({Function(String)? onSubmet, FocusNode? focusNode}) {
  return Container(
    // color: Colors.red,
    height: 40.h,
    width: 240.w,
    child: TextFormField(
      onChanged: (value) {},
      focusNode: focusNode,

      keyboardType: TextInputType.multiline,
      onFieldSubmitted: onSubmet,
      // onTap: () {
      //   print("object");
      // },

      decoration: const InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 6),
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

/// for slider view in home page with dot indicator
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

/// slider widget for less write code
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

// menw view for shoing items
Widget MenuView() {
  return Container(
    width: 325.w,
    margin: EdgeInsets.only(top: 15.h),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _reusableTextHomePage(text: "Choice your course"),
            GestureDetector(
              onTap: () {},
              child: _reusableTextHomePage(
                text: "See All",
                color: AppColors.primaryThirdElementText,
                fontSize: 12,
              ),
            ),
          ],
        ),
        Row(
          children: [
            _reusableMenuText(text: "All"),
            _reusableMenuText(
              text: "Populer",
              backgroundColor: AppColors.primaryBackground,
              textColor: AppColors.primaryThirdElementText,
            ),
            _reusableMenuText(
              text: "Newst",
              backgroundColor: AppColors.primaryBackground,
              textColor: AppColors.primaryThirdElementText,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _reusableMenuText(
    {String text = 'menuText',
    Color backgroundColor = AppColors.primaryElement,
    Color textColor = AppColors.primaryBackground}) {
  return Container(
    margin: EdgeInsets.only(top: 20.h, right: 20.w),
    child: Row(
      children: [
        Container(
          // height: 20.h,
          // width: 50.w,
          padding: EdgeInsets.only(
            bottom: 5.h,
            top: 5.h,
            left: 15.w,
            right: 15.w,
          ),
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(7.r),
              border: Border.all(
                color: backgroundColor,
                width: 1,
              )),
          child: Center(
            child: _reusableTextHomePage(
              text: text,
              color: textColor,
              fontSize: 12,
            ),
          ),
        ),
      ],
    ),
  );
}

///by default [fontSize] is 18.sp
///
/// and the font [fontWeight] is [FontWeight.bold]
Widget _reusableTextHomePage(
    {String text = 'reusableText',
    Color color = AppColors.primaryText,
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.bold}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize.sp,
    ),
  );
}

// Course Grid  View Ui
Widget courseGrid({String imagePath = "assets/icons/Image2.png"}) {
  return Container(
    padding: EdgeInsets.all(
      12.w,
    ),
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(15.r),
      image: DecorationImage(
        image: AssetImage(
          imagePath,
        ),
        fit: BoxFit.fill,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Best Course For IT and Engineering",
          // for how much line can have
          maxLines: 1,
          // if text over flow it is fade it
          overflow: TextOverflow.fade,
          // align text for left
          textAlign: TextAlign.left,
          // for not let wraping to second line
          softWrap: false,
          style: TextStyle(
            color: AppColors.primaryElementText,
            fontWeight: FontWeight.bold,
            fontSize: 12.sp,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          "Flutter Best Course",
          // for how much line can have
          maxLines: 1,
          // if text over flow it is fade it
          overflow: TextOverflow.fade,
          // align text for left
          textAlign: TextAlign.left,
          // for not let wraping to second line
          softWrap: false,
          style: TextStyle(
            color: AppColors.primaryFourElementText,
            fontWeight: FontWeight.bold,
            fontSize: 8.sp,
          ),
        ),
      ],
    ),
    // height: 100,
    // width: 100,
  );
}
