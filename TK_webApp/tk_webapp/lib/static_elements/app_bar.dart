import 'package:flutter/material.dart';
// Return a widget that contains the app bar

app_bar(context) {
  return AppBar(
    // Remove automatic back button
    automaticallyImplyLeading: false,
    toolbarHeight: 100.0,
    title: const Text("Tulay Kahel"),
    flexibleSpace: Container(
        padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
        color: Colors.purple[400],
        height: 30.0,
        child: Column(
          children: [
            RichText(
              text: const TextSpan(
                text: 'Call our Free Hotline Now: ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '7777 KAHEL or 0917 867 1907',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
    actions: <Widget>[
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Home Text Button
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: const Text(
                'Home',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
            // Get Help Text Button
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text(
                'Get Help',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                  fontSize: 15,
                ),
              ),
            ),
            // Information Text Button
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/info');
              },
              child: const Text(
                'Information',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
            // Abput Text Button
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
              child: const Text(
                'About',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
            // Support Text Button
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/support');
              },
              child: const Text(
                'Support',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
            // Register Company Button (Elevated Button)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                maximumSize: const Size(200, 50),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('Register Company',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15,
                  )),
            ),
          ],
        ),
      )
    ],
  );
}
