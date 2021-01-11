import 'package:flutter/material.dart';

class Tags extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffe0f2f1),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  color: Colors.teal[700],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(90, 80, 0, 0),
                  child: SizedBox(
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 35,
                          color: const Color(0xffffffff),
                        ),
                        children: [
                          TextSpan(
                            text: '# TAGs',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 0.0,
            height: 0.0,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 15, 15, 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 125.0,
                  height: 35.0,
                  child: RaisedButton(
                    onPressed: () {},
                    textColor: Colors.white, //  SUBSTRACT
                    color: const Color(0xff009688),
                    padding: const EdgeInsets.all(8.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        side: BorderSide(color: Colors.teal)),

                    child: Text(
                      'Notifications',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16,
                        color: Colors.white,
                        height: 1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 0.0,
            height: 0.0,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 8, 15, 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 125.0,
                  height: 35.0,
                  child: RaisedButton(
                    onPressed: () {},
                    textColor: Colors.white, //  SUBSTRACT
                    color: const Color(0xff009688),
                    padding: const EdgeInsets.all(8.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        side: BorderSide(color: Colors.teal)),

                    child: Text(
                      'Privacy',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16,
                        color: Colors.white,
                        height: 1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 0.0,
            height: 0.0,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 8, 15, 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 125.0,
                  height: 35.0,
                  child: RaisedButton(
                    onPressed: () {},
                    textColor: Colors.white, //  SUBSTRACT
                    color: const Color(0xff009688),
                    padding: const EdgeInsets.all(8.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        side: BorderSide(color: Colors.teal)),

                    child: Text(
                      'Logout',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16,
                        color: Colors.white,
                        height: 1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 0.0,
            height: 0.0,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 8, 15, 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 125.0,
                  height: 35.0,
                  child: RaisedButton(
                    onPressed: () {},
                    textColor: Colors.white, //  SUBSTRACT
                    color: const Color(0xff009688),
                    padding: const EdgeInsets.all(8.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        side: BorderSide(color: Colors.teal)),
                    child: Text(
                      'Support',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16,
                        color: Colors.white,
                        height: 1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
