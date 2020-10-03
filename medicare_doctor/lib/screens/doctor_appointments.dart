import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicare_doctor/models/appointment.dart';
import 'package:medicare_doctor/services/database.dart';
import 'package:provider/provider.dart';
//import 'package:flutter/services.dart';



class DoctorAppointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final DatabaseService _databaseService = DatabaseService();


    return MaterialApp(
      title: "Doctor Appointment",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamProvider<List<AppointmentBooking>>.value(
      value: _databaseService.appointmentBookings,
      child: Scaffold(
        appBar: AppBar(
          title: Text("MEDICURE"),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Appointments",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,

                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 00.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.deepPurple,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child:  BrewList(),


                /*
              ListView.builder(
                itemCount: names.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 6,
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 00.0),
                  child: Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding:
                      EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.deepPurple,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.0, vertical: 00.0),
                                margin: EdgeInsets.all(00.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                width: 50.0,
                                height: 50.0,
                                child: CircleAvatar(
                                  backgroundColor: Colors.deepPurpleAccent,
//                              foregroundColor: Colors.white,
                                  backgroundImage: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSya2MDHt8WIgyWsx5-t2KFF7oFwpqd8d8dZw&usqp=CAU"),
//                              child: Text(
//                                names[0],
//                                style: TextStyle(color: Colors.white),
//                                textAlign: TextAlign.center,
//                              ),
                                ),
                              ),
                              SizedBox(width: 5.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(names[index],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 10.0),
                            child: FlatButton(
                              onPressed: () {},
                              color: Colors.deepPurpleAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(color: Colors.black),
                              ),
                              child: Text(
                                "START",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

               */
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {

    final appointments = Provider.of<List<AppointmentBooking>>(context) ?? [];

    return ListView.builder(
        itemCount: appointments.length,
        itemBuilder : (context,index){
          return BrewListTile(appointmentBooking:appointments[index]);
        }
    );
  }
}






















class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List names = [
    "Name",
    "Name",
    "Ali Alshaibani",
    "Rohini",
  ];



  @override
  Widget build(BuildContext context) {

    final appointments = Provider.of<List<AppointmentBooking>>(context) ?? [];


    return Scaffold(
      appBar: AppBar(
        title: Text("MEDICURE"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Appointments",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  
                  fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 00.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.deepPurple,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child:  ListView.builder(
                itemCount: appointments.length,
                itemBuilder : (context,index){
                  return BrewListTile(appointmentBooking:appointments[index]);
                }
            ),


              /*
              ListView.builder(
                itemCount: names.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 6,
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 00.0),
                  child: Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding:
                      EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.deepPurple,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.0, vertical: 00.0),
                                margin: EdgeInsets.all(00.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                width: 50.0,
                                height: 50.0,
                                child: CircleAvatar(
                                  backgroundColor: Colors.deepPurpleAccent,
//                              foregroundColor: Colors.white,
                                  backgroundImage: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSya2MDHt8WIgyWsx5-t2KFF7oFwpqd8d8dZw&usqp=CAU"),
//                              child: Text(
//                                names[0],
//                                style: TextStyle(color: Colors.white),
//                                textAlign: TextAlign.center,
//                              ),
                                ),
                              ),
                              SizedBox(width: 5.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(names[index],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 10.0),
                            child: FlatButton(
                              onPressed: () {},
                              color: Colors.deepPurpleAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(color: Colors.black),
                              ),
                              child: Text(
                                "START",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

               */
            ),
          ],
        ),
      ),
    );
  }
}

class BrewListTile extends StatelessWidget {

  final AppointmentBooking appointmentBooking;
  BrewListTile({this.appointmentBooking});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:16.0),
      child: Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding:
        EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.deepPurple,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 2.0, vertical: 00.0),
                  margin: EdgeInsets.all(00.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  width: 50.0,
                  height: 50.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.deepPurpleAccent,
//                              foregroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSya2MDHt8WIgyWsx5-t2KFF7oFwpqd8d8dZw&usqp=CAU"),
//                              child: Text(
//                                names[0],
//                                style: TextStyle(color: Colors.white),
//                                textAlign: TextAlign.center,
//                              ),
                  ),
                ),
                SizedBox(width: 5.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(appointmentBooking.patName,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                  horizontal: 5.0, vertical: 10.0),
              child: FlatButton(
                onPressed: () {},
                color: Colors.deepPurpleAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: Colors.black),
                ),
                child: Text(
                  "START",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    ),

    );
  }
}