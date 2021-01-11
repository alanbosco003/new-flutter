import 'package:flutter/material.dart';
import 'package:my_loving_diary/models/user.dart';
import 'package:provider/provider.dart';
import 'package:my_loving_diary/models/brew.dart';
import 'package:my_loving_diary/models/brew_tile.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<List<Brew>>(context) ?? [];
    //print(brews.documents);

    return ListView.builder(
      itemCount: user.length,
      itemBuilder: (context, index) {
        return BrewTile(brew: user[index]);
      },
    );
  }
}
