import 'package:flutter/material.dart';
import 'package:flutterproject/RegistrationForm.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'HomePage.dart';

class LoginFormValidation extends StatefulWidget {
  @override
  _LoginFormValidationState createState() => _LoginFormValidationState();
}

class _LoginFormValidationState extends State<LoginFormValidation> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String _email, _password, _error;
  String validatePassword(String value) {
    if (value.isEmpty) {
      return "* Required";
    } else if (value.length < 6) {
      return "Password should be atleast 6 characters";
    } else if (value.length > 50) {
      return "Password should not be greater than 50 characters";
    } else
      return null;
  }

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
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter valid email id as abc@gmail.com'),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                      EmailValidator(errorText: "Enter valid email id"),
                    ]),
                    onSaved: (input) => _email = input,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter secure password'),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                      MinLengthValidator(6,
                          errorText: "Password should be atleast 6 characters"),
                      MaxLengthValidator(50,
                          errorText:
                          "Password should not be greater than 50 characters")
                    ]),
                    onSaved: (input) => _password = input,
                  //validatePassword,        //Function to check validation
                ),
              ),
              showAlert(),
              FlatButton(
                onPressed: () {
                                        Navigator.push(context,
                          MaterialPageRoute(builder: (_) => RegistrationForm()));
                },
                child: Text(
                  'Create Account? Click Here!',
                  style: TextStyle(color: Colors.red, fontSize: 15),
                  
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.yellowAccent,
                    borderRadius: BorderRadius.circular(10)),
                child: FlatButton(child: Text('Sign In'),onPressed: signIn)
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
  Future<void> signIn() async{
    final FormState = formkey.currentState;
    if(FormState.validate()){
      FormState.save();
      try{
              User user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)).user;
              Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
      }catch(e){
        print(e.message);
        setState(() {
          _error = '   Account is Invalid';
        });
      }

    }
  }
}