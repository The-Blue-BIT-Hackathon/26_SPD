import 'package:flutter/material.dart';
import 'package:http/http.dart';
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
  final Filter filter;

  UHomeScreen({required this.filter});

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
    if (!isInit) {
      if (widget.filter.state.isNotEmpty ||
          widget.filter.city.isNotEmpty ||
          widget.filter.remote ||
          widget.filter.onsite ||
          widget.filter.lSalary.isNotEmpty ||
          widget.filter.hSalary.isNotEmpty) {
        _fetchPostByFilter();
      } else {
        _fetchPost();
      }
    }
    isInit = true;
    super.didChangeDependencies();
  }

  Future _fetchPostByFilter() async {
    await Provider.of<PostProvider>(context, listen: false)
        .fetchPostFilters(widget.filter)
        .then((val) {
      setState(() {
        isLoading = false;
      });
    });
  }

  Future _fetchPost() async {
    await Provider.of<PostProvider>(context, listen: false)
        .fetchPost()
        .then((val) {
      setState(() {
        isLoading = false;
      });
    });
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
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () {
                  setState(() {
                    isLoading = true;
                  });
                  return _fetchPost();
                },
                child: Column(
                  children: [
                    const SizedBox(height: 10.0),
                    GestureDetector(
                      onTap: () => Navigator.of(context, rootNavigator: true)
                          .pushNamed(FiltersScreen.routeName),
                      child: Chip(
                        label: const Text('Filters'),
                        backgroundColor: kbgColor,
                        labelStyle: kTextPopM16,
                        avatar: const Icon(Icons.filter_list_alt),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: double.infinity,
                        child: postsData.posts.isEmpty
                            ? Container()
                            : ListView.builder(
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
                                      applyStatus:
                                          postsData.posts[inx].applystatus,
                                      pid: postsData.posts[inx].id,
                                      cid: postsData.posts[inx].cid,
                                    ),
                                  ],
                                ),
                                itemCount: postsData.posts.length,
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
