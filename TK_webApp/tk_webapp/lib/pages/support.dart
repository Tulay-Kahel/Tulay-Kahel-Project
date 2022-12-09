import 'package:flutter/material.dart';
import 'package:tk_webapp/static_elements/app_bar.dart';

class Support extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(context, "support"),
      body: const Center(
        child: Text("Support"),
      ),
    );
  }
}
