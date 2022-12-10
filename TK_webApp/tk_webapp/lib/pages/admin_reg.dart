import 'package:flutter/material.dart';
import 'package:tk_webapp/static_elements/app_bar.dart';

class AdminReg extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AdminRegState();
  }
}

class _AdminRegState extends State<AdminReg> {
  bool _checkBoxValue1 = false;
  bool _checkBoxValue2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(context, "register"),
      body: Row(
        children: [
          Container(
            color: Colors.orange[400],
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Container(
            color: Colors.white,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                  vertical: MediaQuery.of(context).size.height * 0.1,
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // Register Company Text
                      const Text(
                        "Register Company",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      // Divider
                      const Divider(
                        color: Colors.white,
                        height: 40,
                      ),
                      // Company Name and Person-in-Charge Text Fields
                      Row(
                        children: [
                          // Company Name Text Field
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Company Name *",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.22,
                                child: const TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Company Name",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Spacer
                          const SizedBox(
                            width: 20,
                          ),
                          // Person-in-Charge Text Field
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Person-in-Charge *",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.22,
                                child: const TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Person-in-Charge",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Divider
                      const Divider(
                        color: Colors.white,
                        height: 15,
                      ),
                      // Email Address and Contact Number Text Fields
                      Row(
                        children: [
                          // Email Address Text Field
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Email Address *",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.22,
                                child: const TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Email Address",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Spacer
                          const SizedBox(
                            width: 20,
                          ),
                          // Contact Number Text Field
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Contact Number *",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.22,
                                child: const TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Contact Number",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Divider
                      const Divider(
                        color: Colors.white,
                        height: 15,
                      ),
                      // Checkbox: Newsletter
                      Row(
                        children: [
                          Checkbox(
                            value: _checkBoxValue1,
                            onChanged: (value) {
                              setState(
                                () {
                                  _checkBoxValue1 = !_checkBoxValue1;
                                },
                              );
                            },
                          ),
                          const Text(
                            "Yes, I want to subscribe the monthly newsletter",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      // Checkbox: Term and Privacy Policy
                      Row(
                        children: [
                          Checkbox(
                            value: _checkBoxValue2,
                            onChanged: (value) {
                              setState(
                                () {
                                  _checkBoxValue2 = !_checkBoxValue2;
                                },
                              );
                            },
                          ),
                          const Text(
                            "I agree to all the ",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const Text(
                            "Term",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo,
                            ),
                          ),
                          const Text(
                            " and ",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const Text(
                            "Privacy Policy",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo,
                            ),
                          ),
                        ],
                      ),
                      // Divider
                      const Divider(
                        color: Colors.white,
                        height: 15,
                      ),
                      // Register Button
                      SizedBox(
                        width: 250,
                        height: 65,
                        child: ElevatedButton(
                          onPressed: () {
                            // Go to Login Page
                            Navigator.pushNamed(context, '/login');
                          },
                          child: const Text(
                            "Create Account",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
