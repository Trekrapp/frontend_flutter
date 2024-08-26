import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trekr_second/features/presentation/widgets/profile_section/settings/widgets_imports.dart';

import '../../../../widgets/global/widgets_imports.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Notifications"),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 15.h),
        child: Column(
          children: [
            SwitchItem(title: "Activer les notifications"),
            SwitchItem(title: "Notifications par e-mail"),
          ],
        ),
      )),
    );
  }
}
