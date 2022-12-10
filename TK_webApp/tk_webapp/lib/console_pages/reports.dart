import 'package:flutter/material.dart';

buildReportPanel(context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.8,
    height: MediaQuery.of(context).size.height,
    color: Colors.grey[200],
    child: Column(
      children: [
        // Header
        Container(
          padding: const EdgeInsets.only(
            left: 25.0,
            right: 25.0,
            top: 50.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Report Teext
              const Text(
                "Reports",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: const [
                  // Search icon
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  // Notification icon
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(
                    Icons.notifications,
                    color: Colors.grey,
                  ),
                  // Bar Icon
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "|",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w100,
                      color: Colors.grey,
                    ),
                  ),
                  // Company Name
                  SizedBox(
                    width: 50.0,
                  ),
                  Text(
                    "Sample Inc.",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Sample Company Logo
                  SizedBox(
                    width: 10.0,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://th.bing.com/th/id/R.35720bbf29a0f0f1d48195bafdbedf7a?rik=1ArMFF%2fGA8AK1g&riu=http%3a%2f%2fshmector.com%2f_ph%2f13%2f188552034.png&ehk=4W3VAJ3Rgszg4unVrkViPToNE%2b15%2bt3SxRm%2b2VYCdIk%3d&risl=&pid=ImgRaw&r=0'),
                    radius: 20.0,
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        // Reports List
        Container(
          padding: const EdgeInsets.all(20.0),
          color: Colors.white,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text and Search Bar
                    Row(
                      children: [
                        const Text(
                          "All Reports",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 300,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              hintText: "Search",
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Add Report, Sort, Filter
                    Row(
                      children: [
                        // Add Report Text and Icon
                        Row(
                          children: const [
                            Icon(
                              Icons.add,
                              color: Colors.grey,
                            ),
                            Text(
                              "Add Report",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        // Sort Text and Icon
                        Row(
                          children: const [
                            Icon(
                              Icons.sort,
                              color: Colors.grey,
                            ),
                            Text(
                              "Sort",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        // Filter Text and Icon
                        Row(
                          children: const [
                            Icon(
                              Icons.filter_list,
                              color: Colors.grey,
                            ),
                            Text(
                              "Filter",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                // List of Reports
                const Center(
                  child: Text("List of Reports"),
                )
                // TODO: Implement Report List from DB96
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
