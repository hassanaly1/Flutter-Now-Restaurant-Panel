import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:now_restaurant_panel/helpers/appcolors.dart';
import 'package:now_restaurant_panel/helpers/custom_button.dart';
import 'package:now_restaurant_panel/helpers/custom_text.dart';
import 'package:now_restaurant_panel/helpers/heading_and_textfield.dart';
import 'package:now_restaurant_panel/helpers/snackbars.dart';
import 'package:now_restaurant_panel/helpers/validator.dart';
import 'package:now_restaurant_panel/views/auth/login.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  final _signupKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero)
        .animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Start the animation
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: context.isLandscape
          ? Row(
              children: [
                Expanded(flex: 2, child: _logo()),
                Expanded(child: _login()),
              ],
            )
          : Column(
              children: [
                Expanded(child: _logo()),
                Expanded(flex: 2, child: _login()),
              ],
            ),
    );
  }

  Widget _logo() {
    return Container(
      color: AppColors.primaryColor,
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomTextWidget(
                  text: 'Optimize Your Restaurant Operations',
                  fontSize: 26.0,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w700,
                  textColor: Colors.white,
                ),
                const SizedBox(height: 16),
                AnimatedTextKit(
                  repeatForever: true,
                  isRepeatingAnimation: true,
                  animatedTexts: [
                    TyperAnimatedText(
                      'Analyze Sales Data and Performance Metrics',
                      textStyle: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    TyperAnimatedText(
                      'Efficiently Manage Orders and Deliveries',
                      textStyle: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    TyperAnimatedText(
                      'Create and Track Promotions Seamlessly',
                      textStyle: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                context.isLandscape
                    ? Image.asset('assets/images/auth-logo.png')
                    : Image.asset(
                        'assets/images/auth-logo.png',
                        height: 100,
                        width: 100,
                      )
              ],
            ),
          )),
    );
  }

  Widget _login() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _signupKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/app-logo.png',
                ),
                HeadingAndTextfield(
                  title: 'Restaurant Name',
                  controller: TextEditingController(),
                  validator: (p0) => AppValidator.validateEmptyText(
                    fieldName: 'Restaurant Name',
                    value: p0,
                  ),
                ),
                const SizedBox(height: 16),
                HeadingAndTextfield(
                  title: 'Email',
                  controller: TextEditingController(),
                  validator: (p0) => AppValidator.validateEmail(
                    value: p0,
                  ),
                ),
                const SizedBox(height: 16),
                HeadingAndTextfield(
                  title: 'Password',
                  controller: TextEditingController(),
                  validator: (p0) => AppValidator.validatePassword(
                    value: p0,
                  ),
                ),
                const SizedBox(height: 10.0),
                HeadingAndTextfield(
                    title: 'Confirm Password',
                    controller: TextEditingController(),
                    validator: (p0) => AppValidator.validatePassword(
                          value: p0,
                        )),
                const SizedBox(height: 10.0),
                CustomButton(
                  buttonText: 'Register',
                  usePrimaryColor: true,
                  onTap: () {
                    if (_signupKey.currentState!.validate()) {
                      Get.to(() => const LoginScreen(),
                          transition: Transition.fadeIn);
                      MySnackBarsHelper.showMessage(
                          'Please Login to continue',
                          'Account Created Successfully',
                          CupertinoIcons.check_mark_circled_solid);
                    }
                  },
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const LoginScreen(),
                        transition: Transition.size,
                        duration: const Duration(seconds: 1));
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: '',
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Already have an account?',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          mouseCursor: WidgetStateMouseCursor.clickable,
                          text: ' Login',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
