import 'package:flutter/material.dart';
import 'package:tk_webapp/static_elements/app_bar.dart';

class Information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(context, "information"),
      body: const Center(
        child: Text("Information"),
      ),
    );
  }
}
