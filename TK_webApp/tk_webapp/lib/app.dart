import 'package:flutter/material.dart';
import 'package:tk_webapp/pages/admin_console.dart';
import 'package:tk_webapp/pages/admin_login.dart';
import 'package:tk_webapp/pages/admin_reg.dart';
import 'package:tk_webapp/pages/home.dart';
import 'package:tk_webapp/pages/report_case.dart';

class TulayKahel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tulay Kahel",
      theme: _TulayKahelTheme,
      // NOTE: Initial Route will be changed to the current working page
      // But for deployment, it will be the route to home.
      initialRoute: '/console',
      routes: {
        '/console': (context) => AdminConsole(),
        '/login': (context) => AdminLogin(),
        '/register': (context) => AdminReg(),
        '/home': (context) => Home(),
        '/report': (context) => ReportCase(),
      },
    );
  }
}
