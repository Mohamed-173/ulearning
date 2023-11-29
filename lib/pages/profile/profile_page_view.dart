import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uleaningapp/common/values/colors.dart';
import 'package:uleaningapp/pages/profile/widget/profile_page_widgets.dart';

class ProfilePageView extends StatefulWidget {
  const ProfilePageView({super.key});

  @override
  State<ProfilePageView> createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        appBar: buildProfileAppBar(),
        body: SingleChildScrollView(
          child: SizedBox(
            // width: 375.w,
            //? if you want size by default this way is reguler
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                profileIconAndEditButton(),
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.only(left: 24.w),
                  child: buildListView(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
