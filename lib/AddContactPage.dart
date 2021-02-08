import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterproject/CallFamPage.dart';
import 'package:form_field_validator/form_field_validator.dart';
//import 'package:image_picker_modern/image_picker_modern.dart';

class AddContactPage extends StatefulWidget {
  
  @override
  AddContactPageState createState() => AddContactPageState();
}

class AddContactPageState extends State<AddContactPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  File _image;

  // void _showPhotoLibrary()async {
  // File image = await  ImagePicker.pickImage(
  //     source: ImageSource.gallery
  // );
  //   setState(() {
  //     _image = image; 
  //   });

  // }
  String validatePassword(String value) {
    if (value.isEmpty) {
      return "* Required";
    } else if (value.length < 8) {
      return "Password should be atleast 8 characters";
    } else if (value.length > 8) {
      return "Password should not be greater than 8 characters";
    } else
      return null;
  }


   void _showOptions(BuildContext context) {
    
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 150,
          child: Column(children: <Widget>[
            ListTile(
              onTap: () {
                Navigator.pop(context); 
               // _showPhotoLibrary(); 
              },
              leading: Icon(Icons.photo_library),
              title: Text("Choose from photo library")
            )
          ])
        );
      }
    );
  }
  

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Add new contact"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: GestureDetector(
                onTap: (){
                  _showOptions(context);
                },
                  child: CircleAvatar(
                      radius: 50,
                      child: _image == null ? Image.asset("assets/2.jpg") : Image.file((_image)),
                      backgroundColor: Colors.transparent,
                  ),
                  ),
                ),
               Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                        hintText: 'Enter Name that is at least 3 and less then 15 characters'),
                     validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                      MinLengthValidator(3,
                          errorText: "Username should be at least 3 characters"),
                      MaxLengthValidator(15,
                          errorText:
                          "Username should not be greater than 15 characters")
                    ])
                  //validatePassword,        //Function to check validation
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Mobile number',
                        hintText: 'Enter Mobile number'),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                      MinLengthValidator(8,
                          errorText: "Number should be at least 8 characters"),
                      MaxLengthValidator(8,
                          errorText:
                          "Number should not be greater than 8 characters")
                          
                    ])
                  //validatePassword,        //Function to check validation
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    if (formkey.currentState.validate()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => CallFamPage()));
                      print("Validated");
                    } else {
                      print("Not Validated");
                    }
                  },
                  child: Text(
                    'Add Contact',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}