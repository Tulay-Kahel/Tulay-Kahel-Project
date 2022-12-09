import 'package:flutter/material.dart';
import 'package:tk_webapp/static_elements/app_bar.dart';

class ReportCase extends StatelessWidget {
  var _valRadio1 = 0;
  var _valRadio2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(context, "report"),
      body: Row(
        children: [
          // Text Details (Left Side)
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Report a Case",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width * 0.5) * 0.5,
                    child: const Text(
                      "Need to share anything about your experience? Fill out the form with your report so we’ll be able to help you out.",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          // Report Form (Right Side)
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Reporter Name and Email Text Field
                SizedBox(
                  width: (MediaQuery.of(context).size.width * 0.5) * 0.8,
                  child: Row(
                    children: [
                      // Reporter Name Text Field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Reporter Name *",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            width:
                                (MediaQuery.of(context).size.width * 0.5) * 0.4,
                            child: const TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Name",
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Spacer
                      SizedBox(
                        width: (MediaQuery.of(context).size.width * 0.5) * 0.1,
                      ),
                      // Reporter Email Text Field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Email *",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            width:
                                (MediaQuery.of(context).size.width * 0.5) * 0.3,
                            child: const TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Email Address",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Divider
                const Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
                // Tell Us Anything Text Field
                SizedBox(
                  width: (MediaQuery.of(context).size.width * 0.5) * 0.8,
                  child: Row(
                    children: [
                      // Tell Us Anything Text Field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Tell Us Anything",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            width:
                                (MediaQuery.of(context).size.width * 0.5) * 0.8,
                            height: 100,
                            child: const TextField(
                              expands: true,
                              maxLines: null,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                alignLabelWithHint: true,
                                hintText:
                                    "What are the experiences you've encountered?",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Divider
                const Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
                // Radio Buttons
                SizedBox(
                  width: (MediaQuery.of(context).size.width * 0.5) * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: 1,
                        groupValue: 1,
                        toggleable: true,
                        onChanged: (value) {
                          _valRadio1 = 1;
                          _valRadio2 = 0;
                        },
                        activeColor: Colors.indigo,
                      ),
                      const Text(
                        "Reporting for Myself",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      // Spacer
                      SizedBox(
                        width: (MediaQuery.of(context).size.width * 0.5) * 0.1,
                      ),
                      Radio(
                        value: 2,
                        groupValue: 1,
                        toggleable: true,
                        onChanged: (value) {
                          _valRadio2 = 1;
                          _valRadio1 = 0;
                        },
                        activeColor: Colors.indigo,
                      ),
                      const Text(
                        "Reporting for a VAW-Survivor Coworker",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                // Divider
                const Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
                // Note / Disclaimer
                SizedBox(
                  width: (MediaQuery.of(context).size.width * 0.5) * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width * 0.5) * 0.7,
                        height: 50,
                        child: const Text(
                          "By submitting this form, I acknowledge that only the company's account manager will have access to the report, and all data will be protected under the Data Privacy Act (RA 10173).",
                          style: TextStyle(
                            fontSize: 10,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                // Submit Button
                SizedBox(
                  width: (MediaQuery.of(context).size.width * 0.5) * 0.8,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Elevated Button
                      SizedBox(
                        width: (MediaQuery.of(context).size.width * 0.5) * 0.5,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
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
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
