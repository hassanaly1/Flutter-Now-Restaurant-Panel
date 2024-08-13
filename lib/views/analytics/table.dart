// import 'package:flutter/material.dart';
// import 'package:now/helpers/custom_text.dart';
// import 'package:syncfusion_flutter_core/theme.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';
//
// /// The home page of the application which hosts the datagrid.
// class MyHomePage extends StatefulWidget {
//   /// Creates the home page.
//   MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _rowsPerPage = 10;
//   List<Employee> employees = <Employee>[];
//   late EmployeeDataSource employeeDataSource;
//   double datapagerHeight = 70.0;
//
//   @override
//   void initState() {
//     super.initState();
//     employees = getEmployeeData();
//     employeeDataSource =
//         EmployeeDataSource(employeeData: employees, rowsPerPage: _rowsPerPage);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const CustomTextWidget(text: 'Syncfusion Flutter DataGrid'),
//         ),
//         body: LayoutBuilder(
//             builder: (BuildContext context, BoxConstraints constraints) {
//           return Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     border: Border(
//                       bottom: BorderSide(
//                         color: Colors.grey.shade200,
//                       ),
//                     ),
//                   ),
//                   height: constraints.maxHeight - datapagerHeight,
//                   child: SfDataGrid(
//                       source: employeeDataSource,
//                       columnWidthMode: ColumnWidthMode.fill,
//                       allowColumnsResizing: true,
//                       columns: <GridColumn>[
//                         GridColumn(
//                             columnName: 'id',
//                             label: Container(
//                                 padding: const EdgeInsets.all(8.0),
//                                 alignment: Alignment.center,
//                                 child: const CustomTextWidget(
//                                   text: 'ID',
//                                 ))),
//                         GridColumn(
//                             columnName: 'name',
//                             label: Container(
//                                 padding: const EdgeInsets.all(8.0),
//                                 alignment: Alignment.center,
//                                 child: const CustomTextWidget(
//                                   text: 'Name',
//                                 ))),
//                         GridColumn(
//                             columnName: 'designation',
//                             label: Container(
//                                 padding: const EdgeInsets.all(8.0),
//                                 alignment: Alignment.center,
//                                 child: const CustomTextWidget(
//                                   text: 'Designation',
//                                 ))),
//                         GridColumn(
//                             columnName: 'salary',
//                             label: Container(
//                                 padding: const EdgeInsets.all(8.0),
//                                 alignment: Alignment.center,
//                                 child: const CustomTextWidget(
//                                   text: 'Salary',
//                                 ))),
//                       ]),
//                 ),
//               ),
//               Container(
//                   width: constraints.maxWidth,
//                   alignment: Alignment.centerRight,
//                   color: Colors.grey.shade200,
//                   height: datapagerHeight,
//                   child: SfDataPagerTheme(
//                     data: SfDataPagerThemeData(
//                       itemColor: Colors.white,
//                       selectedItemColor: Colors.blueAccent,
//                       itemBorderRadius: BorderRadius.circular(5),
//                       backgroundColor: Colors.grey.shade200,
//                       disabledItemColor: Colors.redAccent.withOpacity(0.2),
//                       dropdownButtonBorderColor: Colors.black,
//                       itemBorderColor: Colors.black,
//                       itemTextStyle: const TextStyle(
//                           color: Colors.black38,
//                           fontSize: 12,
//                           fontFamily: 'Poppins'),
//                       selectedItemTextStyle: const TextStyle(
//                           color: Colors.black,
//                           fontSize: 12,
//                           fontFamily: 'Poppins'),
//                       disabledItemTextStyle: const TextStyle(
//                           color: Colors.black,
//                           fontSize: 12,
//                           fontFamily: 'Poppins'),
//                     ),
//                     child: SfDataPager(
//                       delegate: employeeDataSource,
//                       availableRowsPerPage: const [5, 10, 15],
//                       direction: Axis.horizontal,
//                       onRowsPerPageChanged: (int? rowsPerPage) {
//                         setState(() {
//                           _rowsPerPage = rowsPerPage!;
//                           employeeDataSource.updateRowsPerPage(_rowsPerPage);
//                           employeeDataSource.updateDataGriDataSource();
//                         });
//                       },
//                       pageCount:
//                           ((employees.length / _rowsPerPage).ceil()).toDouble(),
//                     ),
//                   )),
//             ],
//           );
//         }));
//   }
// }
//
// class Employee {
//   Employee(this.id, this.name, this.designation, this.salary);
//
//   final int id;
//   final String name;
//   final String designation;
//   final int salary;
// }
//
// List<Employee> getEmployeeData() {
//   return [
//     Employee(1, 'John', 'Manager', 50000),
//     Employee(2, 'Doe', 'Developer', 40000),
//     Employee(3, 'Jane', 'Designer', 45000),
//     Employee(4, 'Paul', 'QA', 35000),
//     Employee(1, 'John', 'Manager', 50000),
//     Employee(2, 'Doe', 'Developer', 40000),
//     Employee(3, 'Jane', 'Designer', 45000),
//     Employee(4, 'Paul', 'QA', 35000),
//     Employee(1, 'John', 'Manager', 50000),
//     Employee(2, 'Doe', 'Developer', 40000),
//     Employee(3, 'Jane', 'Designer', 45000),
//     Employee(4, 'Paul', 'QA', 35000),
//     Employee(1, 'John', 'Manager', 50000),
//     Employee(2, 'Doe', 'Developer', 40000),
//     Employee(3, 'Jane', 'Designer', 45000),
//     Employee(4, 'Paul', 'QA', 35000),
//     Employee(1, 'John', 'Manager', 50000),
//     Employee(2, 'Doe', 'Developer', 40000),
//     Employee(3, 'Jane', 'Designer', 45000),
//     Employee(4, 'Paul', 'QA', 35000),
//     Employee(1, 'John', 'Manager', 50000),
//     Employee(2, 'Doe', 'Developer', 40000),
//     Employee(3, 'Jane', 'Designer', 45000),
//     Employee(4, 'Paul', 'QA', 35000),
//     Employee(1, 'John', 'Manager', 50000),
//     Employee(2, 'Doe', 'Developer', 40000),
//     Employee(3, 'Jane', 'Designer', 45000),
//     Employee(4, 'Paul', 'QA', 35000),
//     Employee(1, 'John', 'Manager', 50000),
//     Employee(2, 'Doe', 'Developer', 40000),
//     Employee(3, 'Jane', 'Designer', 45000),
//     Employee(4, 'Paul', 'QA', 35000),
//     Employee(1, 'John', 'Manager', 50000),
//     Employee(2, 'Doe', 'Developer', 40000),
//     Employee(3, 'Jane', 'Designer', 45000),
//     Employee(4, 'Paul', 'QA', 35000),
//     Employee(1, 'John', 'Manager', 50000),
//     Employee(2, 'Doe', 'Developer', 40000),
//     Employee(3, 'Jane', 'Designer', 45000),
//     Employee(4, 'Paul', 'QA', 35000),
//     Employee(1, 'John', 'Manager', 50000),
//     Employee(2, 'Doe', 'Developer', 40000),
//     Employee(3, 'Jane', 'Designer', 45000),
//     Employee(4, 'Paul', 'QA', 35000),
//     Employee(1, 'John', 'Manager', 50000),
//     Employee(2, 'Doe', 'Developer', 40000),
//     Employee(3, 'Jane', 'Designer', 45000),
//     Employee(4, 'Paul', 'QA', 35000),
//     Employee(1, 'John', 'Manager', 50000),
//     Employee(2, 'Doe', 'Developer', 40000),
//     Employee(3, 'Jane', 'Designer', 45000),
//     Employee(4, 'Paul', 'QA', 35000),
//     Employee(1, 'John', 'Manager', 50000),
//     Employee(2, 'Doe', 'Developer', 40000),
//     Employee(3, 'Jane', 'Designer', 45000),
//     Employee(4, 'Paul', 'QA', 35000),
//     Employee(1, 'John', 'Manager', 50000),
//     Employee(2, 'Doe', 'Developer', 40000),
//     Employee(3, 'Jane', 'Designer', 45000),
//     Employee(4, 'Paul', 'QA', 35000),
//     Employee(1, 'John', 'Manager', 50000),
//     Employee(2, 'Doe', 'Developer', 40000),
//     Employee(3, 'Jane', 'Designer', 45000),
//     Employee(4, 'Paul', 'QA', 35000),
//   ];
// }
//
// class EmployeeDataSource extends DataGridSource {
//   /// Creates the employee data source class with required details.
//   EmployeeDataSource(
//       {required List<Employee> employeeData, required int rowsPerPage}) {
//     _employeeData = employeeData;
//     _rowsPerPage = rowsPerPage;
//     _paginatedRows = employeeData;
//     buildDataGridRow();
//   }
//
//   late int _rowsPerPage;
//
//   void buildDataGridRow() {
//     _employeeDataGridRows = _paginatedRows
//         .map<DataGridRow>((e) => DataGridRow(cells: [
//               DataGridCell<int>(columnName: 'id', value: e.id),
//               DataGridCell<String>(columnName: 'name', value: e.name),
//               DataGridCell<String>(
//                   columnName: 'designation', value: e.designation),
//               DataGridCell<int>(columnName: 'salary', value: e.salary),
//             ]))
//         .toList();
//   }
//
//   List<DataGridRow> _employeeDataGridRows = [];
//   List<Employee> _paginatedRows = [];
//   List<Employee> _employeeData = [];
//
//   @override
//   List<DataGridRow> get rows => _employeeDataGridRows;
//
//   @override
//   DataGridRowAdapter buildRow(DataGridRow row) {
//     return DataGridRowAdapter(
//         cells: row.getCells().map<Widget>((e) {
//       return Container(
//         alignment: Alignment.center,
//         padding: const EdgeInsets.all(8.0),
//         child: CustomTextWidget(text: e.value.toString()),
//       );
//     }).toList());
//   }
//
//   @override
//   Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) {
//     final int _startIndex = newPageIndex * _rowsPerPage;
//     int _endIndex = _startIndex + _rowsPerPage;
//     if (_endIndex > _employeeData.length) {
//       _endIndex = _employeeData.length;
//     }
//
//     /// Get a particular range from the sorted collection.
//     if (_startIndex < _employeeData.length &&
//         _endIndex <= _employeeData.length) {
//       _paginatedRows = _employeeData.getRange(_startIndex, _endIndex).toList();
//     } else {
//       _paginatedRows = <Employee>[];
//     }
//     buildDataGridRow();
//     notifyListeners();
//     return Future<bool>.value(true);
//   }
//
//   void updateRowsPerPage(int rowsPerPage) {
//     _rowsPerPage = rowsPerPage;
//   }
//
//   void updateDataGriDataSource() {
//     notifyListeners();
//   }
// }
