import 'package:flutter/material.dart';
import 'package:tk_webapp/static_elements/app_bar.dart';

class AdminConsole extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Temporary AppBar (Adnmin Console will have a different AppBar)
      appBar: app_bar(context, "admin_console"),
      body: const Center(
        child: Text("Admin Console"),
      ),
    );
  }
}
