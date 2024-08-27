import 'package:flutter/material.dart';
import 'package:now_restaurant_panel/main.dart';

class CustomTabBar extends StatelessWidget {
  final String? title1;
  final String? title2;
  final String? title3;
  final void Function(int)? onTap;

  const CustomTabBar({
    super.key,
    this.title1,
    this.title2,
    this.title3,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.all(4.0),
      height: 50,
      // alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: Colors.black12)),
      child: TabBar(
        onTap: onTap,

        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: canvasColor,
        ),
        labelStyle: const TextStyle(
            fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'poppins'),
        labelColor: Colors.white,
        unselectedLabelColor: scaffoldBackgroundColor,
        indicatorSize: TabBarIndicatorSize.tab,
        // isScrollable: true,
        // tabAlignment: TabAlignment.center,
        tabs: [
          Tab(text: title1),
          Tab(text: title2),
          if (title3 != null) Tab(text: title3),
        ],
      ),
    );
  }
}
