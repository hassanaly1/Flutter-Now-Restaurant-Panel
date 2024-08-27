import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:now_restaurant_panel/helpers/custom_text.dart';
import 'package:now_restaurant_panel/views/analytics/bar_chart.dart';
import 'package:now_restaurant_panel/views/analytics/graph.dart';
import 'package:now_restaurant_panel/views/analytics/pie_chart.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Flexible(
                    child: CustomTextWidget(
                      text: 'Restaurant Analytics',
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (context.width > 1100)
                    Row(
                      children: [
                        Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(16.0),
                                border: Border.all(color: Colors.black12)),
                            child: const Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://bcassetcdn.com/public/blog/wp-content/uploads/2019/07/18094837/golden-eatery.png'),
                                ),
                                SizedBox(width: 4.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextWidget(
                                      text: 'Golder Eatery',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    CustomTextWidget(
                                      text: 'goldereatery@restaurant.com',
                                      fontSize: 10.0,
                                      textColor: Colors.black54,
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.logout_outlined,
                              color: Colors.red,
                            )),
                      ],
                    )
                ],
              ),
              const Divider(),
              const SizedBox(height: 20.0),
              const Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  CustomStatsContainer(
                    backgroundColor: Colors.orange,
                    text: 'Total Revenue',
                    stats: 28,
                  ),
                  CustomStatsContainer(
                    backgroundColor: Colors.teal,
                    text: 'Profit',
                    stats: 73,
                  ),
                  CustomStatsContainer(
                    backgroundColor: Colors.green,
                    text: 'Number of Orders',
                    stats: 14,
                  ),
                  CustomStatsContainer(
                    backgroundColor: Colors.orange,
                    text: 'Canceled Orders',
                    stats: 28,
                  ),
                  CustomStatsContainer(
                    backgroundColor: Colors.lightBlueAccent,
                    text: 'Completed Orders',
                    stats: 158,
                  ),
                  CustomStatsContainer(
                    backgroundColor: Colors.teal,
                    text: 'Returns',
                    stats: 73,
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 20.0),
              const CustomTextWidget(
                text: 'Weekly Analytics',
                fontSize: 22.0,
                fontWeight: FontWeight.w500,
              ),
              const Divider(),
              const SizedBox(height: 20.0),
              Wrap(
                children: [
                  Container(
                    height: 250,
                    width: 700,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      border: Border.all(color: Colors.black12),
                    ),
                    child: const MyPieChartWidget(),
                  ),
                  const SizedBox(width: 24.0),
                  Container(
                    height: 250,
                    width: 700,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      border: Border.all(color: Colors.black12),
                    ),
                    child: MyBarChartWidget(),
                  ),
                ],
              ),
              const Divider(),
              const SalesChart(),
            ],
          ),
        ),
      ),
    );
  }
}

class AnalyticsStats extends StatelessWidget {
  final List<Widget> statsList;

  const AnalyticsStats({super.key, required this.statsList});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: statsList.sublist(0, 2),
            ),
            Row(
              children: statsList.sublist(2, 4),
            ),
            Row(
              children: statsList.sublist(4, 6),
            ),
            Row(
              children: statsList.sublist(6, 8),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomStatsContainer extends StatelessWidget {
  final String text;
  final int stats;
  final Color backgroundColor;

  const CustomStatsContainer({
    super.key,
    required this.backgroundColor,
    required this.text,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 220,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.black12),
        ),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 60,
              color: Colors.black.withOpacity(0.2),
              child: const Icon(Icons.ac_unit),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: text,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomTextWidget(
                    text: stats.toString(),
                    fontSize: 26.0,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
