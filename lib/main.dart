import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:form/loader1.dart';
import 'package:form/loader2.dart';
import 'package:form/loader3.dart';
import 'firebase_options.dart';

import 'signup.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: loader1(),
      debugShowCheckedModeBanner: false,
    );
  }
}
