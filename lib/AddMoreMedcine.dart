import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/MedicineNoti.dart';
import 'package:flutterproject/quick_medicine_model2.dart';
import 'package:flutterproject/DateTime.dart';
import 'package:flutterproject/TimeofDay.dart';
void main() => runApp(AddMoreMedicine());

class AddMoreMedicine extends StatelessWidget {
  var cardTextStyle = TextStyle(
      fontFamily: "Montserrat Regular", fontSize: 24, color: Colors.black);
  var mStyle = TextStyle(
      fontFamily: "Montserrat Medium", fontSize: 12, color: Colors.black);
  var mStyle2 = TextStyle(
      fontFamily: "Montserrat Medium", fontSize: 14, color: Colors.white);
  List<T> quick<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
  }

  var counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
            child: Text(
              'Select Your Date:',
              style: cardTextStyle,
            ),
          ),
          Container(
            height: 100,
            width: 20,
            child: ListView.builder(
              itemCount: DateTimes.length,
              padding: EdgeInsets.only(left: 16, right: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    height: 80,
                    width: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0, bottom: 16),
                      child: Column(
                        children: <Widget>[
                          Text(
                            DateTimes[index].Day,
                            style: mStyle,
                          ),
                          Text(
                            DateTimes[index].Date,
                            style: mStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
            child: Text(
              'Select your medicine to add!',
              style: cardTextStyle,
            ),
          ),
          Container(
            height: 220,
            width: 20,
            child: ListView.builder(
              itemCount: quicks.length,
              padding: EdgeInsets.only(left: 16, right: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    height: 80,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0, bottom: 16),
                      child: Column(
                        children: <Widget>[
                          Image.asset(quicks[index].image),
                          Text(
                            quicks[index].name,
                            style: mStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
            child: Text(
              'When to consume',
              style: cardTextStyle,
            ),
          ),
          Container(
            height: 220,
            width: 20,
            child: ListView.builder(
              itemCount: quickss.length,
              padding: EdgeInsets.only(left: 16, right: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    height: 80,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0, bottom: 16),
                      child: Column(
                        children: <Widget>[
                          Image.asset(quickss[index].image),
                          Text(
                            quickss[index].name,
                            style: mStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
            child: Text(
              'How many tablets',
              style: cardTextStyle,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                  heroTag: "btn2",
                  child: Icon(Icons.remove),
                  onPressed: () {
                    counter++;
                  }),
              Text(
                "$counter",
                style: TextStyle(fontSize: 50),
              ),
              FloatingActionButton(
                  heroTag: "btn1",
                  child: Icon(Icons.add),
                  onPressed: () {
                    counter--;
                  }),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.yellow, borderRadius: BorderRadius.circular(20)),
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => MedicineNoti()));
              },
              child: Text(
                'Add Medicine',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
           SizedBox(
            height: 40,
          ),
        ],
      )
      ),
    );
  }
}
