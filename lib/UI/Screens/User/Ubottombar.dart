import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:khoj/UI/Screens/User/UActivityScreen.dart';
import 'package:khoj/UI/Screens/User/UHomeScreen.dart';
import 'package:khoj/UI/Screens/User/UchatScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../constants.dart';
import '../../../models/filter.dart';

class UserBottomBar extends StatefulWidget {
  static var routeName = '/bottom_nav';

  const UserBottomBar({super.key});

  @override
  State<UserBottomBar> createState() => _UserBottomBarState();
}

class _UserBottomBarState extends State<UserBottomBar> {
  Filter? filter;
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  void didChangeDependencies() {
    if (ModalRoute.of(context)?.settings.arguments != null) {
      var fi = ModalRoute.of(context)?.settings.arguments as List<dynamic>;
      filter = Filter(
        remote: fi[0],
        onsite: fi[1],
        lSalary: fi[2],
        hSalary: fi[3],
        city: fi[4],
        state: fi[5],
      );
    }
    filter ??= Filter(
          remote: false,
          onsite: false,
          lSalary: "",
          hSalary: "",
          city: "",
          state: "",
        );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(filter!),
        items: _navBarsItems(),
        navBarStyle: NavBarStyle.style9,
      ),
    );
  }
}

List<Widget> _buildScreens(Filter f) {
  return [
    UHomeScreen(
      filter: f,
    ),
    const UChatScreen(),
    const UActivityScreen(),
    const UActivityScreen()
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
        icon: Icon(FeatherIcons.home),
        title: ("Home"),
        activeColorPrimary: kprimaryColor,
        inactiveColorPrimary: kprimaryColor),
    PersistentBottomNavBarItem(
      icon: Icon(FeatherIcons.messageSquare),
      title: ("Chat"),
      activeColorPrimary: kprimaryColor,
    ),
    PersistentBottomNavBarItem(
        icon: Icon(FeatherIcons.activity),
        title: ("Activity"),
        activeColorPrimary: kprimaryColor,
        inactiveColorPrimary: kprimaryColor),
    PersistentBottomNavBarItem(
        icon: Icon(FeatherIcons.book),
        title: ("Course"),
        activeColorPrimary: kprimaryColor,
        inactiveColorPrimary: kprimaryColor),
  ];
}

// class UserBottomBar extends StatefulWidget {
//   const UserBottomBar({super.key});

//   @override
//   State<UserBottomBar> createState() => _UserBottomBarState();
// }

// class _UserBottomBarState extends State<UserBottomBar> {
//   final PersistentTabController _controller =
//       PersistentTabController(initialIndex: 0);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PersistentTabView(
//         context,
//         controller: _controller,
//         screens: _buildScreens(),
//         items: _navBarsItems(),
//         navBarStyle: NavBarStyle.style10,
//         backgroundColor: kprimaryColor,
//       ),
//     );
//   }
// }

// List<Widget> _buildScreens() {
//   return [HomeScreen(), ChatScreen(), ActivityScreen()];
// }

// List<PersistentBottomNavBarItem> _navBarsItems() {
//   return [
//     PersistentBottomNavBarItem(
//       icon: Icon(
//         FeatherIcons.home,
//       ),
//       title: ("Home"),
//       textStyle: kTextPopR12,
//       activeColorPrimary: ksecondaryColor,
//     ),
//     PersistentBottomNavBarItem(
//       icon: Icon(FeatherIcons.messageSquare),
//       title: ("Chat"),
//       activeColorPrimary: ksecondaryColor,
//     ),
//     PersistentBottomNavBarItem(
//         icon: Icon(FeatherIcons.activity),
//         title: ("Activity"),
//         activeColorPrimary: ksecondaryColor,
//         inactiveColorPrimary: ksecondaryColor),
//   ];
// }
