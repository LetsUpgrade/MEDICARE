import 'package:medicare/models/doctor.dart';
import 'package:medicare/models/user.dart';

class Appointment{
  final String aId;
  final User user;
  final Doctor doctor;
  final String time;



  Appointment({this.aId,this.user,this.doctor,this.time});

}