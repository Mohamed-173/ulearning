// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uleaningapp/common/constant/enums.dart';
import 'package:uleaningapp/common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    title: Text(
      "Log In",
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

Widget BuildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _reuseableIcon("google"),
        _reuseableIcon("apple"),
        _reuseableIcon("facebook"),
      ],
    ),
  );
}

Widget _reuseableIcon(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      height: 40.w,
      width: 40.w,
      child: Image.asset("assets/icons/$iconName.png"),
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

Widget forgetPassword() {
  return Container(
    // margin: EdgeInsets.only(left: 25.w),
    // color: Colors.red,
    // we need 12.h but 32.h for using to margin by hight by 20.h
    width: 260.w,
    height: 32.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "Forget Password",
        style: TextStyle(
          color: AppColors.primaryText,
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText,
          fontSize: 12.sp,
        ),
      ),
    ),
  );
}

Widget buildLogInAndRegButton(
  String buttonName,
  AuthButtonType buttonType,
  Function()? func,
) {
  return GestureDetector(
    onTap: func,
    child: Container(
      // margin: EdgeInsets.only(top: 40.h),
      decoration: BoxDecoration(
        color: buttonType == AuthButtonType.login
            ? AppColors.primaryElement
            : AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(15.r),
        border: buttonType == AuthButtonType.login
            //this check for if not login button dont set border
            ? null
            : Border.all(color: AppColors.primaryFourElementText),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
            color: Colors.grey.withOpacity(0.1),
          )
        ],
      ),
      width: 325.w,
      height: 35.h,
      child: Center(
          child: Text(
        buttonName,
        style: TextStyle(
          color: buttonType == AuthButtonType.login
              ? AppColors.primaryBackground
              : AppColors.primaryText,
          fontWeight: FontWeight.normal,
          fontSize: 16.sp,
        ),
      )),
    ),
  );
}
