import 'package:flutter/material.dart';
import 'package:medicare/screens/home.dart';
import 'package:medicare/screens/login_page.dart';
import 'package:medicare/screens/medi_home.dart';
import 'package:medicare/screens/ordermedicine.dart';
import 'package:medicare/screens/register_screen.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}
