import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:medicare/models/doctor.dart';
import 'package:medicare/screens/appointment.dart';
import 'package:medicare/screens/precautions.dart';
import 'package:medicare/screens/stats_screen.dart';
import 'package:medicare/services/database.dart';
import 'package:provider/provider.dart';



class MediHome extends StatelessWidget {

  final pages = [
    Container(
        child: Appointments(),
      ),

    Container(
          child: Precautions(),
        ),
    Container(
      child: StatsScreen(),
    ),
  ];

  final DatabaseService _databaseService = DatabaseService();


  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Doctor>>.value(
    value: _databaseService.doctors,
    child:MaterialApp(
      home: Scaffold(
        body: LiquidSwipe(
          pages:pages,
          enableLoop: true,
          fullTransitionValue: 300,
          enableSlideIcon: true,
          waveType: WaveType.liquidReveal,
          positionSlideIcon: 0.5,
        ),
      ),
    )
    );
  }
}
