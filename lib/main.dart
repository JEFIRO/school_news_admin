import 'package:flutter/material.dart';
import 'package:school_news/pages/AdminViewUserProfile.dart';
import 'package:school_news/pages/WelcomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(),
    );
  }
}
