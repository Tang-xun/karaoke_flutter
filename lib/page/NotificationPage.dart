import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    print("crateState ::: NotificationPage");
    return _NotificationPageState();
  }
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    print("build ::: NotificationPage");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.account_circle,
          color: Colors.grey,
          size: 35,
        ),
        title: Text("Notifications",
            style: TextStyle(color: Colors.black, fontSize: 16)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(FontAwesomeIcons.featherAlt),
      ),
    );
  }
}
