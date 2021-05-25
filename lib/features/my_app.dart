import 'package:flutter/material.dart';
import 'package:sales_control/features/pages/change_password_page.dart';
import 'package:sales_control/features/pages/history_page.dart';
import 'package:sales_control/features/pages/login_page.dart';
import 'package:sales_control/features/pages/test_page.dart';
import 'pages/home_page.dart';
import 'pages/register_page.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/register': (context) => RegisterPage(),
        '/history': (context) => HistoryPage(),
        '/change_password': (context) => ChangePasswordPage(),
        'teste': (context) => TestPage(),
      },
    );
  }
}
