import 'package:flutter/material.dart';
import 'package:khoj/UI/Screens/Common/login.dart';
import 'package:khoj/UI/Screens/Common/otp.dart';
import 'package:khoj/UI/Screens/Common/splash_screen.dart';
import 'package:khoj/UI/Screens/Company/Cregister.dart';
import 'package:khoj/UI/Screens/User/Ubottombar.dart';
import 'package:khoj/UI/Screens/User/UchatScreen.dart';
import 'package:khoj/UI/Screens/User/Uregister.dart';

import 'UI/Screens/Common/choose.dart';
import 'UI/Screens/User/UActivityScreen.dart';
import 'UI/Screens/User/UHomeScreen.dart';

var approutes = <String, WidgetBuilder>{
  //Inital Route
  '/': (context) => const SplashScreen(),

  // //Login Routes
  LogIn.routeName: (context) => LogIn(),
  OtpScreen.routeName: (context) => OtpScreen(),
  Choose.routeName: (context) => Choose(),

  //Registration Routes
  UserRegister.routeName: (context) => UserRegister(),
  CompanyRegister.routeName: (context) => CompanyRegister(),

  //User Routes
  UserBottomBar.routeName: (context) => UserBottomBar(),
  UHomeScreen.routeName: (context) => UHomeScreen(),
  UChatScreen.routeName: (context) => UChatScreen(),
  UActivityScreen.routeName: (context) => UActivityScreen(),

  // //Ngo Routes
  // NgoBottomBar.routeName: (context) => NgoBottomBar(),
  // NHomeScreen.routeName: (context) => NHomeScreen(),
  // NgoChatScreen.routeName: (context) => NgoChatScreen(),
  // NgoAddpost.routeName: (context) => NgoAddpost(),
  // NgoActivityScreen.routeName: (context) => NgoActivityScreen(),
};
