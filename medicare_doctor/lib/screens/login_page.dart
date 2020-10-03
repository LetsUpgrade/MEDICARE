import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medicare_doctor/models/appointment.dart';
import 'package:medicare_doctor/screens/register_screen.dart';
import 'package:medicare_doctor/rounded_button.dart';
import 'package:medicare_doctor/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medicare_doctor/services/database.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import 'doctor_appointments.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;

  final CollectionReference _collectionReference = Firestore.instance
      .collection('doctors');
  final DatabaseService _databaseService = DatabaseService();



  bool showSpinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Flexible(
              //   child: Hero(
              //     tag: 'logo',
              //     child:Container(
              //       height: 200.0,
              //       child: Image.asset('images/logo.png'),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: "Enter your email"),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //Do something with the user input.
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(hintText: "Enter your password")
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: "Log In",
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try{
                    final user =await _auth.signInWithEmailAndPassword(email: email, password: password);
                    if(user != null){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => DoctorAppointment()));
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  }
                  catch (e){
                    print(e);
                  }
                },
                color: Colors.lightBlueAccent,


              ),
              RoundedButton(
                title: "Register",
                onPressed: ()  {


                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegistrationScreen()));
                },
                color: Colors.lightBlueAccent,


              ),
            ],
          ),
        ),
      ),
    );

  }
}