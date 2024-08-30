import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trekr_second/core/utils/helpers/validation.dart';
import 'package:trekr_second/features/presentation/cubit/user/change_password/change_password_cubit.dart';
import 'package:trekr_second/features/presentation/widgets/global/widgets_imports.dart';

import '../../../../widgets/profile_section/profile/widgets_imports.dart';
import '../../../../widgets/profile_section/settings/widgets_imports.dart';

class ModifyPasswordScreen extends StatefulWidget {
  const ModifyPasswordScreen({super.key});

  @override
  State<ModifyPasswordScreen> createState() => _ModifyPasswordScreenState();
}

class _ModifyPasswordScreenState extends State<ModifyPasswordScreen> {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Modifier mot de passe"),
      body: BlocListener<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordFailure) {
            // Show a snackbar with the error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message), // Display the error message
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is ChangePasswordLoaded) {
            // Optionally, handle success state
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Mot de passe modifié avec succès!'),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 15.w, top: 80.h, right: 15.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldChangePassword(
                    controller: oldPasswordController,
                    hintText: 'Ancien mot de passe',
                    validator: Validators.oldPasswordValidator,
                    obscureText: isShow,
                    onPressed: () {
                      setState(() {
                        isShow = !isShow;
                      });
                    },
                    isSuffix: true,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFieldChangePassword(
                    controller: newPasswordController,
                    hintText: 'Nouveau mot de passe',
                    validator: Validators.newPasswordValidator,
                    obscureText: isShow,
                    onPressed: () {
                      setState(() {
                        isShow = !isShow;
                      });
                    },
                    isSuffix: true,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  ManagementProfileButton(
                    textButton: "Modifier mot de passe",
                    onPressed: () => changePassword(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void changePassword() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<ChangePasswordCubit>(context)
          .resetPassword(
            oldPassword: oldPasswordController.text,
            newPassword: newPasswordController.text,
          )
          .then((value) => _clear());
    }
  }

  void _clear() {
    oldPasswordController.clear();
    newPasswordController.clear();
  }
}
