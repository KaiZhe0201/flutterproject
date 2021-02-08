import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/ChangePasswordPage.dart';
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


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);
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
               child: CircleAvatar(
            backgroundImage: NetworkImage("https://i.imgur.com/Rqu8rtB.png"),
          ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              FirebaseAuth.instance.currentUser.displayName
              ,style: TextStyle(
                fontSize: 25.0,
                color:Colors.blueGrey,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w400
            ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Hougang, Singapore"
              ,style: TextStyle(
                fontSize: 18.0,
                color:Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300
            ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Age 22 || Male"
              ,style: TextStyle(
                fontSize: 18.0,
                color:Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300
            ),
            ),
            SizedBox(
              height: 30,
            ),
             Text(
              FirebaseAuth.instance.currentUser.email
              ,style: TextStyle(
                fontSize: 18.0,
                color:Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300
            ),
            ),
            SizedBox(
              height: 30,
            ),
               InkWell(
            child: Text(
              "Click here to change password!"
              ,style: TextStyle(
                fontSize: 15.0,
                color:Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300,
            ),
            ),
            onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context)=> ChangePasswordPage()),
            ),
            ),
          ],
        ),
      )
    );
  }
}