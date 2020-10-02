import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:medicare_doctor/screens/login_page.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blueAccent,Colors.white]),
        ),
        padding: EdgeInsets.only(top: 200.0, left: 100.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  width: 250.0,
                  child: ColorizeAnimatedTextKit(

                      text: [
                        "Medicure",
                      ],
                      textStyle:
                      TextStyle(fontSize: 50.0, fontFamily: "Horizon"),
                      colors: [
                        Colors.purple,
                        Colors.blue,
                        Colors.yellow,
                        Colors.red,
                      ],
                      textAlign: TextAlign.start,
                      alignment:
                      AlignmentDirectional.topStart // or Alignment.topLeft
                  ),
                ),
              ],
            ),
            SizedBox(height: 400.0),
            FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(
                      10.0),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text('Get Started'),
                color: Colors.blue,
                textColor: Colors.white),
          ],
        ),
      ),
    );
  }
}
