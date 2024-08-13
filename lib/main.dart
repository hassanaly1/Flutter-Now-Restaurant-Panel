import 'package:flutter/material.dart';
import 'package:now_restaurant_panel/views/analytics/analytics.dart';
import 'package:now_restaurant_panel/views/menus/menus.dart';
import 'package:sidebarx/sidebarx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // primaryColor: primaryColor,
        // canvasColor: canvasColor,
        scaffoldBackgroundColor: Colors.grey.shade200,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: SidebarXExampleApp(),
    );
  }
}

class SidebarXExampleApp extends StatelessWidget {
  SidebarXExampleApp({super.key});

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final isSmallScreen = MediaQuery.of(context).size.width < 900;
        return Scaffold(
          key: _key,
          appBar: isSmallScreen
              ? AppBar(
                  backgroundColor: canvasColor,
                  title: Text(_getTitleByIndex(_controller.selectedIndex)),
                  leading: IconButton(
                    onPressed: () {
                      // if (!Platform.isAndroid && !Platform.isIOS) {
                      //   _controller.setExtended(true);
                      // }
                      _key.currentState?.openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                  ),
                )
              : null,
          drawer: MySidebarX(controller: _controller),
          body: Row(
            children: [
              if (!isSmallScreen) MySidebarX(controller: _controller),
              Expanded(
                child: Center(
                  child: _ScreensExample(
                    controller: _controller,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MySidebarX extends StatelessWidget {
  const MySidebarX({
    super.key,
    required SidebarXController controller,
  }) : _controller = controller;

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(
            color: Colors.white.withOpacity(0.7), fontFamily: 'Poppins'),
        selectedTextStyle:
            const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
        hoverTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins'),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.network(
                'https://bcassetcdn.com/public/blog/wp-content/uploads/2019/07/18094837/golden-eatery.png'),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Dashboard',
          onTap: () {
            _controller.selectIndex(0);
            print(_controller.selectedIndex);
          },
        ),
        SidebarXItem(
          icon: Icons.menu_book_sharp,
          label: 'Menu',
          onTap: () {
            _controller.selectIndex(1);
            print(_controller.selectedIndex);
          },
        ),
        SidebarXItem(
          icon: Icons.ac_unit,
          label: 'Orders',
          onTap: () {
            _controller.selectIndex(2);
            print(_controller.selectedIndex);
          },
        ),
        SidebarXItem(
          icon: Icons.production_quantity_limits,
          label: 'Promotions',
          onTap: () {
            _controller.selectIndex(3);
            print(_controller.selectedIndex);
          },
        ),
        SidebarXItem(
          icon: Icons.reviews,
          label: 'Reviews',
          onTap: () {
            _controller.selectIndex(4);
            print(_controller.selectedIndex);
          },
        ),
      ],
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    super.key,
    required this.controller,
  });

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return const AnalyticsScreen();
          case 1:
            return const MyMenuScreen();
          case 2:
            return const Text('People');
          case 3:
            return const Text('Favorites');
          case 4:
            return const Text('Custom iconWidget');
          default:
            return Text(pageTitle);
        }
      },
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Search';
    case 2:
      return 'People';
    case 3:
      return 'Favorites';
    case 4:
      return 'Custom iconWidget';
    default:
      return 'Not found page';
  }
}

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
