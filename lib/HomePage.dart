import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/ToDolist.dart';
import 'CallFamPage.dart';
import 'AboutPage.dart';
import 'MedicineNoti.dart';
import 'GoHomePage.dart';
import 'ProfilePage.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context){
    var size = MediaQuery.of(context).size;

    var cardTextStyle = TextStyle(fontFamily: "Montserrat Regular", fontSize: 14, color: Color.fromRGBO(63, 63, 63, 1));

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * 3,
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage('assets/13.jpg')
            ),
          ),
          ),
          SafeArea(
         child: Padding(
        padding: EdgeInsets.all(16.0),
         child: Column(
            children: <Widget>[
              Container(
                height: 35,
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage("https://i.imgur.com/Rqu8rtB.png"),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(FirebaseAuth.instance.currentUser.displayName.toString(), style: TextStyle(fontFamily: 'Montserrat Medium', color: Colors.white, fontSize: 16),),
                        Text(FirebaseAuth.instance.currentUser.email, style: TextStyle(fontFamily: 'Montserrat Medium', color: Colors.white, fontSize: 12),)
                      ],
                    )
                  ]
                ),
              ),
            Expanded(
              child :GridView.count(
                mainAxisSpacing: 6,
                crossAxisSpacing: 6,
                primary: false,
                crossAxisCount: 2,
                children: <Widget>[
                  InkWell(
                    onTap: (){ Navigator.push(context,
                          MaterialPageRoute(builder: (_) => CallFamPage())); },
                    child: new Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    elevation:4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         SvgPicture.network(
                           'https://image.flaticon.com/icons/svg/126/126509.svg', height: 128,),
                        Text('Call Family', style: cardTextStyle)
                    ],
                    ),
                  ),
                  ),
                    InkWell(
                    onTap: (){ Navigator.push(context,
                          MaterialPageRoute(builder: (_) => MedicineNoti())); },
                    child: new Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    elevation:4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         SvgPicture.network(
                           'https://image.flaticon.com/icons/svg/1792/1792756.svg', height: 128,),
                        Text('Medicine Reminder', style: cardTextStyle)
                    ],
                    ),
                  ),
                    ),
                      InkWell(
                    onTap: (){ Navigator.push(context,
                          MaterialPageRoute(builder: (_) => ToDoList())); },
                    child: new Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    elevation:4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         SvgPicture.network(
                           'https://image.flaticon.com/icons/svg/2285/2285516.svg', height: 128,),
                        Text('To Do List', style: cardTextStyle)
                    ],
                    ),
                  ),
                      ),
                        InkWell(
                    onTap: (){ Navigator.push(context,
                          MaterialPageRoute(builder: (_) => GoHomePage())); },
                    child: new Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    elevation:4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         SvgPicture.network(
                           'https://image.flaticon.com/icons/svg/25/25694.svg', height: 128,),
                        Text('Go Home', style: cardTextStyle)
                    ],
                    ),
                  ),
                        ),
                         InkWell(
                    onTap: (){ Navigator.push(context,
                          MaterialPageRoute(builder: (_) => AboutPage())); },
                    child: new Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    elevation:4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         SvgPicture.network(
                           'https://image.flaticon.com/icons/svg/2948/2948059.svg', height: 128,),
                        Text('About', style: cardTextStyle)
                    ],
                    ),
                  ),
                      ),
                            InkWell(
                    onTap: (){ Navigator.push(context,
                          MaterialPageRoute(builder: (_) => ProfilePage())); },
                    child: new   Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    elevation:4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         SvgPicture.network(
                           'https://image.flaticon.com/icons/svg/848/848043.svg', height: 128,),
                        Text('Profile', style: cardTextStyle)
                    ],
                    ),
                  ),
                ),
                ],
                ),
            ),
            ],
          )
         ),
          )
        ],
      ),
    );
  }
}
