import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/bmicalculatorpage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const SplashPageState(),
    );
  }
}

class SplashPageState extends StatefulWidget {
  const SplashPageState({super.key});

  @override
  State<SplashPageState> createState() => _SplashPageStateState();
}

class _SplashPageStateState extends State<SplashPageState> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (content) => const bmicalculatorpage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text("SLUMBERSOFT",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
        Image.asset('assets/images/BMI.png', scale: 1),
        const Text("Version 1.0")
      ],
    )));
  }
}
