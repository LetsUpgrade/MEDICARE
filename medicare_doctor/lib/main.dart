import 'package:flutter/material.dart';
import 'package:medicare_doctor/screens/chat.dart';
import 'package:medicare_doctor/screens/doctor_appointments.dart';
import 'package:medicare_doctor/screens/home.dart';

import 'screens/home.dart';
import 'screens/login_page.dart';

void main() {
  runApp(MedicareD());
}

class MedicareD extends StatelessWidget {
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
