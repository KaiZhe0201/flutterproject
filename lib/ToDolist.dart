import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Add To do List",
              ),
              Tab(text: "View To Do list"),
            ],
          ),
          title: Text('Records'),
        ),
        body: TabBarView(
          children: [
            AddRecord(),
            ViewRecord(),
          ],
        ),
      ),
    );
  }
}

class AddRecord extends StatefulWidget {
  AddRecord({Key key}) : super(key: key);
  @override
  _AddRecordState createState() => _AddRecordState();
}
class _AddRecordState extends State<AddRecord> {
  TextEditingController _ControllerNote = new TextEditingController();
  var Note;
  CollectionReference ToDoList =
      FirebaseFirestore.instance.collection('ToDoList');
  Future<void> addRecord() {
    return ToDoList.add({'uid': FirebaseAuth.instance.currentUser.uid, 'Note': Note}).then((value) => print(""));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: null,
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 170,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: _ControllerNote,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Note here!'),
                    validator: (value) =>
                  value.isEmpty ? 'Password cannot be blank' : "null",),
                ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.yellowAccent,
                    borderRadius: BorderRadius.circular(10)),
                child: RaisedButton(
                  child: Text('Create Record'),
                  onPressed: () {
                    if(_ControllerNote.text.isNotEmpty){
                        Map <String,dynamic> data ={"uid":FirebaseAuth.instance.currentUser.uid,"Note": _ControllerNote.text};
                    FirebaseFirestore.instance.collection("ToDoList").add(data);
                    }else{
                      print("watf");
                 }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ViewRecord extends StatefulWidget {
  ViewRecord({Key key}) : super(key: key);

  @override
  _ViewRecordState createState() => _ViewRecordState();
}

class _ViewRecordState extends State<ViewRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: null,
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('ToDoList')
              .where('uid', isEqualTo: FirebaseAuth.instance.currentUser.uid)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: snapshot.data.docs.map((document) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            document['Note'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
