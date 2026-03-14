import 'package:flutter/material.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/core/helpers/validator.dart';
import 'package:online_exam/core/shared_widgets/custom_text_form_field.dart';
import 'package:online_exam/core/values/app_strings.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.userNameController,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.phoneController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController userNameController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,

      child: Column(
        children: [
          CustomTextFormField(

            controller: userNameController,
            type: TextFieldType.userName,
          ),
          SizedBox(height: MyResponsive.height(value: 28)),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(

                  type: TextFieldType.name,


                  controller: firstNameController,

                ),
              ),
              SizedBox(width: MyResponsive.width(value: 17)),
              Expanded(
                child: CustomTextFormField(

                  type: TextFieldType.name,


                  controller: lastNameController,

                ),
              ),
            ],
          ),
          SizedBox(height: MyResponsive.height(value: 28)),

          CustomTextFormField(


            type: TextFieldType.email,

            controller: emailController,

          ),

          SizedBox(height: MyResponsive.height(value: 28)),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  type: TextFieldType.password,
                  controller: passwordController,

                ),
              ),
              SizedBox(width: MyResponsive.width(value: 17)),
              Expanded(
                child: CustomTextFormField(

                  type: TextFieldType.password,




                  controller: confirmPasswordController,


                ),
              ),
            ],
          ),
          SizedBox(height: MyResponsive.height(value: 28)),

          CustomTextFormField(
            controller: phoneController,
            type: TextFieldType.phone,
          ),
        ],
      ),
    );
  }
}
