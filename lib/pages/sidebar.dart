import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leavemanagementadmin/pages/branch.dart';
import 'package:leavemanagementadmin/pages/department.dart';
import 'package:leavemanagementadmin/pages/designation.dart';
import 'package:leavemanagementadmin/pages/homepage.dart';
import 'package:leavemanagementadmin/widget/logoutPage.dart';
import 'package:sidebarx/sidebarx.dart';

import '../constant/constant.dart';

@RoutePage()
class SidebarPage extends StatelessWidget {
  SidebarPage({Key? key}) : super(key: key);

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SidebarX Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.purple,
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: Builder(
        builder: (context) {
          //! if screensize < 600 then sidebar will be hidden
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
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
            drawer: ExampleSidebarX(controller: _controller),
            body: Row(
              children: [
                if (!isSmallScreen) ExampleSidebarX(controller: _controller),
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
      ),
    );
  }
}

class ExampleSidebarX extends StatefulWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  State<ExampleSidebarX> createState() => _ExampleSidebarXState();
}

class _ExampleSidebarXState extends State<ExampleSidebarX> {
  List<SidebarXItem> _items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _items = _generateItems;
  }

  bool isclicksetting = false;
  List<SidebarXItem> get settingsubitems {
    return [
      const SidebarXItem(
        iconWidget: Icon(
          FontAwesomeIcons.codeBranch,
          color: Colors.blue,
          size: 15,
        ),
        label: 'Branch',
      ),
      const SidebarXItem(
        iconWidget: Icon(
          FontAwesomeIcons.buildingUser,
          color: Colors.blue,
          size: 15,
        ),
        label: 'Department',
      ),
      const SidebarXItem(
        iconWidget: Icon(
          FontAwesomeIcons.addressCard,
          color: Colors.blue,
          size: 15,
        ),
        label: 'Designation',
      ),
      SidebarXItem(
        icon: Icons.logout_rounded,
        label: 'Log out',
        onTap: () {
          log('log out');
        },
      ),
    ];
  }

  List<SidebarXItem> get _generateItems {
    return [
      SidebarXItem(
        icon: Icons.home,
        label: 'Dashboard',
        onTap: () {
          debugPrint('Home');
        },
      ),
      SidebarXItem(
        icon: Icons.settings,
        label: 'Setting',
        onTap: () {
          if (_items.length > 3) {
            int i;
            for (i = 1; i < 4; i++) {
              _items.removeAt(_items.length - 2);
            }
          } else {
            _items.removeAt(2);
            _items.addAll(settingsubitems);
          }

          log(_items.length.toString());
        },
      ),
      SidebarXItem(
        icon: Icons.logout_rounded,
        label: 'Log out',
        onTap: () {
          log('log out');
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SidebarX(
        controller: widget._controller,
        theme: SidebarXTheme(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: canvasColor,
            borderRadius: BorderRadius.circular(20),
          ),
          hoverColor: scaffoldBackgroundColor,
          textStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
          selectedTextStyle: const TextStyle(color: Colors.black),
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
            gradient: LinearGradient(
              colors: [accentCanvasColor, accentCanvasColorLight],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.28),
                blurRadius: 10,
              )
            ],
          ),
          //! -> sidebar icon theme
          iconTheme: IconThemeData(
            color: Colors.black.withOpacity(0.7),
            size: 20,
          ),
          selectedIconTheme: const IconThemeData(
            color: Colors.black,
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
          //todo -> ternary operation on Glogo

          return FittedBox(
            child: Row(
              children: [
                SizedBox(
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/G-png-only.png'),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Leave",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Management",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        items: _items);
  }
}

bool isselectedsetting = false;
bool isselected0 = false;
bool isselected2 = false;
bool isselected3 = false;
bool isselected4 = false;
bool isselected5 = false;

class _ScreensExample extends StatefulWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  State<_ScreensExample> createState() => _ScreensExampleState();
}

class _ScreensExampleState extends State<_ScreensExample> {
  void check() {}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.addListener(() {
      switch (widget.controller.selectedIndex) {
        case 0:
          setState(
            () {
              isselected0 = true;
              isselected2 = false;
              isselected3 = false;
              isselected4 = false;
              isselected5 = false;
            },
          );
          break;
        case 1:
          setState(
            () {
              isselectedsetting = !isselectedsetting;
              isselected0 = isselected0 ? true : false;
              isselected2 = isselected2 ? true : false;
              isselected3 = isselected3 ? true : false;
              isselected4 = isselected4 ? true : false;
              isselected5 = isselected5 ? true : false;
            },
          );
          break;
        case 2:
          setState(
            () {
              isselected0 = false;
              isselected2 = true;
              isselected3 = false;
              isselected4 = false;
              isselected5 = false;
            },
          );
          break;
        case 3:
          setState(
            () {
              isselected0 = false;
              isselected2 = false;
              isselected3 = true;
              isselected4 = false;
              isselected5 = false;
            },
          );
          break;
        case 4:
          setState(
            () {
              isselected0 = false;
              isselected2 = false;
              isselected3 = false;
              isselected4 = true;
              isselected5 = false;
            },
          );
          break;
        case 5:
          setState(
            () {
              isselected0 = false;
              isselected2 = false;
              isselected3 = false;
              isselected4 = false;
              isselected5 = true;
            },
          );
          break;

        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(widget.controller.selectedIndex);

        switch (widget.controller.selectedIndex) {
          case 0:
            return const HomePage();

          case 1:
            return isselected0
                ? const HomePage()
                : isselected2
                    ? const BranchPage()
                    : isselected3
                        ? const DepartmentPage()
                        : isselected4
                            ? const DesignationPage()
                            : isselected5
                                ? isselectedsetting
                                    ? const LogOutPage()
                                    : const LogOutPage()
                                : const HomePage();

          case 2:
            return isselectedsetting ? const BranchPage() : const LogOutPage();
          case 3:
            return const DepartmentPage();
          case 4:
            return const DesignationPage();
          case 5:
            return isselectedsetting ? const LogOutPage() : const LogOutPage();
          default:
            return Text(
              pageTitle,
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Dashboard';
    case 1:
      return 'User';
    case 2:
      return 'Balance';
    case 3:
      return 'Reports';
    case 4:
      return 'Custom iconWidget';
    case 5:
      return 'Profile';
    case 6:
      return 'Settings';
    default:
      return 'Not found page';
  }
}
