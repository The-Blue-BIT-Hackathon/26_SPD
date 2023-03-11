import 'package:khoj/providers/auth_provider.dart';
import 'package:khoj/providers/company_provider.dart';
import 'package:khoj/providers/user_provider.dart';
import 'package:khoj/routes.dart';

import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => CompanyProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        theme: khojTheme,
        routes: approutes,
      ),
    );
  }
}
