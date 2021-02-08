import 'package:flutter/material.dart';
import 'package:flutterproject/icon_card.dart';
import 'package:flutterproject/image_cards.dart';

class GoHomePage extends StatefulWidget{
  @override
  _GoHomePageState createState() => _GoHomePageState();
}

class _GoHomePageState extends State<GoHomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 40),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(text: 'Where are you going?',style: TextStyle(fontSize: 32,color: Colors.black))
                    ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
      print("tapped");
    },
                    child: IconCard(
                      iconData: Icons.home, text: 'Home',
                    ),
                  ),
                  GestureDetector(
                    onTap: ()=> print('y2o'),
                    child: IconCard(
                      iconData: Icons.store, text: 'Market',
                    ),
                  ),
                  IconCard(iconData: Icons.work, text: 'Work',),
                  IconCard(iconData: Icons.park, text: 'Park',),
                ],
              ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child:  RichText(
                    text: TextSpan(children: [
                      TextSpan(text:"Places to visit ", style:TextStyle(fontSize: 30, color: Colors.black)),
                      TextSpan(text:"Today!", style:TextStyle(fontSize: 38, fontWeight: FontWeight.w700, color: Colors.red)),
                    ],
                    ),
                  ),
                ),
                IconButton(icon: Icon(Icons.more_horiz,color: Colors.black,), onPressed:  (){},),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            ImageCards(),
            ],
          ),
        )
      )
    );
  }
}