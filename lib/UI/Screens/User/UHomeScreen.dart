import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:khoj/UI/Screens/widgets/AppBarHome.dart';
import 'package:khoj/providers/user_provider.dart';
import 'package:provider/provider.dart';
import '../../../models/post.dart';

class UHomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';

  @override
  State<UHomeScreen> createState() => _UHomeScreenState();
}

class _UHomeScreenState extends State<UHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Post p = Post(
    id: '',
    cid: "UXCpplmylYbbAKqeucqRLM20LmG2",
    salary: "2-4 LPA",
    title: "Business Development Intern",
    city: "Mumbai",
    state: "Maharashtra",
    duration: "4 months",
    location: "On-Site",
    workinghrs: "5 hours",
    responsibility: [
      "Assist new customers with onboarding process",
      "Maintain & provide daily or weekly reports to management",
      "Assist in marketing activities"
    ],
    skills: [
      "Employee needs to open to learning new work & dedicated",
      "Employee needs to be good at communication"
    ],
  );
  @override
  void didChangeDependencies() {
    postit();
    super.didChangeDependencies();
  }

  Future postit() async{
    Provider.of<UserProvider>(context).getUser("6PUCYrMdKzYyoYOeMcANfJsalxE3", "-NQGwYGDZGTbfyy0nqnG");
  }

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
            icon: const CircleAvatar(
              radius: 25.0,
              backgroundImage: AssetImage('assets/images/dp.jpg'),
            ),
          ),
        ),
        // drawer: UserAppdrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Post()
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
