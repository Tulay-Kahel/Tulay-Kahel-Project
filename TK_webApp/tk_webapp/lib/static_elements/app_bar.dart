import 'package:flutter/material.dart';
// Return a widget that contains the app bar

// highlights the Text Menu with Orange color if it is the current active page
// ignore: non_constant_identifier_names
_currentPage(menuText, activePage) {
  if (menuText == activePage) {
    return const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.orange,
      fontSize: 15,
    );
  } else {
    return const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: 15,
    );
  }
}

// App Bar
app_bar(context, activePage) {
  return AppBar(
    // Remove automatic back button
    automaticallyImplyLeading: false,
    toolbarHeight: 100,
    flexibleSpace: Column(
      children: [
        // Free Hotline Container
        Container(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
          color: Colors.purple[400],
          height: 30.0,
          width: MediaQuery.of(context).size.width,
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
          ),
        ),
        // Main App Bar
        Container(
          color: Colors.white,
          height: 70.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Tulay Kahel Logo
              const Text(
                "Tulay Kahel",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Home Text Button
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Text(
                  'Home',
                  style: _currentPage("home", activePage),
                ),
              ),
              // Get Help Text Button
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/report');
                },
                child: Text(
                  'Get Help',
                  style: _currentPage("report", activePage),
                ),
              ),
              // Information Text Button
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/information');
                },
                child: Text(
                  'Information',
                  style: _currentPage("information", activePage),
                ),
              ),
              // Abput Text Button
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
                },
                child: Text(
                  'About',
                  style: _currentPage("about", activePage),
                ),
              ),
              // Support Text Button
              TextButton(
                onPressed: () {
                  // Navigator.pushNamed(context, '/support');
                  // Support Page is not yet implemented
                  // TENTATIVE: PRINT TO CONSOLE
                  print("Support Page is not yet implemented");
                },
                child: Text(
                  'Support',
                  style: _currentPage("support", activePage),
                ),
              ),
              // Register Company Button (Elevated Button)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  maximumSize: const Size(200, 60),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.52),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text(
                  'Register Company',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
