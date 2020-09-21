import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:medicare/screens/appointment.dart';
import 'package:medicare/screens/precautions.dart';
import 'package:medicare/screens/stats_screen.dart';



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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
