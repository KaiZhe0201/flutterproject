import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/user_model.dart';
import 'package:form_field_validator/form_field_validator.dart';


class ChangePasswordPage extends StatefulWidget {
  @override
  ChangePasswordPageState createState() => ChangePasswordPageState();
}

class ChangePasswordPageState extends State<ChangePasswordPage> {
  var _error;
  var _newPasswordController = TextEditingController();
  var _repeatPasswordController = TextEditingController();
   UserModel _currentUser;
  UserModel get currentUser => _currentUser;
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                      width: 200,
                      height: 150,
                      child: Image.asset('assets/2.jpg')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'New Password',
                        hintText: 'Enter secure password'),
                    controller: _newPasswordController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                      MinLengthValidator(6,
                          errorText: "Password should be atleast 6 characters"),
                      MaxLengthValidator(15,
                          errorText:
                          "Password should not be greater than 15 characters")
                    ]),
                  //validatePassword,        //Function to check validation
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirm New Password',
                        hintText: 'Enter secure password'),
                    controller: _repeatPasswordController,
                    validator: (value){
                      return _newPasswordController.text == value ? null : "Please validate your entered password";
                    }
                  //validatePassword,        //Function to check validation
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(child: 
                Text('Change Password'),
                onPressed: (){
                  FirebaseAuth.instance.currentUser.updatePassword(_newPasswordController.text.toString());
                },
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
  Widget showAlert(){
    if(_error != null){
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.error_outline),
            Expanded(
              child: Text(
                _error, maxLines: 3,
                ),
              ),
          ],
        ),
      );
    }
    return SizedBox(height: 0);
  }





}