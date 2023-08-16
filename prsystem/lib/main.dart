import 'package:flutter/material.dart';

import 'package:prsystem/constants/constants.dart';
import 'package:prsystem/provider/post_Provider.dart';
import 'package:prsystem/provider/prList_Provider.dart';
import 'package:prsystem/provider/user_Provider.dart';
import 'package:prsystem/ui/authMobile.dart';
import 'package:prsystem/ui/signin.dart';
import 'package:prsystem/ui/splashscreen.dart';
import 'package:prsystem/ui/mainpage.dart';

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider(
          create: (BuildContext context) => PostProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => PRListProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Rofu (Thailand) Ltd.",
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        routes: <String, WidgetBuilder>{
          SPLASH_SCREEN: (BuildContext context) => SplashScreen(),
          SIGN_IN: (BuildContext context) => SignInPage(),
          MAINPAGE: (BuildContext context) => MainPage(),
          ERROR_VERIFLYMOBILE: (BuildContext context) => authMobileScreen(),
        },
        initialRoute: SPLASH_SCREEN,
      ),
    );
  }
}
