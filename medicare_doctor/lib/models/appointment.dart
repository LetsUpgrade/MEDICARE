
import 'package:medicare_doctor/models/doctor.dart';
import 'package:medicare_doctor/models/user.dart';


class Appointment{
  final String aId;
  final User user;
  final Doctor doctor;
  final String time;



  Appointment({this.aId,this.user,this.doctor,this.time, name});

}


class AppointmentBooking{
  final String docName;
  final String docSpecialization;
  final String patUid;
  final String patName;
  final String time;



  AppointmentBooking({this.docName,this.docSpecialization,this.patUid,this.patName,this.time});

}