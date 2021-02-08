import 'package:flutter/material.dart';
import 'package:flutterproject/forMap.dart';
import 'package:flutterproject/image_card.dart';

class IconCard extends StatelessWidget{
  final IconData iconData;
  final String text;

  IconCard({this.iconData, this.text});

  @override
  Widget build(BuildContext context){
    return Container(
      height: 80,
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.pink[50],
              borderRadius: BorderRadius.circular(10)),
              child: IconButton(icon: Icon(iconData, size: 30, color: Colors.pink[400],), onPressed: (){
                MapUtils.openMap(1.380024, 103.849121);
              },
              )),
              Text(text, style: TextStyle(fontSize: 14),)
        ]
      )
    );
  }
}