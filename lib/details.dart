import 'package:flutter/material.dart';
import 'package:flutterproject/places.dart';

class Details extends StatelessWidget {
  final Place place;

  Details(this.place);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Image.asset(
                  'assets/${place.image}',
                  height: 400,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.local_activity, color: Colors.grey, size: 20,),
                  SizedBox(width:5,),
                  Text('${place.days}', style: TextStyle(color: Colors.grey))
                ],
              )
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(text:'${place.place} \n', style:TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.black)),
                    TextSpan(text: '${place.description}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey),
                    ),
                  ],
                  ),
                )
              ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height:80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30),),
                    color: Colors.pink[400],
                  ),
                  child: Row(
                    mainAxisAlignment:  MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right:10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 6,
                                offset: Offset(1,1)
                              )
                            ]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Navigate Now!', style: TextStyle(color: Colors.pink, fontSize: 24),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ],
        ),
        Positioned(
          top:20,
          left:10,
          child: GestureDetector(
            onTap:(){
              Navigator.pop(context);
            },
            child: Align(
              alignment: Alignment.topLeft,
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
      ],
    ));
  }
}
