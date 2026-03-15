import 'package:flutter/material.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/core/shared_widgets/custom_text_form_field.dart';
import 'package:online_exam/features/auth/presention/manager/register/register_cubit.dart';
import 'package:online_exam/features/auth/presention/manager/register/register_events.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
    required this.formKey,
    required this.registerCubit,
  });

  final GlobalKey<FormState> formKey;
  final RegisterCubit registerCubit;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: registerCubit.userNameController,
            type: TextFieldType.userName,
            onChanged: (_) => registerCubit.doEvents(RegisterValidateForm()),
          ),
          SizedBox(height: MyResponsive.height(value: 28)),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  controller: registerCubit.firstNameController,
                  type: TextFieldType.name,
                  isFirstName: true,
                  onChanged: (_) =>
                      registerCubit.doEvents(RegisterValidateForm()),
                ),
              ),
              SizedBox(width: MyResponsive.width(value: 17)),
              Expanded(
                child: CustomTextFormField(
                  controller: registerCubit.lastNameController,
                  type: TextFieldType.name,
                  onChanged: (_) =>
                      registerCubit.doEvents(RegisterValidateForm()),
                ),
              ),
            ],
          ),
          SizedBox(height: MyResponsive.height(value: 28)),
          CustomTextFormField(
            controller: registerCubit.emailController,
            type: TextFieldType.email,
            onChanged: (_) => registerCubit.doEvents(RegisterValidateForm()),
          ),
          SizedBox(height: MyResponsive.height(value: 28)),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  controller: registerCubit.passwordController,
                  type: TextFieldType.password,
                  onChanged: (_) =>
                      registerCubit.doEvents(RegisterValidateForm()),
                ),
              ),
              SizedBox(width: MyResponsive.width(value: 17)),
              Expanded(
                child: CustomTextFormField(
                  controller: registerCubit.confirmPasswordController,
                  type: TextFieldType.password,
                  passController: registerCubit.passwordController,
                  onChanged: (_) =>
                      registerCubit.doEvents(RegisterValidateForm()),
                ),
              ),
            ],
          ),
          SizedBox(height: MyResponsive.height(value: 28)),
          CustomTextFormField(
            controller: registerCubit.phoneController,
            type: TextFieldType.phone,
            onChanged: (_) => registerCubit.doEvents(RegisterValidateForm()),
          ),
        ],
      ),
    );
  }
}
