// import 'package:demo/screen/home.dart';
import 'package:flutter/material.dart';
import 'screen/home1.dart';
// import 'dart:ui_web' as ui;

main() {
  // ui.debugEmulateFlutterTesterEnvironment = true;
  return runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // var screenHeigth = MediaQuery.of(context).size.height;
    // var screenWidth = MediaQuery.of(context).size.width;
    return const MaterialApp(
      home: Home1(),
      debugShowCheckedModeBanner: false,
    );
  }
}
