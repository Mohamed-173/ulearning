import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uleaningapp/common/values/colors.dart';
import 'package:uleaningapp/global.dart';
import 'package:uleaningapp/pages/register/bloc/register_bloc.dart';
import 'package:uleaningapp/pages/register/bloc/register_event.dart';
import 'package:uleaningapp/pages/register/bloc/register_state.dart';
import 'package:uleaningapp/pages/register/register_controller.dart';

import '../../common/constant/enums.dart';
import '../../common/widgets/common_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return Container(
        color: AppColors.primaryBackground,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.primaryBackground,
            appBar: buildAppBar("Sign Up"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Center(
                    child: reusableText("Enter your detail & Free Sign Up"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 36.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("User Name"),
                        customTextField(
                            text: "Enter Your User names",
                            textType: TextInputType.name,
                            function: (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(NameRegisterEvent(value));
                            }),
                        reusableText("Email"),
                        customTextField(
                            text: "Enter your email address",
                            textType: TextInputType.emailAddress,
                            function: (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(EmailRegisterEvent(value));
                            }),
                        reusableText("Password"),
                        customTextField(
                            text: "Enter your Password",
                            textType: TextInputType.emailAddress,
                            isSecure: true,
                            iconName: "lock",
                            function: (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(PasswordRegisterEvent(value));
                            }),
                        reusableText("Confirm Password"),
                        customTextField(
                            text: "Enter Your Confirm Password",
                            textType: TextInputType.emailAddress,
                            isSecure: true,
                            iconName: "lock",
                            function: (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(RePasswordRegisterEvent(value));
                            }),
                        reusableText(
                            "By creating an account you have agree with our them & conditions"),
                        SizedBox(height: 35.h),
                        buildLogInAndRegButton(
                          "Register",
                          AuthButtonType.login,
                          () async {
                            // test for get back to welcome screen
                            // Global.storageServices.setFirstFalse();
                            await RegisterController(context: context)
                                .handleRegisteration("register");
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
