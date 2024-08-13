import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:now_restaurant_panel/helpers/custom_text.dart';
import 'package:now_restaurant_panel/helpers/tabbar.dart';

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
                    // alignment: Alignment.center,
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
              const CustomTabBar(
                title1: 'All',
                title2: 'Recent',
                title3: 'Cancelled',
              ),
              const SizedBox(height: 12.0),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  padding: const EdgeInsets.all(4.0),
                  height: 50,
                  // alignment: Alignment.center,
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
                          CupertinoButton(
                            child: const Icon(CupertinoIcons.add),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const Divider(),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Wrap(
                            spacing: 8.0, // horizontal spacing between items
                            runSpacing: 8.0, // vertical spacing between items
                            children: List.generate(20, (index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 180,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(16.0),
                                            topRight: Radius.circular(16.0)),
                                        border:
                                            Border.all(color: Colors.black12),
                                        image: const DecorationImage(
                                          image: NetworkImage(
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgy4fA6FcmVFonQAeLKnoscu8yL3xKoSLJyQ&s',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 70,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        border:
                                            Border.all(color: Colors.black12),
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(16.0),
                                            bottomRight: Radius.circular(16.0)),
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
                      )
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
