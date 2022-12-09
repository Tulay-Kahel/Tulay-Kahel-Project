import 'package:flutter/material.dart';
import 'package:tk_webapp/static_elements/app_bar.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(context, "about"),
      body: const Center(
        child: Text("About"),
      ),
    );
  }
}
