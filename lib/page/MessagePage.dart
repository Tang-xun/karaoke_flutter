
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
          "Setting",
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
      body: Image.network(
        "https://upload.jianshu.io/users/upload_avatars/3884536/d847a50f1da0.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240",
          height: 300,
          width: 400,
          alignment: Alignment.center,),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("message float press");
        },
        child: Icon(FontAwesomeIcons.envelope),
      ),
    );
  }
}
