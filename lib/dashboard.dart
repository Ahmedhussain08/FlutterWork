import 'dart:html';

import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  var arrColor = [
    Colors.green.shade600,
    Colors.amberAccent,
    Colors.blue.shade800,
    Colors.red
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text('Admin Panel'),
        centerTitle: true,
      ),
      body: GridView.count(
          padding: EdgeInsets.all(20),
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          primary: false,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: arrColor[0], borderRadius: BorderRadius.circular(20)),
            ),
            Container(
              decoration: BoxDecoration(
                  color: arrColor[1], borderRadius: BorderRadius.circular(20)),
            ),
            Container(
              decoration: BoxDecoration(
                  color: arrColor[2], borderRadius: BorderRadius.circular(20)),
            ),
            Container(
              decoration: BoxDecoration(
                  color: arrColor[3], borderRadius: BorderRadius.circular(20)),
            ),
          ]),
    );
  }
}
