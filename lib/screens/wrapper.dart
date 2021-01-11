import 'package:my_loving_diary/screens/authinticate/authenticate.dart';
import 'package:my_loving_diary/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_loving_diary/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    // return home or auth..
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
