import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastInfo({
  required String msg,
  Color backgroundColor = Colors.black,
  Color textColor = Colors.white,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    backgroundColor: backgroundColor,
    textColor: textColor,
    timeInSecForIosWeb: 1,
    gravity: ToastGravity.TOP,
    fontSize: 12.sp,
  );
}
