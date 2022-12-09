import 'package:flutter/material.dart';
import 'package:tk_webapp/static_elements/app_bar.dart';

class ReportCase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(context),
      body: const Center(
        child: Text("Report Case"),
      ),
    );
  }
}
