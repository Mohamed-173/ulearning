import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';

AppBar buildAppBar(
  String? title,
) {
  return AppBar(
    backgroundColor: AppColors.primaryBackground,
    foregroundColor: AppColors.primaryText,
    title: Text(
      title ?? "AppBar Title",
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        height: 1,
        color: AppColors.primarySecondaryBackground,
      ),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey.withOpacity(0.7),
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
      ),
    ),
  );
}

Widget customTextField({
  String? text,
  TextInputType? textType,
  String? iconName,
  bool? isSecure,
  Function(String value)? function,
}) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.r),
      border: Border.all(color: AppColors.primaryFourElementText),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            height: 16.w,
            width: 16.w,
            margin: EdgeInsets.only(left: 17.w, right: 10.w),
            child: Image.asset("assets/icons/${iconName ?? "user"}.png")),
        Container(
          width: 265.w,
          height: 50.h,
          child: Center(
            child: TextFormField(
              onChanged: (value) => function!(value),
              keyboardType: textType ?? TextInputType.text,
              decoration: InputDecoration(
                // suffixIcon: (isSecure ?? )
                //     ? null
                //     : isSecure!
                //         ? Icon(Icons.visibility)
                //         : Icon(Icons.visibility_off),
                border: InputBorder.none,
                hintText: text ?? "Hint Text",
                hintStyle: const TextStyle(
                  color: AppColors.primarySecondaryElementText,
                ),
              ),
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp,
                  fontFamily: "Avenir"),
              autocorrect: false,
              obscureText: isSecure ?? false,
            ),
          ),
        ),
      ],
    ),
  );
}
