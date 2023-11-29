import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uleaningapp/common/widgets/common_widgets.dart';

import '../../../../common/values/colors.dart';

AppBar buildSettingAppBar() {
  return AppBar(
    title: reusableText("Setting"),
  );
}

Widget settingButtons(BuildContext context, void Function()? func) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Sign Out Confirmation"),
              content: const Text("Please confirm Sign Out"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      color: AppColors.primaryText,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: func,
                  child: const Text(
                    "Confirm",
                    style: TextStyle(
                      color: AppColors.primaryText,
                    ),
                  ),
                ),
              ],
            );
          });
    },
    child: Container(
      child: Column(
        children: [
          Container(
            height: 100.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/icons/Logout.png",
                  ),
                  fit: BoxFit.fitHeight),
            ),
          ),
        ],
      ),
    ),
  );
}
