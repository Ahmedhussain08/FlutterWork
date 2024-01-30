import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form/loader1.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override

  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {

  @override

  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>loader1()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(child: Text('Splash Screen',style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white),)),
      ),
    );
  }
}
