import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uleaningapp/common/constant/constants.dart';
import 'package:uleaningapp/common/routes/name.dart';
import 'package:uleaningapp/common/values/colors.dart';
import 'package:uleaningapp/global.dart';
import 'package:uleaningapp/pages/profile/settings/bloc/setting_bloc.dart';
import 'package:uleaningapp/pages/profile/settings/widgets/setting_widgets.dart';

import '../../application/bloc/app_bloc.dart';
import '../../application/bloc/app_event.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  void removingUser() {
    Global.storageServices.removeUser(AppConst.Storage_USER_TOKEN_KEY);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutesName.signIn, (route) => false);
    context.read<AppBloc>().add(TriggerAppEvent(index: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: buildSettingAppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingBloc, SettingState>(
          builder: (context, state) {
            return settingButtons(context, () => removingUser());
          },
        ),
      ),
    );
  }
}
