import 'package:flutter/material.dart';
import 'package:khoj/UI/Screens/User/filtersScreen.dart';
import 'package:khoj/UI/Screens/widgets/AppBarHome.dart';
import 'package:khoj/UI/Screens/widgets/PostItem.dart';
import 'package:khoj/providers/post_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../models/filter.dart';
import '../widgets/UAppDrawer.dart';

class UHomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';

  @override
  State<UHomeScreen> createState() => _UHomeScreenState();
}

class _UHomeScreenState extends State<UHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var isLoading = true;
  var isInit = false;
  Filter? filters;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(ModalRoute.of(context)?.settings.arguments != null)
    {
      var fi = ModalRoute.of(context)?.settings.arguments;
      print(fi);
    }
    if (!isInit) {
      _fetchPost();
    }
    isInit = true;
    super.didChangeDependencies();
  }

  Future _fetchPost() async {
    await Provider.of<PostProvider>(context, listen: false)
        .fetchPost()
        .then((val) {
      setState(() {
        isLoading = false;
      });
    });
    print(isLoading);
  }

  @override
  Widget build(BuildContext context) {
    final postsData = Provider.of<PostProvider>(context);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          brightness: Brightness.dark,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 85,
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
        body: RefreshIndicator(
          onRefresh: () {
            setState(() {
              isLoading = true;
            });
            return _fetchPost();
          },
          child: SizedBox(
            height: 300,
            width: 200,
            child: Column(
              children: [
                const SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(FiltersScreen.routeName),
                  child: Chip(
                    label: const Text('Filters'),
                    backgroundColor: kbgColor,
                    labelStyle: kTextPopM16,
                    avatar: const Icon(Icons.filter_list_alt),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: ListView.builder(
                    itemBuilder: (_, inx) => Column(
                      children: [
                        PostItem(
                          title: postsData.posts[inx].title,
                          companyName: postsData.posts[inx].cname,
                          location: postsData.posts[inx].location,
                          lsalary: postsData.posts[inx].lsalary,
                          hsalary: postsData.posts[inx].hsalary,
                          duration: postsData.posts[inx].duration,
                          dailyhrs: postsData.posts[inx].workinghrs,
                          startDate: postsData.posts[inx].startDate,
                          applyStatus: postsData.posts[inx].applystatus,
                          pid: postsData.posts[inx].id,
                          cid: postsData.posts[inx].cid,
                        ),
                      ],
                    ),
                    itemCount: postsData.posts.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
