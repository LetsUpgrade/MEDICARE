import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicare/constants.dart';
import 'package:medicare/rounded_button.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:medicare/screens/medi_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicare/services/auth.dart';
import 'package:medicare/services/database.dart';


import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance ;

  final CollectionReference _collectionReference = Firestore.instance
      .collection('users');
  final AuthService _authService = AuthService();

  bool showSpinner = false;
  String email;
  String password;
  String name;
  int age;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              //     child: Container(
              //       height: 200.0,
              //       child: Image.asset('images/logo.png'),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 48.0,
              ),
              TextField(

                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  name = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: "Enter your Name"),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(

                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  //Do something with the user input.
                  age = int.parse(value);
                },
                decoration: kTextFieldDecoration.copyWith(hintText: "Enter your Age"),
              ),
              SizedBox(
                height: 8.0,
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
                decoration: kTextFieldDecoration.copyWith(hintText: "Enter your password"),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: "Register",
                onPressed: () async{
                  setState(() {
                    showSpinner = true;
                  });
                  try {

                    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                    FirebaseUser user = result.user;


                    _collectionReference.document(user.uid).setData({
                      'name': name,
                      'email': email,
                      'age': age
                    }).then((value){
                      print("Successful");
                      setState(() {
                        showSpinner = false;
                      });
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MediHome()));
                    }).catchError((error) {
                      print("Failed to add user: $error");

                    });





                    /*
                    dynamic result = _authService.registerWithEmaillAndPassword(email, password);

                    if(result != null){
                      print("RESULT"+result);

                      DatabaseService _database = DatabaseService(uid:result.uid);

                     dynamic response = _database.updateUserData(name, email, age);


                      print(result);


                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MediHome()));
                    }

                    else{
                      print("result null");
                    }
                    */


                  }
                  catch (e){
                    print(e);
                  }

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