import 'package:flutter/material.dart';
import 'package:flutterproject/utils.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              height: 200,
               child: Container(
                child: new Image.asset('assets/2.jpg',
                ),
              ),
            ),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              "To best care for someone else, caregivers need to take care of themselves. Halcyon Life is a mindfulness app that aids in relief of anxiety, depression and stress. Users can track their current location and navigate their way home, while being able to give call with a single tap on a button."
              ,textAlign: TextAlign.center,  
              style: TextStyle(          
                fontSize: 15.0,
                color:Colors.blueGrey,
                letterSpacing: 1.0,
                fontWeight: FontWeight.w400
            ),
            ),
            SizedBox(
              height: 180,
            ),
            Text(
              "Version 1.0.0"
              ,style: TextStyle(
                fontSize: 15.0,
                color:Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300
            ),
            ),
            InkWell(
            child: Text(
              "Click here to email us!"
              ,style: TextStyle(
                fontSize: 15.0,
                color:Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300,
            ),
            ),
            onTap:() => Utils.openEmail(
              toEmail: '185246X@mymail.nyp.edu.sg',
              subject: 'Halcyon Life',
              body: 'Type Here!',
            ),
            ),
             InkWell(
            child: Text(
              "Click here to call us!"
              ,style: TextStyle(
                fontSize: 15.0,
                color:Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300
            ),
            ),
             onTap: () =>  Utils.openPhoneCall(phoneNumber: '89765125'),
             ),
             Text(
              "Developer: Kai Zhe"
              ,style: TextStyle(
                fontSize: 15.0,
                color:Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300
            ),
            ),
          ],
        ),
      )
    );
  }
}