import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:now_restaurant_panel/helpers/custom_text.dart';
import 'package:now_restaurant_panel/main.dart';

class MenusDetailScreen extends StatefulWidget {
  const MenusDetailScreen({super.key});

  @override
  State<MenusDetailScreen> createState() => _MenusDetailScreenState();
}

class _MenusDetailScreenState extends State<MenusDetailScreen> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: scaffoldBackgroundColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(color: Colors.black12),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomTextWidget(
                  text: 'Menu Name',
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                ),
                const Divider(),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Expanded(child: MyMenuImage()),
                    const SizedBox(width: 12.0),
                    TodaysOrdersStats(valueNotifier: _valueNotifier),
                  ],
                ),
                const SizedBox(height: 12.0),
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 1100) {
                      return const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: 2, child: AllReviewsSection()),
                          Expanded(flex: 1, child: RecentActivities()),
                        ],
                      );
                    } else {
                      return const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AllReviewsSection(),
                          RecentActivities(),
                        ],
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RecentActivities extends StatelessWidget {
  const RecentActivities({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 500,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextWidget(text: 'Recent Activity'),
            const Divider(),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: Colors.black12,
                        ),
                      ),
                      child: const ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1639149888905-fb39731f2e6c?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                        ),
                        title: CustomTextWidget(
                          text: 'James Anderson',
                        ),
                        subtitle: CustomTextWidget(
                          text: '28th January 2022 at 10:30 AM',
                          fontSize: 10.0,
                        ),
                        trailing: CustomTextWidget(
                          text: '\$12.00 (USD)',
                          textColor: Colors.black54,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TodaysOrdersStats extends StatelessWidget {
  const TodaysOrdersStats({
    super.key,
    required ValueNotifier<double> valueNotifier,
  }) : _valueNotifier = valueNotifier;

  final ValueNotifier<double> _valueNotifier;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 300,
        width: context.width > 1100 ? 250 : 200,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DashedCircularProgressBar.aspectRatio(
            aspectRatio: 1,
            valueNotifier: _valueNotifier,
            progress: 85,
            startAngle: 225,
            sweepAngle: 270,
            foregroundColor: scaffoldBackgroundColor,
            backgroundColor: const Color(0xffeeeeee),
            foregroundStrokeWidth: 15,
            backgroundStrokeWidth: 15,
            animation: true,
            seekSize: 6,
            seekColor: const Color(0xffeeeeee),
            child: Center(
              child: ValueListenableBuilder(
                  valueListenable: _valueNotifier,
                  builder: (_, double value, __) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomTextWidget(
                            text: '${value.toInt()}',
                            fontSize: 32.0,
                            fontWeight: FontWeight.w700,
                          ),
                          const CustomTextWidget(
                            text: 'Today\'s Orders',
                          ),
                        ],
                      )),
            ),
          ),
        ),
      ),
    );
  }
}

class AllReviewsSection extends StatelessWidget {
  const AllReviewsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 500,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomTextWidget(text: 'All Reviews'),
                InkWell(
                  onTap: () {},
                  child: const CustomTextWidget(
                    text: 'View All',
                    fontSize: 12.0,
                    textColor: Colors.black54,
                  ),
                ),
              ],
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  String formattedDate =
                      DateFormat('dd MMM yyyy').format(DateTime.now());
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: Colors.black12,
                        ),
                      ),
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1528892952291-009c663ce843?q=80&w=1844&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                        ),
                        title: const CustomTextWidget(
                          text: 'James Anderson',
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTextWidget(
                              text: formattedDate,
                              textColor: Colors.black54,
                              fontSize: 12.0,
                            ),
                            const SizedBox(width: 8.0),
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
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyMenuImage extends StatelessWidget {
  const MyMenuImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: context.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Colors.black12,
        ),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/a.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
