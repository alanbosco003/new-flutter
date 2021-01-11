import 'dart:ui';
import 'package:my_loving_diary/screens/home/home.dart';
import 'package:my_loving_diary/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:my_loving_diary/shared/loding.dart';
import 'package:my_loving_diary/models/user.dart';
import 'package:my_loving_diary/services/database.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  final Function toggleview;
  Signup({this.toggleview});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<Signup> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  // text field state
  String email = "";
  String password = "";
  String error = "";
  String val1 = '';
  String name;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: const Color(0xffffffff),
            body: Container(
              child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        // Adobe XD layer: 'dicov' (shape)
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 220.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: const AssetImage('assets/images/one.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(62.0, 75.0),
                          child: SizedBox(
                            width: 236.0,
                            child: Text.rich(
                              TextSpan(
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 38,
                                  color: const Color(0xffffffff),
                                ),
                                children: [
                                  TextSpan(
                                    text: 'MY ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'DIARIO',
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 0.0,
                      height: 50.0,
                    ),
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 240.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            color: const Color(0xffffffff),
                            border: Border.all(
                                width: 2.0, color: const Color(0xff2b2b2b)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(25, 20, 0, 0),
                            child: TextField(
                              onChanged: (val) {
                                print("First text field: $val");
                                setState(() => name = val);
                              },
                              selectionHeightStyle: BoxHeightStyle.max,
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: 'Name'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 0.0,
                      height: 15.0,
                    ),
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 240.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            color: const Color(0xffffffff),
                            border: Border.all(
                                width: 2.0, color: const Color(0xff2b2b2b)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(25, 20, 0, 0),
                            child: TextField(
                              onChanged: (val) {
                                print("First text field: $val");
                                setState(() => email = val);
                              },
                              selectionHeightStyle: BoxHeightStyle.max,
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: 'Email'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 0.0,
                      height: 15.0,
                    ),
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 240.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            color: const Color(0xffffffff),
                            border: Border.all(
                                width: 2.0, color: const Color(0xff2b2b2b)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(25, 20, 0, 0),
                            child: TextField(
                              selectionHeightStyle: BoxHeightStyle.max,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 0.0,
                      height: 15.0,
                    ),
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 240.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            color: const Color(0xffffffff),
                            border: Border.all(
                                width: 2.0, color: const Color(0xff2b2b2b)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(25, 20, 0, 0),
                            child: TextField(
                              onChanged: (val) {
                                print("First text field: $val");
                                setState(() => password = val);
                              },
                              selectionHeightStyle: BoxHeightStyle.max,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Confirm password'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 0.0,
                      height: 25.0,
                    ),
                    SizedBox(
                      width: 212.0,
                      child: Text(
                        'By creating an account you agree to our\nTerms of Service and Privacy Policy',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 10,
                          color: const Color(0xffa3adb6),
                          height: 2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 0.0,
                      height: 25.0,
                    ),
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 240.0,
                          height: 48.0,
                          child: RaisedButton(
                            onPressed: () async {
                              if (_formkey.currentState.validate()) {
                                setState(() => loading = false);
                                dynamic result =
                                    await _auth.registerwithEmailAndPassword(
                                        email, password);
                                loading = false;

                                if (result == null) {
                                  setState(() {
                                    error = "invalid email";
                                    loading = false;
                                  });
                                }
                              }

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                            },
                            textColor: Colors.white, //  SUBSTRACT
                            color: const Color(0xff2c2c2c),
                            padding: const EdgeInsets.all(8.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                                side: BorderSide(color: Colors.black)),
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 18,
                                color: Colors.white,
                                height: 1.4,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}

const String _svg_4sx1th =
    '<svg viewBox="95.2 99.9 141.1 67.7" ><path transform="translate(95.23, 99.93)" d="M 0 0 L 141.1318969726563 0 L 141.1318969726563 67.68896484375 L 0 67.68896484375 L 0 0 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
