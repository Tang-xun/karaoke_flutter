import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MessagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    print("crateState ::: MessagePage");
    return _MessagePageState();
  }
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    print("build ::: MessagePage");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.account_circle,
          color: Colors.grey,
          size: 35,
        ),
        title: Text(
          "MessagePage",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.settings,
              color: Colors.blue,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(FontAwesomeIcons.envelope),
      ),
    );
  }
}
