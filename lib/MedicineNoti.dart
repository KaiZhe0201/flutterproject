import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterproject/AddMoreMedcine.dart';
import 'package:flutterproject/quick_medicine_model.dart';
import 'package:flutterproject/ActivitylogModel.dart';
import 'package:flutterproject/DateTime.dart';
import 'package:flutterproject/HomePage.dart';
void main() => runApp(MedicineNoti());
 
class MedicineNoti extends StatelessWidget {
  var cardTextStyle = TextStyle(fontFamily: "Montserrat Regular", fontSize: 24, color: Colors.black);
   var mStyle = TextStyle(fontFamily: "Montserrat Medium", fontSize: 12, color: Colors.black);
var mStyle2 = TextStyle(fontFamily: "Montserrat Medium", fontSize: 14, color: Colors.white);

   List<T> quick<T>(List list, Function handler){
     List<T> result =[];
     for(var i = 0; i < list.length; i++){
       result.add(handler(i, list[i]));
     }
   }


 


 @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black,), 
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> HomePage()));
                  },
                  ),
                ],
              ),
               Padding(
                    padding: EdgeInsets.only(left: 16, top:24,bottom:12),
                    child: Text(
                      'Dates:',
                      style:cardTextStyle,
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 20,
                    child: ListView.builder(
                      itemCount:  DateTimes.length,
                      padding: EdgeInsets.only(left: 16, right: 16),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
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
                              border: Border.all(color: Colors.black, width: 1),
                            //  (DateTimes[index].color)
                            ),
                             child: Padding(
                               padding: const EdgeInsets.only(top:25.0, bottom: 16),
                              child: Column(
                                children: <Widget>[
                                  Text(DateTimes[index].Day, style: mStyle,),
                                  Text(DateTimes[index].Date, style: mStyle,)
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                  ),
               ),
              Padding(
                padding: EdgeInsets.only(left: 16, top: 24),
                child: Text(
                  'Your Reminder!',
                  style: cardTextStyle,
                ),
                ),
                Container(
                  height: 144,
                  margin: EdgeInsets.only(left:16, top:24),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right:8),
                            padding: EdgeInsets.only(left:16),
                            height: 64,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            child: Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/medicine.svg', height:60, fit: BoxFit.contain,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:  MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Morning              ', style:mStyle),
                                      Text('Atorvastatin', style:mStyle),
                                      Text('1Tab', style:mStyle)
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ),
                           Container(
                            margin: EdgeInsets.only(right:8),
                            padding: EdgeInsets.only(left:16),
                            height: 64,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            child: Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/medicine1svg.svg', height:60, fit: BoxFit.contain,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:  MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Afternoon         ', style:mStyle),
                                      Text('Adderall', style:mStyle),
                                      Text('1Tab', style:mStyle)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                        ),
                        SizedBox(height: 16),
                        Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right:8),
                            padding: EdgeInsets.only(left:16),
                            height: 64,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            child: Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/medicine3svg.svg', height:60, fit: BoxFit.contain,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:  MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Evening              ', style:mStyle),
                                      Text('Ativan        ', style:mStyle),
                                      Text('3Tab', style:mStyle)
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ),
                           Container(
                            margin: EdgeInsets.only(right:8),
                            padding: EdgeInsets.only(left:16),
                            height: 64,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                          child: InkWell(
                            child: Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/medicineaddmore.svg', height:60, fit: BoxFit.contain,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:  MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text('                     ', style:mStyle),
                                      Text('Add More           ', style:mStyle),
                                      Text('', style:mStyle)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            onTap: () =>{
                              Navigator.push(context,
                          MaterialPageRoute(builder: (_) => AddMoreMedicine()))
                            },
                          ),
                           ),
                        ],
                        )
                    ],
                  )
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, top:24,bottom:12),
                    child: Text(
                      'Quick add Medicine for today!',
                      style:cardTextStyle,
                    ),
                  ),
                  Container(
                    height: 220,
                    width: 20,
                    child: ListView.builder(
                      itemCount:  quicks.length,
                      padding: EdgeInsets.only(left: 16, right: 16),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
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
                              border: Border.all(color:Colors.black, width: 1),
                            ),
                             child: Padding(
                               padding: const EdgeInsets.only(top:25.0, bottom: 16),
                              child: Column(
                                children: <Widget>[
                                  Image.asset(quicks[index].image),
                                  Text(quicks[index].name, style: mStyle,),
                                  Text(quicks[index].medicine, style: mStyle,)
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                  ),
               ),
               Padding(
                 padding: EdgeInsets.only(left:16 , top:24, bottom:12),
                child: Text(
                  'Supplement Promotions!'
                  ,style: cardTextStyle,
                )
               ),
               Container(
                 height: 181,
                 child: ListView.builder(
                 padding: EdgeInsets.only(left:16),
                 itemCount: ActivityLogs.length,
                 scrollDirection: Axis.horizontal,
                 itemBuilder: (context, index){
                   return Container(
                     margin: EdgeInsets.only(right: 16),
                     width: 220,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Stack(
                           children: <Widget>[
                             Container(
                               height: 104,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(8),
                                 image: DecorationImage(
                                   image: AssetImage(ActivityLogs[index].image),
                                   fit: BoxFit.fill
                                 ),
                               ),
                             ),
                             Positioned(
                               bottom: 8,
                               left: 8,
                               child: Text(
                                  ActivityLogs[index].name,
                                style: mStyle,
                             )
                             )
                           ],
                         ),
                         SizedBox(height: 8,),
                         Text(ActivityLogs[index].content, 
                         maxLines: 3, 
                         style: mStyle,
                         ),
                         SizedBox(height: 8,),
                       ],
                     ),
                   );
                 },
                 ),
               ),
            ],
          ),
        ),
    );
  }
}
