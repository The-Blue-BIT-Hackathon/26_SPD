import 'package:flutter/material.dart';
import 'package:khoj/UI/Screens/Common/choose.dart';
import 'package:khoj/UI/Screens/Common/login.dart';
import 'package:khoj/UI/Screens/Company/Cbottombar.dart';
import 'package:khoj/UI/Screens/Company/Cregister.dart';
import 'package:khoj/UI/Screens/User/Ubottombar.dart';
import 'package:khoj/UI/Screens/User/Uregister.dart';
import 'package:khoj/UI/Screens/widgets/SizeConfig.dart';
import 'package:khoj/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static var routeName = "/splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadScreen();
  }

  Future loadScreen() async {
    var authProvider = Provider.of<Auth>(context, listen: false);
    // await authProvider.signOut();
    Future.delayed(const Duration(seconds: 2), () async {
      await authProvider.autoLogin().then((_) {
        if (authProvider.isAuth) {
          if (authProvider.isUser.toString().isEmpty) {
            Navigator.of(context).pushReplacementNamed(Choose.routeName);
          } else if (authProvider.isUser.toString() == "JobSeeker") {
            if (authProvider.isProfile) {
              Navigator.of(context)
                  .pushReplacementNamed(UserBottomBar.routeName);
            } else {
              Navigator.of(context)
                  .pushReplacementNamed(UserRegister.routeName);
            }
          } else {
            if (authProvider.isProfile) {
              Navigator.of(context)
                  .pushReplacementNamed(CompanyBottomBar.routeName);
            } else {
              Navigator.of(context)
                  .pushReplacementNamed(CompanyRegister.routeName);
            }
          }
        } else {
          Navigator.of(context).pushReplacementNamed(LogIn.routeName);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              height: 380.0,
              child: Image(
                image: AssetImage('assets/images/K.gif'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
