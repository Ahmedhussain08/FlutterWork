import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:form/listtile.dart';
import 'package:form/listviewbuilder.dart';

import 'package:form/splash_screen.dart';
import 'StreamBuilder.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( const MyApp());
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
      home: FetchData(),
      debugShowCheckedModeBanner: false,
    );
  }
}
