import 'package:flutter/material.dart';
import 'package:khoj/UI/Screens/widgets/AppBarHome.dart';
import 'package:khoj/UI/Screens/widgets/posts.dart';

class UHomeScreen extends StatelessWidget {
  static const routeName = '/home_screen';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          brightness: Brightness.dark,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 85,
          flexibleSpace: HomeAppBar(),
          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: CircleAvatar(
              radius: 25.0,
              backgroundImage: AssetImage('assets/images/dp.jpg'),
            ),
          ),
        ),
        // drawer: UserAppdrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Post()
              // Post(),
              // Post(),
              // Post(),
              // Post(),
            ],
          ),
        ),
      ),
    );
  }
}
