import 'package:flutter/material.dart';
import 'AddContactPage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
void main() => runApp(CallFamPage());



class CallFamPage extends StatelessWidget {




  Future<void> _makePhoneCall(String contact, bool direct) async {
    if (direct == true) {
      bool res = await FlutterPhoneDirectCaller.callNumber(contact);
  } else {
      String telScheme = 'tel:$contact';
 
      if (await canLaunch(telScheme)) {
        await launch(telScheme);
      } else {
        throw 'Could not launch $telScheme';
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: ListView(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage("https://i.imgur.com/PEsuEPC.jpg"),
          ),
          title: Text('SON'),
          subtitle: Text('My Kid'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () => _makePhoneCall('98765432', true),
          selected: true,
        ),
        Divider(
          color: Colors.black
          
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage("https://i.imgur.com/RYRynia.png"),
          ),
          title: Text('Hubby'),
          subtitle: Text('My Love'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () => _makePhoneCall('98765432', true),
          selected: true,
        ),
          Divider(
          color: Colors.black
          
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage("https://i.imgur.com/yQc1Wvl.jpg"),
          ),
          title: Text('DAUGHTER'),
          subtitle: Text('My 2nd Kid'),
          trailing: Icon(Icons.keyboard_arrow_right),
         onTap: () => _makePhoneCall('98765432', true),
          selected: true,
        ),
         Divider(
          color: Colors.black
          
        ),
         ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage("https://i.imgur.com/Cm7hDVH.png"),
          ),
          title: Text('Add New Contact'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(context,
                          MaterialPageRoute(builder: (_) => AddContactPage()));
          },
        ),
      ],
      ),
      ),
    );
  }
}
