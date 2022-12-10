// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:tk_webapp/static_elements/side_panel.dart';
import 'package:tk_webapp/console_pages/reports.dart';

class AdminConsole extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _AdminConsoleState createState() => _AdminConsoleState();
}

class _AdminConsoleState extends State<AdminConsole> {
  // ignore: prefer_final_fields
  String _activePage = 'reports';

  _buildMainPanel(context, activePage) {
    if (activePage == 'reports') {
      return buildReportPanel(context);
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Row(
        children: [
          // Side Panel
          side_panel(context),
          // Main Panel (Dpending on the active page)
          _buildMainPanel(context, _activePage),
        ],
      ),
    );
  }
}
