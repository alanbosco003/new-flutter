import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_loving_diary/models/user.dart';
import 'package:my_loving_diary/services/database.dart';
import 'package:my_loving_diary/shared/loding.dart';
import 'package:flutter/material.dart';
import 'package:my_loving_diary/services/auth.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SettingsForms extends StatefulWidget {
  @override
  _SettingsFormsState createState() => _SettingsFormsState();
}

class _SettingsFormsState extends State<SettingsForms> {
  final _formkey = GlobalKey<FormState>();

  // ignore: unused_field
  String _content;
  String _currentSugars;
  int _currentStrength;
  int min;
  int max;
  int count = 1;
  var now = new DateTime.now();

  final db = Firestore.instance;
  final firestoreInstance = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            Text('Write your diary', style: TextStyle(fontSize: 18.0)),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 50.0),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal, width: 2.0),
                ),
              ),
              validator: (val) => val.isEmpty ? 'please enter a name' : null,
              onChanged: (val) => setState(() => _content = val),
            ),
            SizedBox(height: 60.0),
            //dropdown

            RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  //var now = new DateTime.now();
                  DateTime now = DateTime.now();
                  String formattedTime = DateFormat.jm().format(now);
                  String formattedDate = DateFormat.yMMMMd('en_US').format(now);
                  print(formattedTime);
                  print("reached here");
                  var firebaseUser = await FirebaseAuth.instance.currentUser();
                  firestoreInstance
                      .collection("user")
                      .document(firebaseUser.uid)
                      .setData({
                    "$count": {
                      "date": "$formattedDate",
                      "time": "$formattedTime",
                      "content": "$_content"
                    },
                    "count": "$count"
                  }, merge: true).then((_) {
                    print("success!");
                  });
                  setState(() {
                    count++;
                  });
                })
          ],
        ));
  }
}
