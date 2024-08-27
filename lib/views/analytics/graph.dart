import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalesChart extends StatefulWidget {
  const SalesChart({super.key});

  @override
  _SalesChartState createState() => _SalesChartState();
}

class _SalesChartState extends State<SalesChart> {
  // Dummy data for the chart
  List<_ChartData> chartData = [
    _ChartData("Jan", 1500, 1120, 110, 100, 5),
    _ChartData("Feb", 2000, 150, 2110, 1130, 8),
    _ChartData("Mar", 1800, 1140, 115, 120, 117),
    _ChartData("Apr", 2200, 160, 1215, 140, 1110),
    _ChartData("May", 2400, 170, 3110, 150, 112),
    _ChartData("Jun", 2600, 180, 20, 160, 19),
    _ChartData("Jul", 2800, 1910, 122, 170, 111),
    _ChartData("Aug", 3000, 200, 18, 1180, 13),
    _ChartData("Sep", 3200, 2110, 1125, 190, 15),
    _ChartData("Oct", 3400, 220, 20, 200, 1110),
    _ChartData("Nov", 3600, 2130, 18, 210, 13),
    _ChartData("Dec", 3800, 240, 2112, 220, 1114),
  ];

  @override
  Widget build(BuildContext context) {
    return _buildGraph(context);
  }

  Widget _buildGraph(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        color: Colors.grey.shade100,
        height: MediaQuery.of(context).size.height * 0.5,
        child: SfCartesianChart(
          plotAreaBorderWidth: 1,
          enableAxisAnimation: true,
          enableMultiSelection: true,
          enableSideBySideSeriesPlacement: true,
          title: const ChartTitle(
              text: 'Annual Sales Insights',
              textStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w600)),
          legend: const Legend(isVisible: true),
          primaryXAxis: const CategoryAxis(
            majorGridLines: MajorGridLines(width: 1),
            labelRotation: 0,
          ),
          primaryYAxis: NumericAxis(
            rangePadding: ChartRangePadding.none,
            axisLine: const AxisLine(width: 0),
            majorTickLines: const MajorTickLines(size: 6),
            minimum: 0,
            maximum: _getMaximumYValue(chartData),
          ),
          series: _getLineSeries(),
          tooltipBehavior: TooltipBehavior(enable: true),
        ),
      ),
    );
  }

  List<CartesianSeries<_ChartData, String>> _getLineSeries() {
    return <CartesianSeries<_ChartData, String>>[
      LineSeries<_ChartData, String>(
        dataSource: chartData,
        xValueMapper: (_ChartData data, _) => data.month,
        yValueMapper: (_ChartData data, _) => data.totalSales,
        name: 'Total Sales',
        markerSettings: const MarkerSettings(isVisible: true),
      ),
      LineSeries<_ChartData, String>(
        dataSource: chartData,
        xValueMapper: (_ChartData data, _) => data.month,
        yValueMapper: (_ChartData data, _) => data.totalOrders,
        name: 'Total Orders',
        markerSettings: const MarkerSettings(isVisible: true),
      ),
      LineSeries<_ChartData, String>(
        dataSource: chartData,
        xValueMapper: (_ChartData data, _) => data.month,
        yValueMapper: (_ChartData data, _) => data.canceledOrders,
        name: 'Canceled Orders',
        markerSettings: const MarkerSettings(isVisible: true),
      ),
      LineSeries<_ChartData, String>(
        dataSource: chartData,
        xValueMapper: (_ChartData data, _) => data.month,
        yValueMapper: (_ChartData data, _) => data.completedOrders,
        name: 'Completed Orders',
        markerSettings: const MarkerSettings(isVisible: true),
      ),
      LineSeries<_ChartData, String>(
        dataSource: chartData,
        xValueMapper: (_ChartData data, _) => data.month,
        yValueMapper: (_ChartData data, _) => data.returns,
        name: 'Returns',
        markerSettings: const MarkerSettings(isVisible: true),
      ),
    ];
  }

  double _getMaximumYValue(List<_ChartData> chartData) {
    num maxValue = 0;
    for (var data in chartData) {
      maxValue = [
        maxValue,
        data.totalSales,
        data.totalOrders,
        data.canceledOrders,
        data.completedOrders,
        data.returns
      ].reduce((value, element) => value > element ? value : element);
    }
    return maxValue + 500;
  }
}

// Data model class for chart data
class _ChartData {
  _ChartData(this.month, this.totalSales, this.totalOrders, this.canceledOrders,
      this.completedOrders, this.returns);

  final String month;
  final double totalSales;
  final int totalOrders;
  final int canceledOrders;
  final int completedOrders;
  final int returns;
}
