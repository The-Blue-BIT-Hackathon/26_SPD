import 'package:flutter/material.dart';
import 'package:khoj/UI/Screens/Common/login.dart';
import 'package:khoj/UI/Screens/Common/otp.dart';
import 'package:khoj/UI/Screens/Common/splash_screen.dart';
import 'package:khoj/UI/Screens/Company/Cbottombar.dart';
import 'package:khoj/UI/Screens/Company/Cregister.dart';
import 'package:khoj/UI/Screens/User/TestHomeScreen.dart';
import 'package:khoj/UI/Screens/User/Ubottombar.dart';
import 'package:khoj/UI/Screens/User/UchatScreen.dart';
import 'package:khoj/UI/Screens/User/Uregister.dart';
import 'package:khoj/UI/Screens/User/filtersScreen.dart';

import 'UI/Screens/Common/choose.dart';
import 'UI/Screens/User/UActivityScreen.dart';
import 'UI/Screens/User/UHomeScreen.dart';

var approutes = <String, WidgetBuilder>{
  //Initial Route
  '/': (context) => const SplashScreen(),

  //Login Routes
  LogIn.routeName: (context) => LogIn(),
  OtpScreen.routeName: (context) => OtpScreen(),
  Choose.routeName: (context) => Choose(),

  //Registration Routes
  UserRegister.routeName: (context) => UserRegister(),
  CompanyRegister.routeName: (context) => CompanyRegister(),

  //User Routes
  UserBottomBar.routeName: (context) => UserBottomBar(),
  UChatScreen.routeName: (context) => UChatScreen(),
  UActivityScreen.routeName: (context) => UActivityScreen(),
  FiltersScreen.routeName: (context) => FiltersScreen(),

  // Company Routes
  CompanyBottomBar.routeName: (context) => CompanyBottomBar(),

  // Filters Route
  FiltersScreen.routeName :(context) => FiltersScreen(),
};
