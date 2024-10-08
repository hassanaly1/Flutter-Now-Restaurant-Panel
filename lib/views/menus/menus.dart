import 'dart:math' as math;
import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:now_restaurant_panel/helpers/appcolors.dart';
import 'package:now_restaurant_panel/helpers/custom_button.dart';
import 'package:now_restaurant_panel/helpers/custom_text.dart';
import 'package:now_restaurant_panel/helpers/heading_and_textfield.dart';
import 'package:now_restaurant_panel/helpers/reusable_container.dart';
import 'package:now_restaurant_panel/views/menus/menus_detail.dart';

class MyMenuScreen extends StatelessWidget {
  const MyMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTextWidget(
                text: 'Menu Management',
                fontSize: 22.0,
                fontWeight: FontWeight.w500,
              ),
              const Divider(),
              const SizedBox(height: 12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 250,
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
                            fontFamily: 'Poppins',
                            fontSize: 12.0,
                            color: Colors.black45),
                        prefixIcon: Icon(CupertinoIcons.search),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(CupertinoIcons.add),
                    onPressed: () => openAddMenuDialog(context),
                  ),
                ],
              ),
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
                      const CustomTextWidget(
                        text: 'Menus',
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                      ),
                      const Divider(),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: List.generate(20, (index) {
                              return OpenContainer(
                                openColor: Colors.transparent,
                                closedColor: Colors.transparent,
                                transitionDuration:
                                    const Duration(milliseconds: 500),
                                closedBuilder: (context, action) => InkWell(
                                  onTap: action,
                                  child: CustomMenuWidget(index: index),
                                ),
                                openBuilder: (context, action) {
                                  return const MenusDetailScreen();
                                },
                                openElevation: 0,
                                closedElevation: 0,
                                closedShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
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

class CustomMenuWidget extends StatelessWidget {
  final int index;

  const CustomMenuWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
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
                  borderRadius: const BorderRadius.only(
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
                    onTap: () => openAddMenuDialog(context),
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white70),
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
              border: Border.all(color: Colors.black12),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: 'Menu ${index + 1}',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 8.0),
                  CustomTextWidget(
                    text: 'Price: \$${math.Random().nextInt(100)}',
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
                        text: 'Reviews: ',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                      const SizedBox(width: 2.0),
                      Row(
                        children: List.generate(5, (index) {
                          return const Icon(
                            Icons.star,
                            size: 14.0,
                            color: Colors.amber,
                          );
                        }),
                      ),
                    ],
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
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color: Colors.green.shade300,
                          borderRadius: BorderRadius.circular(8.0),
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
                    MyDottedBorderContainer(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/upload.png',
                              height: 150,
                              width: 200,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    const HeadingAndTextfield(title: 'Menu Name'),
                    const HeadingAndTextfield(title: 'Menu Price'),
                    const HeadingAndTextfield(title: 'Category'),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTextWidget(
                            text: 'Status',
                            fontWeight: FontWeight.w500,
                            maxLines: 2,
                            fontSize: 12,
                          ),
                          ReUsableContainer(
                            verticalPadding: context.height * 0.012,
                            child: DropdownButton<String>(
                              isExpanded: true,
                              underline: const SizedBox.shrink(),
                              value: 'Active',
                              items: const [
                                DropdownMenuItem(
                                  value: 'Active',
                                  child: CustomTextWidget(
                                    text: 'Active',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'In Active',
                                  child: CustomTextWidget(
                                    text: 'In Active',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                              onChanged: (value) {},
                              borderRadius: BorderRadius.circular(4.0),
                              dropdownColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
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

class MyDottedBorderContainer extends StatelessWidget {
  final Widget child;
  final BorderRadius borderRadius;

  const MyDottedBorderContainer(
      {super.key, required this.child, this.borderRadius = BorderRadius.zero});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DottedBorderPainter(borderRadius: borderRadius),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: child,
      ),
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  final BorderRadius borderRadius;

  DottedBorderPainter({required this.borderRadius});

  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 4.0;
    double dashSpace = 3.0;
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final RRect outer =
        borderRadius.toRRect(Rect.fromLTWH(0, 0, size.width, size.height));
    final Path path = Path()..addRRect(outer);

    PathMetrics pathMetrics = path.computeMetrics();
    for (PathMetric pathMetric in pathMetrics) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        final tangent = pathMetric.getTangentForOffset(distance);
        final offset = tangent!.position;
        final end =
            pathMetric.getTangentForOffset(distance + dashWidth)?.position ??
                tangent.position;
        canvas.drawLine(offset, end, paint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
