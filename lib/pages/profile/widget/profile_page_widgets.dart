import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uleaningapp/common/routes/name.dart';
import 'package:uleaningapp/common/values/colors.dart';
import 'package:uleaningapp/common/widgets/common_widgets.dart';

AppBar buildProfileAppBar() {
  return AppBar(
    title: Container(
      // padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 20.h,
            width: 20.w,
            child: Image.asset("assets/icons/menu.png"),
          ),
          reusableText("Profile"),
          SizedBox(
            height: 20.h,
            width: 20.w,
            child: Image.asset("assets/icons/more-vertical.png"),
          ),
        ],
      ),
    ),
  );
}

// profile edit button
Widget profileIconAndEditButton() {
  return Container(
    padding: EdgeInsets.only(
      right: 6.w,
    ),
    width: 80.w,
    height: 80.h,
    alignment: Alignment.bottomRight,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.w),
      image: const DecorationImage(
        image: AssetImage(
          "assets/icons/headpic.png",
        ),
      ),
    ),
    child: Image(
      height: 25.h,
      width: 25.w,
      image: const AssetImage(
        "assets/icons/edit_3.png",
      ),
    ),
  );
}

var imageInfo = <String, String>{
  "Settings": "settings.png",
  "Payment details": "credit-card.png",
  "Achievement": "award.png",
  "Love": "heart(1).png",
  "Remainders": "cube.png",
};
// list view setting
Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
        imageInfo.length,
        (index) => GestureDetector(
          //  GestureDetector not workin in empty place container to fix this use behavior
          behavior: HitTestBehavior.translucent,
          onTap: () {
            if (index == 0) {
              Navigator.pushNamed(
                context,
                AppRoutesName.settingPage,
              );
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 10.h),
            // color: Colors.amber,
            padding: EdgeInsets.only(bottom: 15.h),
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  padding: const EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.primaryElement,
                  ),
                  child: Image.asset(
                    "assets/icons/${imageInfo.values.elementAt(index)}",
                  ),
                ),
                SizedBox(width: 15.w),
                reusableText(
                  imageInfo.keys.elementAt(index),
                ),
              ],
            ),
          ),
        ),
      )
    ],
  );
}
