import 'package:flutter/material.dart';

side_panel(context) {
  return Container(
    padding: const EdgeInsets.only(
      top: 50.0,
    ),
    width: MediaQuery.of(context).size.width * 0.2,
    color: Colors.indigo[400],
    child: Column(
      children: [
        // Logo
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/TK_logo.png',
              width: 45,
              height: 45,
            ),
            const SizedBox(
              width: 5.0,
            ),
            const Text(
              'TULAY\nKAHEL',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        // Divider
        const SizedBox(
          height: 70,
        ),
        // Overview
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            // Pie Chart icon
            Icon(
              Icons.pie_chart,
              color: Colors.indigo[100],
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              'Overview',
              style: TextStyle(
                color: Colors.indigo[100],
                fontSize: 17,
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        // Reports
        Container(
          color: Colors.indigo[300],
          height: 50,
          child: SizedBox(
            child: Row(
              children: [
                Row(
                  children: [
                    Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width * 0.005,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.015,
                    ),
                    // List Icon
                    const Icon(
                      Icons.view_list,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Text(
                      'Reports',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        // Ideas
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            // Idea Icon
            Icon(
              Icons.lightbulb,
              color: Colors.indigo[100],
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              'Ideas',
              style: TextStyle(
                color: Colors.indigo[100],
                fontSize: 17,
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        // Contacts
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            // Contact Icon
            Icon(
              Icons.groups,
              color: Colors.indigo[100],
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              'Contacts',
              style: TextStyle(
                color: Colors.indigo[100],
                fontSize: 17,
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        // Agents
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            // Agent Icon
            Icon(
              Icons.support_agent,
              color: Colors.indigo[100],
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              'Agents',
              style: TextStyle(
                color: Colors.indigo[100],
                fontSize: 17,
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        // Articles
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            // Article Icon
            Icon(
              Icons.article,
              color: Colors.indigo[100],
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              'Articles',
              style: TextStyle(
                color: Colors.indigo[100],
                fontSize: 17,
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 70.0,
        ),
        // Settings
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            // Settings Icon
            Icon(
              Icons.settings,
              color: Colors.indigo[100],
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              'Settings',
              style: TextStyle(
                color: Colors.indigo[100],
                fontSize: 17,
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        // Certification
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            // Certification Icon
            Icon(
              Icons.verified,
              color: Colors.indigo[100],
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              'Certification',
              style: TextStyle(
                color: Colors.indigo[100],
                fontSize: 17,
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
