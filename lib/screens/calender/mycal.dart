import 'package:flutter/material.dart';

class Mycal extends StatefulWidget {
  @override
  _MycalState createState() => _MycalState();
}

class _MycalState extends State<Mycal> {
  DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(_dateTime == null
            ? 'nothing has been selected'
            : _dateTime.toString()),
        RaisedButton(onPressed: () {
          showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2010),
            lastDate: DateTime(2022),
          ).then((date) {
            setState(() {
              _dateTime = date;
            });
          });
        })
      ],
    ));
  }
}
