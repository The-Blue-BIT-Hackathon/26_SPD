import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:khoj/UI/Screens/Company/CActivityScreen.dart';
import 'package:khoj/UI/Screens/Company/CchatScreen.dart';
import 'package:khoj/UI/Screens/Company/CreatePostScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../constants.dart';

class CompanyBottomBar extends StatefulWidget {
  static var routeName = '/bottom_nav';

  const CompanyBottomBar({super.key});

  @override
  State<CompanyBottomBar> createState() => _CompanyBottomBarState();
}

class _CompanyBottomBarState extends State<CompanyBottomBar> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        navBarStyle: NavBarStyle.style9,
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [ CompanyChatScreen(),CreatePost(), NActivityScreen()];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(FeatherIcons.messageSquare),
      title: ("Chat"),
      activeColorPrimary: kprimaryColor,
    ),
    PersistentBottomNavBarItem(
        icon: Icon(FeatherIcons.plusSquare),
        title: ("Create"),
        activeColorPrimary: kprimaryColor,
        inactiveColorPrimary: kprimaryColor),
    PersistentBottomNavBarItem(
        icon: Icon(FeatherIcons.activity),
        title: ("Activity"),
        activeColorPrimary: kprimaryColor,
        inactiveColorPrimary: kprimaryColor),
  ];
}
