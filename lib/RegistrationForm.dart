import 'package:flutter/material.dart';
import 'package:flutterproject/LoginFormValidation.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationForm extends StatefulWidget {
  @override
  RegistrationFormState createState() => RegistrationFormState();
}

class RegistrationFormState extends State<RegistrationForm> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String _email, _password,_username;

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
                  onChanged: (text){
                    _username =text;
                    print(_username);
                  },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                        hintText: 'Enter a username'),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                    ]),
                    onSaved: (input) => _username = input,
                    ),
              ),
              SizedBox(
                height: 30,
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
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(child: Text('Register'),onPressed: SignUp)
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

  Future<void> SignUp() async{
    final FormState = formkey.currentState;
    if(FormState.validate()){
      FormState.save();
      try{
              await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password).then((input){
                    input.user.updateProfile(displayName: _username.toString());
              });
             Navigator.of(context).pop();
             Navigator.push(context, MaterialPageRoute(builder: (context) => LoginFormValidation()));
      }catch(e){
        print(e.message);
        
      }

    }
  }
}