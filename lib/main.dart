import 'package:contact_app/pages/home.dart';
import 'package:contact_app/pages/info.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'rsu'),
      home: HomePage(),
    );
  }
}
 