import 'package:flutter/material.dart';
import 'package:tk_webapp/pages/admin_console.dart';
import 'package:tk_webapp/pages/admin_login.dart';
import 'package:tk_webapp/pages/admin_reg.dart';
import 'package:tk_webapp/pages/home.dart';
import 'package:tk_webapp/pages/report_case.dart';
import 'package:tk_webapp/pages/information.dart';
import 'package:tk_webapp/pages/support.dart';
import 'package:tk_webapp/pages/about.dart';
import 'package:google_fonts/google_fonts.dart';

class TulayKahel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tulay Kahel",
      theme: _TulayKahelTheme,
      // NOTE: Initial Route will be changed to the current working page
      // But for deployment, it will be the route to home.
      initialRoute: '/login',
      routes: {
        '/console': (context) => AdminConsole(),
        '/login': (context) => AdminLogin(),
        '/register': (context) => AdminReg(),
        '/home': (context) => Home(),
        '/report': (context) => ReportCase(),
        '/information': (context) => Information(),
        '/about': (context) => About(),
        '/support': (context) => Support(),
      },
    );
  }
}

final ThemeData _TulayKahelTheme = _buildTulayKahelTheme();

ThemeData _buildTulayKahelTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    // Visual Density is adaptive to the platform
    // Since we need to support a wide range of devices.
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: GoogleFonts.poppinsTextTheme(base.textTheme),
    primaryColor: const Color(0xFFFFB656),
    appBarTheme: const AppBarTheme(
      toolbarHeight: 80.0,
      color: Colors.white,
      elevation: 10.0,
    ),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.orange,
      accentColor: Colors.indigoAccent[200],
      cardColor: Colors.white,
      backgroundColor: Colors.white,
    ).copyWith(
      secondary: const Color(0xFF8D61A9),
    ),
  );
}
