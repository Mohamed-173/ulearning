import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uleaningapp/common/constant/enums.dart';
import 'package:uleaningapp/common/values/colors.dart';
import 'package:uleaningapp/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:uleaningapp/pages/sign_in/sign_in_controller.dart';
import 'package:uleaningapp/pages/sign_in/widgets/sign_in_widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        color: AppColors.primaryBackground,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.primaryBackground,
            appBar: buildAppBar(),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildThirdPartyLogin(context),
                  Center(
                    child: reusableText("Or use your email account login"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 36.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("Email"),
                        SizedBox(
                          height: 5.h,
                        ),
                        customTextField(
                            text: "Enter your email address",
                            textType: TextInputType.emailAddress,
                            function: (value) {
                              context.read<SignInBloc>().add(EmailEvent(value));
                            }),
                        reusableText("Password"),
                        SizedBox(
                          height: 5.h,
                        ),
                        customTextField(
                            text: "Enter your Password",
                            textType: TextInputType.emailAddress,
                            isSecure: true,
                            iconName: "lock",
                            function: (value) {
                              context
                                  .read<SignInBloc>()
                                  .add(PasswordEvent(value));
                            }),
                        forgetPassword(),
                        SizedBox(height: 35.h),
                        buildLogInAndRegButton(
                          "Log In",
                          AuthButtonType.login,
                          () async {
                            await SignInController(context)
                                .handleSignIn("email");
                          },
                        ),
                        SizedBox(height: 20.h),
                        buildLogInAndRegButton(
                          "Register",
                          AuthButtonType.register,
                          () {
                            Navigator.of(context).pushNamed("/register");
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
