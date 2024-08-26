import 'package:flutter/material.dart';
import 'package:trekr_second/core/constants/app_colors.dart';

import '../../../../widgets/global/widgets_imports.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Langue"),
      body: SafeArea(
          child: Container(
        color: AppColors.veryLightPink.withOpacity(0.21),
        child: Column(
          children: [],
        ),
      )),
    );
  }
}
