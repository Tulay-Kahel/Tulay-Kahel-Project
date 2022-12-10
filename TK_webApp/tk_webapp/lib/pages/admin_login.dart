import 'package:flutter/material.dart';

class AdminLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          Container(
            color: Colors.indigoAccent[100],
          ),
          Center(
            // Sized box with rounded corners
            child: SizedBox(
              width: 380,
              height: 580,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(25, 50, 25, 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Logo
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'lib/assets/TK_logo.png',
                            width: 50,
                            height: 50,
                          ),
                          // Spacer
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "Tulay\nKahel",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      // Divider
                      const Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                      // Admin Console Text
                      const Text(
                        "Administration Console",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Divider
                      const Divider(
                        color: Colors.white,
                        thickness: 3,
                      ),
                      // Company Name Text Field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "COMPANY",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Company Name',
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Divider
                      const Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                      // Email
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "EMAIL",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Email Address',
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Divider
                      const Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                      // Password
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "PASSWORD",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const SizedBox(
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Password"),
                              obscureText: true,
                            ),
                          ),
                        ],
                      ),
                      // Divider
                      const Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                      // Login Button
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: IMPLEMENT PROPER LOGIN
                            // This is just a pseudo login
                            if (true) {
                              Navigator.pushNamed(context, '/console');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            backgroundColor: Colors.orangeAccent[200],
                          ),
                          child: const Text(
                            "Log In",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
