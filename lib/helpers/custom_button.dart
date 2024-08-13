import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:now_restaurant_panel/helpers/appcolors.dart';
import 'package:now_restaurant_panel/helpers/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final Color? textColor;
  final Color? borderColor;
  final dynamic width;
  final dynamic height;
  final double? fontSize;
  final bool usePrimaryColor;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.width = double.infinity,
    this.textColor,
    this.borderColor,
    this.height,
    this.usePrimaryColor = false,
    this.fontSize,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: isLoading
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: SpinKitRing(
                  lineWidth: 2.0,
                  color: usePrimaryColor ? Colors.black87 : Colors.white,
                ),
              )
            : InkWell(
                onTap: onTap,
                child: Container(
                    height: height ?? context.height / 15,
                    width: width ?? context.width / 1.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: usePrimaryColor
                            ? AppColors.primaryColor
                            : AppColors.secondaryColor,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2,
                              spreadRadius: 2,
                              offset: const Offset(0, 3),
                              color: AppColors.blackColor.withOpacity(0.1))
                        ]),
                    child: Center(
                        child: CustomTextWidget(
                      text: buttonText,
                      fontSize: fontSize ?? 14,
                      textColor: usePrimaryColor
                          ? Colors.white
                          : AppColors.primaryText,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                    ))),
              ),
      ),
    );
  }
}
