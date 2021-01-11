import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_loving_diary/models/brew.dart';
import 'package:my_loving_diary/models/brew_list.dart';
import 'package:my_loving_diary/models/diaryread.dart';
import 'package:my_loving_diary/models/newdiary.dart';

import 'package:my_loving_diary/screens/calender/cal.dart';
import 'package:my_loving_diary/screens/calender/calender.dart';
import 'package:my_loving_diary/screens/calender/mycal.dart';
import 'package:my_loving_diary/screens/calender/tablecal.dart';
import 'package:my_loving_diary/screens/drawers/leftdrawer.dart';
import 'package:my_loving_diary/screens/home/settings_form.dart';
import 'package:my_loving_diary/screens/navigations/personal.dart';
import 'package:my_loving_diary/screens/navigations/settings.dart';
import 'package:my_loving_diary/screens/navigations/tags.dart';
//import 'package:my_loving_diary/screens/home/brew_list.dart';
import 'package:my_loving_diary/services/auth.dart';
import 'package:my_loving_diary/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:my_loving_diary/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey _bottomNavigationKey = GlobalKey();

  final firestoreInstance = Firestore.instance;
  int _page = 0;
  DateTime _dateTime;

  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xffe0f2f1),
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: SettingsForms(),
          );
        },
      );
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
          key: _drawerKey,
          backgroundColor: Color(0xffb2dfdb),

          ///// left calaner++

          drawer: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 100.0, 150.0, 70.0),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.horizontal(right: Radius.circular(40.0)),
              child: Drawer(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  child: Tags(),
                ),
              ),
            ),
          ),
          endDrawer: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 180.0, 0.0, 100.0),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.horizontal(left: Radius.circular(40.0)),
              child: Drawer(
                child: Container(
                  padding: EdgeInsets.all(0),
                  child: Settings(),
                ),
              ),
            ),
          ),
          appBar: AppBar(
            bottomOpacity: 10.0,
            title: Text(
              'My Diary',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.teal,
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('LogOut'),
              ),
              FlatButton.icon(
                onPressed: () => _showSettingsPanel(),
                icon: Icon(Icons.settings),
                label: Text('settings'),
              ),
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: 0,
            height: 55.0,
            items: <Widget>[
              Icon(Icons.favorite, size: 30),
              Icon(Icons.perm_identity, size: 30),
              Icon(Icons.library_books, size: 30),
              Icon(Icons.calendar_today, size: 30),
              Icon(Icons.settings, size: 30),
            ],
            color: Colors.teal[600],
            buttonBackgroundColor: Colors.white,
            backgroundColor: Colors.teal[100],
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 150),
            onTap: (index) async {
              setState(() {
                _page = index;
              });
              if (_page == 0) {
                _drawerKey.currentState.openDrawer();
              } else if (_page == 1) {
                _showSettingsPanel();
              } else if (_page == 2) {
                var firebaseUser = await FirebaseAuth.instance.currentUser();
                firestoreInstance
                    .collection("user")
                    .document(firebaseUser.uid)
                    .get()
                    .then((value) {
                  print(value.data);
                });
              } else if (_page == 3) {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2010),
                  lastDate: DateTime(2022),
                ).then((date) {
                  setState(() {
                    _dateTime = date;
                  });
                  print("$_dateTime");
                });
              } else if (_page == 4) {
                _drawerKey.currentState.openEndDrawer();
              } else {}
            },
          ),
          body: Newdiary()),
    );
  }
}
