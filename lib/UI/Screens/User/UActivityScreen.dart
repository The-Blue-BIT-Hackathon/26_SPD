import 'package:flutter/material.dart';
import 'package:khoj/UI/Screens/widgets/roundedappBar.dart';
import 'package:provider/provider.dart';

import '../../../providers/post_provider.dart';
import '../widgets/PostItem.dart';

class UActivityScreen extends StatefulWidget {
  const UActivityScreen({super.key});

  static const routeName = '/activity_screen';

  @override
  State<UActivityScreen> createState() => _UActivityScreenState();
}

class _UActivityScreenState extends State<UActivityScreen> {
  var isLoading = true;
  var isInit = false;

  @override
  void initState() {
    setState(() {
      isLoading = true;
      isInit = false;
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!isInit) {
      _fetchPost();
    }
    isInit = true;
    super.didChangeDependencies();
  }

  Future _fetchPost() async {
    await Provider.of<PostProvider>(context).fetchAppliedPost().then((val) {
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: MediaQuery.of(context).size.height * 0.08,
          flexibleSpace: const RoundAppBar(title: 'Activity'),
        ),
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
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: postsData.posts.isEmpty
                      ? const Center(
                          child: Text(
                            "No Applied Job",
                          ),
                        )
                      : ListView.builder(
                          itemBuilder: (_, inx) => Column(
                            children: [
                              PostItem(
                                title: postsData.posts[inx].title,
                                companyName: postsData.posts[inx].cname,
                                location: postsData.posts[inx].location,
                                salary: postsData.posts[inx].salary,
                                duration: postsData.posts[inx].duration,
                                dailyhrs: postsData.posts[inx].workinghrs,
                                startDate: postsData.posts[inx].startDate,
                                applyStatus: "Applied",
                                pid: postsData.posts[inx].id,
                                cid: postsData.posts[inx].cid,
                              ),
                            ],
                          ),
                          itemCount: postsData.posts.length,
                        ),
                ),
              ),
      ),
    );
  }
}
