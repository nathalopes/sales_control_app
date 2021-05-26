import 'package:flutter/material.dart';
import 'package:sales_control/features/pages/change_password_page.dart';
import 'package:sales_control/features/pages/history_page.dart';
import 'package:sales_control/features/pages/login_page.dart';
import 'package:sales_control/features/pages/test_page.dart';
import 'features/pages/home_page.dart';
import 'features/pages/register_page.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
