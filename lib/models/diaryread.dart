import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Diaryread extends StatefulWidget {
  @override
  _DiaryreadState createState() => _DiaryreadState();
}

class _DiaryreadState extends State<Diaryread> {
  Future<Map> downloadData() async {
    final firestoreInstance = Firestore.instance;
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    var file = new Map();
    await firestoreInstance
        .collection("user")
        .document(firebaseUser.uid)
        .get()
        .then((value) {
      print(value.data);
      setState(() {
        file = value.data;
      });
      print(file["3"]["time"]);
      print(file["count"]);
    });

    return file; // return your response
  }

  @override
  Widget build(BuildContext context) {
    $file1() => downloadData();
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
            width: MediaQuery.of(context).size.width,
          ),
          Flexible(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Card(
                    margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 6.0),
                    child: ListTile(
                      subtitle: Text('reacher hear'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
