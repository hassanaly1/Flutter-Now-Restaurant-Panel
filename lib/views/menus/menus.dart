import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:now_restaurant_panel/helpers/appcolors.dart';
import 'package:now_restaurant_panel/helpers/custom_button.dart';
import 'package:now_restaurant_panel/helpers/custom_text.dart';
import 'package:now_restaurant_panel/helpers/heading_and_textfield.dart';

class MyMenuScreen extends StatelessWidget {
  const MyMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomTextWidget(
                    text: 'Menu Management',
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                  ),
                  Container(
                    width: 300,
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    padding: const EdgeInsets.all(4.0),
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(color: Colors.black12)),
                    child: TextFormField(
                      style: const TextStyle(fontFamily: 'Poppins'),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search Menu',
                        hintStyle: TextStyle(
                            fontFamily: 'Poppins', color: Colors.black45),
                        prefixIcon: Icon(CupertinoIcons.search),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(),
              // const CustomTabBar(
              //   title1: 'All',
              //   title2: 'Recent',
              //   title3: 'Cancelled',
              // ),
              const SizedBox(height: 12.0),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  padding: const EdgeInsets.all(4.0),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CupertinoButton(
                            onPressed: null,
                            child: Icon(
                              CupertinoIcons.add,
                              color: Colors.transparent,
                            ),
                          ),
                          const CustomTextWidget(
                            text: 'Menus',
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500,
                          ),
                          IconButton(
                            icon: const Icon(CupertinoIcons.add),
                            onPressed: () => openAddMenuDialog(context),
                          ),
                        ],
                      ),
                      const Divider(),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: List.generate(20, (index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: 180,
                                          width: 200,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(16.0),
                                              topRight: Radius.circular(16.0),
                                            ),
                                            border: Border.all(
                                              color: Colors.black12,
                                            ),
                                            image: const DecorationImage(
                                              image: NetworkImage(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgy4fA6FcmVFonQAeLKnoscu8yL3xKoSLJyQ&s',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            top: 8.0,
                                            right: 8.0,
                                            child: InkWell(
                                              onTap: () {},
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white70),
                                                child: Icon(
                                                  Icons.edit,
                                                  color: AppColors.primaryColor,
                                                  size: 16.0,
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                    Container(
                                      width: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        border:
                                            Border.all(color: Colors.black12),
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(16.0),
                                          bottomRight: Radius.circular(16.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomTextWidget(
                                              text: 'Menu ${index + 1}',
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            const SizedBox(height: 8.0),
                                            CustomTextWidget(
                                              text:
                                                  'Price: \$${math.Random().nextInt(100)}',
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            const SizedBox(height: 8.0),
                                            const CustomTextWidget(
                                              text: 'Category: Chinese',
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            const SizedBox(height: 8.0),
                                            Row(
                                              children: [
                                                const CustomTextWidget(
                                                  text: 'Status: ',
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(6.0),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        Colors.green.shade300,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: const CustomTextWidget(
                                                    text: 'Active',
                                                    fontSize: 10.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
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
    );
  }
}

void openAddMenuDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Dismiss',
    transitionDuration: const Duration(milliseconds: 100),
    pageBuilder: (context, animation, secondaryAnimation) =>
        const SizedBox.shrink(),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
        child: FadeTransition(
          opacity: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
          child: Center(
            child: AlertDialog(
              scrollable: true,
              backgroundColor: Colors.transparent,
              content: Container(
                width: 500,
                padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: MediaQuery.of(context).size.height * 0.04),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromRGBO(255, 220, 105, 0.4),
                      Color.fromRGBO(86, 127, 255, 0.4),
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2.0,
                      spreadRadius: 3.0,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    CustomTextWidget(
                      text: 'Add Menu',
                      textColor: AppColors.textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                    ),
                    const SizedBox(height: 12.0),
                    const HeadingAndTextfield(title: 'Menu Name'),
                    const HeadingAndTextfield(title: 'Menu Price'),
                    const HeadingAndTextfield(title: 'Category'),
                    Row(
                      children: [
                        Flexible(
                          child: CustomButton(
                            buttonText: 'Add',
                            usePrimaryColor: true,
                            onTap: () {},
                          ),
                        ),
                        Flexible(
                          child: CustomButton(
                            buttonText: 'Cancel',
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
