
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    print("crateState :: SearchPage ");
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    print("crateState :: build ");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.account_circle, color: Colors.grey, size: 35),
        title:
            Text("Search", style: TextStyle(color: Colors.black, fontSize: 16)),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(
              FontAwesomeIcons.userFriends,
              color: Colors.blue,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("search float press");
        },
        child: Icon(FontAwesomeIcons.featherAlt),
      ),
    );
  }
}
