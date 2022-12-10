// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:tk_webapp/static_elements/side_panel.dart';

class AdminConsole extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _AdminConsoleState createState() => _AdminConsoleState();
}

class _AdminConsoleState extends State<AdminConsole> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Row(
        children: [
          // Side Panel
          side_panel(context),

          // Main Panel
          Container(),
        ],
      ),
    );
  }
}
