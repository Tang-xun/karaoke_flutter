
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserFeedPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    print("UserFeedPage ::: createSate");
    return UserFeedPageState();
  }
}

class UserFeedPageState extends State<UserFeedPage> {
  @override
  Widget build(BuildContext context) {
    print("UserFeedPage ::: build");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Home",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        leading: Icon(
          Icons.account_circle,
          color: Colors.grey,
          size: 35,
        ),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, position) {
          print("ListView Builder " + context.toString() + " \t" + position.toString());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(FontAwesomeIcons.featherAlt),
      ),
    );
  }
}
