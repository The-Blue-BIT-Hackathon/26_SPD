import 'package:flutter/material.dart';
import 'package:khoj/UI/Screens/User/filtersScreen.dart';
import 'package:khoj/UI/Screens/widgets/AppBarHome.dart';
import 'package:khoj/UI/Screens/widgets/PostItem.dart';
import 'package:khoj/providers/post_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../models/filter.dart';
import '../widgets/UAppDrawer.dart';

class TestHome extends StatefulWidget {
  static const routeName = '/home_screen';

  @override
  State<TestHome> createState() => _TestHomeState();
}

class _TestHomeState extends State<TestHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var isLoading = true;
  var isInit = false;
  Filter? filters;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          brightness: Brightness.dark,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 80,
          flexibleSpace: const HomeAppBar(),
          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: const CircleAvatar(
              radius: 25.0,
              backgroundImage: AssetImage('assets/images/dp.jpg'),
            ),
          ),
        ),
        drawer: const UserAppdrawer(),
        body: Column(
          children: [
            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, FiltersScreen.routeName),
              child: Chip(
                label: const Text('thi is test Filters'),
                backgroundColor: kbgColor,
                labelStyle: kTextPopM16,
                avatar: const Icon(Icons.filter_list_alt),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: double.infinity,
                child: ListView.builder(
                  itemBuilder: (_, inx) => Column(
                    children: [
                      PostItem(
                          title: 'title',
                          companyName: 'companyName',
                          location: 'location',
                          lsalary: 'lsalary',
                          hsalary: 'hsalary',
                          duration: 'duration',
                          dailyhrs: 'dailyhrs',
                          startDate: 'startDate',
                          applyStatus: 'applyStatus',
                          pid: 'pid',
                          cid: 'cid')
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
