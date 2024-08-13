import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:now_restaurant_panel/helpers/appcolors.dart';

class ReUsableTextField extends StatelessWidget {
  final String hintText;
  final bool? readOnly;
  final VoidCallback? onTap;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool showBackgroundShadow;
  final bool showDeleteIcon;
  final VoidCallback? onDelete;

  const ReUsableTextField({
    super.key,
    required this.hintText,
    this.onTap,
    this.readOnly,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.keyboardType,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.showBackgroundShadow = true,
    this.showDeleteIcon = false,
    this.onDelete,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height / 21,
      width: context.width / 1,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(25), boxShadow: [
        BoxShadow(
            blurRadius: 2,
            spreadRadius: 3,
            offset: const Offset(0, 1),
            color: AppColors.blackColor.withOpacity(0.1))
      ]),
      child: TextFormField(
        readOnly: readOnly ?? false,
        onTap: onTap,
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        maxLines: maxLines,
        obscureText: obscureText,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: AppColors.textColor,
        ),
        keyboardType: keyboardType,
        inputFormatters: [
          if (keyboardType == TextInputType.number)
            FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.symmetric(vertical: 4.0),
          // isCollapsed: true,
          filled: true,
          fillColor: AppColors.fieldColor,
          isDense: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: AppColors.transparent)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: AppColors.transparent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: AppColors.transparent)),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: AppColors.lightTextColor,
          ),
          errorStyle: const TextStyle(
            fontSize: 8.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
