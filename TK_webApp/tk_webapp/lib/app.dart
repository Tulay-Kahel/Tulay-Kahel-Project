import 'package:flutter/material.dart';

class TulayKahel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tulay Kahel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tulay Kahel'),
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
