import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:now_restaurant_panel/helpers/appcolors.dart';
import 'package:now_restaurant_panel/helpers/custom_button.dart';
import 'package:now_restaurant_panel/helpers/custom_text.dart';
import 'package:now_restaurant_panel/helpers/heading_and_textfield.dart';
import 'package:now_restaurant_panel/helpers/tabbar.dart';
import 'package:now_restaurant_panel/main.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTextWidget(
                  text: 'Profile',
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                ),
                const Divider(),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: context.height * 0.03,
                      horizontal: context.width * 0.25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: context.height * 0.05),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 45,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(
                                'https://bcassetcdn.com/public/blog/wp-content/uploads/2019/07/18094837/golden-eatery.png'),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: scaffoldBackgroundColor,
                                  border: Border.all(
                                      color: Colors.black12, width: 1.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.edit,
                                    color: AppColors.whiteColor,
                                    size: 15,
                                  ),
                                ),
                              ))
                        ],
                      ),
                      const SizedBox(height: 12.0),
                      const CustomTextWidget(
                        text: 'Golder Eatery',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 2.0),
                      CustomTextWidget(
                        text: 'goldereatery@restaurant.com',
                        fontSize: 14,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        textColor: AppColors.lightTextColor,
                      ),
                      const SizedBox(height: 12.0),
                      const CustomTabBar(
                          title1: 'Profile', title2: 'Change Password'),
                      SizedBox(
                        height: context.height * 0.7,
                        child: TabBarView(
                          children: [
                            ProfileSectionView(context),
                            ChangePasswordSectionView(context),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget ProfileSectionView(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        const HeadingAndTextfield(
          title: 'First Name',
          hintText: 'Golden',
          // validator: (p0) => AppValidator.validateEmptyText(
          //   fieldName: 'Current Password',
          //   value: p0,
          // ),
        ),
        const HeadingAndTextfield(
          title: 'Last Name',
          hintText: 'Eatery',
          // validator: (p0) => AppValidator.validateEmptyText(
          //   fieldName: 'Current Password',
          //   value: p0,
          // ),
        ),
        const HeadingAndTextfield(
          title: 'Email',
          hintText: 'goldereatery@restaurant.com',
          // validator: (p0) => AppValidator.validateEmptyText(
          //   fieldName: 'Current Password',
          //   value: p0,
          // ),
        ),
        CustomButton(
          buttonText: 'Update',
          onTap: () {},
          usePrimaryColor: true,
          textColor: Colors.black87,
        ),
        CustomButton(
          buttonText: 'Logout',
          textColor: Colors.white60,
          onTap: () {},
        ),
      ],
    ),
  );
}

Widget ChangePasswordSectionView(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: context.height * 0.03,
              horizontal: context.width * 0.01),
          child: Form(
            child: Column(
              children: [
                const CustomTextWidget(
                  text: 'Change Password',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 22.0),
                const HeadingAndTextfield(
                  title: 'Current Password',
                  // validator: (p0) => AppValidator.validateEmptyText(
                  //   fieldName: 'Current Password',
                  //   value: p0,
                  // ),
                ),
                const HeadingAndTextfield(
                  title: 'New Password',
                  // validator: (p0) => AppValidator.validateEmptyText(
                  //   fieldName: 'New Password',
                  //   value: p0,
                  // ),
                ),
                const HeadingAndTextfield(
                  title: 'Confirm New Password',
                  // validator: (p0) => AppValidator.validateEmptyText(
                  //   fieldName: 'Confirm New Password',
                  //   value: p0,
                  // ),
                ),
                CustomButton(
                  buttonText: 'Change Password',
                  onTap: () async {},
                  usePrimaryColor: true,
                  textColor: Colors.black87,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
