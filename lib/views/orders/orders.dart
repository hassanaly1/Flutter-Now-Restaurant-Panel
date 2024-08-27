import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:now_restaurant_panel/helpers/custom_text.dart';
import 'package:now_restaurant_panel/helpers/tabbar.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  // final DataTableSource _data = MyData(context);
  late DataTableSource _data;

  @override
  void initState() {
    super.initState();
    _data = MyData(context);
  }

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
                text: 'Orders Management',
                fontSize: 22.0,
                fontWeight: FontWeight.w500,
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
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: double.infinity,
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          cardColor: Colors.red,
                          cardTheme: const CardTheme(
                            elevation: 0.0,
                            color: Colors.transparent,
                          ),
                          dataTableTheme: DataTableThemeData(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                            ),

                            dataTextStyle: const TextStyle(
                                fontFamily: 'Poppins',
                                overflow: TextOverflow.ellipsis,
                                fontSize: 24.0),
                            headingRowColor:
                                WidgetStateProperty.resolveWith<Color>(
                                    (Set<WidgetState> states) {
                              return Colors.blueGrey[200]!;
                            }),
                            dataRowColor:
                                WidgetStateProperty.resolveWith<Color>(
                                    (Set<WidgetState> states) {
                              return Colors.grey[200]!;
                            }),
                            // Add other customizations here
                          ),
                        ),
                        child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: PaginatedDataTable(
                              headingRowColor:
                                  WidgetStateProperty.all(Colors.grey.shade300),
                              source: _data,
                              columns: const [
                                DataColumn(
                                  label: Center(
                                    child: CustomTextWidget(text: 'Menu'),
                                  ),
                                ),
                                DataColumn(
                                  label: Center(
                                    child: CustomTextWidget(text: 'ID'),
                                  ),
                                ),
                                DataColumn(
                                  label: Center(
                                    child: CustomTextWidget(text: 'Customer'),
                                  ),
                                ),
                                DataColumn(
                                  label: Center(
                                    child: CustomTextWidget(text: 'Category'),
                                  ),
                                ),
                                DataColumn(
                                  label: Center(
                                    child:
                                        CustomTextWidget(text: 'Price (In \$)'),
                                  ),
                                ),
                                DataColumn(
                                  label: Center(
                                    child: CustomTextWidget(text: 'Date'),
                                  ),
                                ),
                                DataColumn(
                                  label: Center(
                                    child: CustomTextWidget(text: 'Status'),
                                  ),
                                ),
                                DataColumn(
                                  label: Center(
                                    child: CustomTextWidget(text: 'Actions'),
                                  ),
                                ),
                              ],
                              header: const CustomTextWidget(
                                text: 'My Orders',
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                              columnSpacing: 20,
                              // sortAscending: true,
                              showFirstLastButtons: true,
                              // showCheckboxColumn: true,
                              rowsPerPage: 12,
                              // primary: true,
                            )),
                      ),
                    ),
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

class MyData extends DataTableSource {
  final List<Map<String, dynamic>> _data = List.generate(
    200,
    (index) => {
      "title": "Item $index",
      "id": Random().nextInt(10000),
      "customer": "Customer $index",
      "category": "Category $index",
      "price": Random().nextInt(10000),
      "date": DateTime.now().toString(),
      "status": Random().nextInt(3),
      "actions": Random().nextInt(3),
    },
  );

  final BuildContext context;

  MyData(this.context);

  @override
  DataRow? getRow(int index) {
    return DataRow(
      color: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (index % 2 == 0) {
          return Colors.grey.shade100;
        }
        return Colors.white;
      }),
      cells: [
        DataCell(
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://media.istockphoto.com/id/1829241109/photo/enjoying-a-brunch-together.jpg?b=1&s=612x612&w=0&k=20&c=Mn_EPBAGwtzh5K6VyfDmd7Q5eJFXSHhGWVr3T4WDQRo='),
              ),
              CustomTextWidget(text: '  ${_data[index]["title"]}'),
            ],
          ),
        ),
        DataCell(
          CustomTextWidget(
            text: _data[index]['id'].toString(),
          ),
        ),
        DataCell(
          CustomTextWidget(
            text: _data[index]["customer"],
          ),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: const CustomTextWidget(
              text: 'Chinese',
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        DataCell(
          CustomTextWidget(
            text: _data[index]["price"].toString(),
          ),
        ),
        DataCell(
          CustomTextWidget(
            text: _data[index]["date"],
          ),
        ),
        // DataCell(
        //   Container(
        //     padding: const EdgeInsets.all(6.0),
        //     decoration: BoxDecoration(
        //       color: Colors.green.shade300,
        //       borderRadius: BorderRadius.circular(8.0),
        //     ),
        //     child: const CustomTextWidget(
        //       text: 'Delivered',
        //       fontSize: 12.0,
        //       fontWeight: FontWeight.w400,
        //     ),
        //   ),
        // ),
        DataCell(
          Container(
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: DropdownButton<String>(
              value: 'Delivered',
              items: const [
                DropdownMenuItem(
                  value: 'Delivered',
                  child: CustomTextWidget(
                    text: 'Delivered',
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                DropdownMenuItem(
                  value: 'Pending',
                  child: CustomTextWidget(
                    text: 'Pending',
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
        ),
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () => _showOrderDetailPopUp(context),
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const CustomTextWidget(
                    text: 'View',
                    fontSize: 12.0,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const CustomTextWidget(
                    text: 'Delete',
                    fontSize: 12.0,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;

  void _showOrderDetailPopUp(BuildContext context) {
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
                      horizontal: 14.0, vertical: context.height * 0.02),
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: 'Order Details',
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(height: 10.0),
                          CustomTextWidget(text: 'Order ID: 12345'),
                          SizedBox(height: 10.0),
                          CustomTextWidget(text: 'Customer: John Anderson'),
                          SizedBox(height: 10.0),
                          CustomTextWidget(text: 'Product: Pizza'),
                          SizedBox(height: 10.0),
                          CustomTextWidget(text: 'Quantity: 1'),
                          SizedBox(height: 10.0),
                          CustomTextWidget(text: 'Price: \$10.00'),
                          SizedBox(height: 10.0),
                          CustomTextWidget(text: 'Address: 123 Main Street'),
                        ],
                      ),
                      SizedBox(
                        width: context.width * 0.15,
                        child: Image.network(
                            fit: BoxFit.cover,
                            'https://media.istockphoto.com/id/1829241109/photo/enjoying-a-brunch-together.jpg?b=1&s=612x612&w=0&k=20&c=Mn_EPBAGwtzh5K6VyfDmd7Q5eJFXSHhGWVr3T4WDQRo='),
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
}
