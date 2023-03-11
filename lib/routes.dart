import 'package:flutter/material.dart';
import 'package:khoj/UI/Screens/Common/login.dart';
import 'package:khoj/UI/Screens/Common/otp.dart';
import 'package:khoj/UI/Screens/Company/Cregister.dart';
import 'package:khoj/UI/Screens/User/Uregister.dart';

var approutes = <String, WidgetBuilder>{
  //Inital Route
  '/': (context) => OtpScreen(),

  // //Login Routes
  // LogIn.routeName: (context) => LogIn(),
  // OtpScreen.routeName: (context) => OtpScreen(),
  // Choose.routeName: (context) => Choose(),

  // //Registration Routes
  // UserRegister.routeName: (context) => UserRegister(),
  // NgoRegister.routeName: (context) => NgoRegister(),

  // //User Routes
  // UserBottomBar.routeName: (context) => UserBottomBar(),
  // HomeScreen.routeName: (context) => HomeScreen(),
  // ChatScreen.routeName: (context) => ChatScreen(),
  // ActivityScreen.routeName: (context) => ActivityScreen(),

  // //Ngo Routes
  // NgoBottomBar.routeName: (context) => NgoBottomBar(),
  // NHomeScreen.routeName: (context) => NHomeScreen(),
  // NgoChatScreen.routeName: (context) => NgoChatScreen(),
  // NgoAddpost.routeName: (context) => NgoAddpost(),
  // NgoActivityScreen.routeName: (context) => NgoActivityScreen(),
};
