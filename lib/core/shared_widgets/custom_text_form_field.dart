import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String title;
  final String hintText;
  final TextInputType keyboardType;
  bool obscureText;
  final bool isPassword;
  final bool showPasswordToggle;
  final TextEditingController controller;
  final String? Function(String?)? myValidator;
  final bool? enabled;
  final bool isPhone;
  final double horizontalPadding;
  final double verticalPadding;
  final TextStyle? textStyle;
  final Widget? prefixIcon;

  CustomTextFormField({
    required this.title,
    required this.controller,
    required this.myValidator,
    this.horizontalPadding = 10.0,
    this.verticalPadding = 10.0,
    this.textStyle,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.isPhone = false,
    this.isPassword = false,
    this.showPasswordToggle = false,
    super.key,
    this.enabled,
    this.prefixIcon,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled ?? true,
      obscureText: widget.isPassword ? true : false,
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,

      keyboardType: widget.keyboardType,
      validator: widget.myValidator,
      decoration: InputDecoration(
        labelText: widget.title,

        contentPadding: EdgeInsets.symmetric(
          horizontal: widget.horizontalPadding,
          vertical: widget.verticalPadding,
        ),
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: (widget.isPassword && widget.showPasswordToggle)
            ? IconButton(
                icon: Icon(
                  widget.obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.baseGray,
                  size: 25,
                ),
                onPressed: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}
