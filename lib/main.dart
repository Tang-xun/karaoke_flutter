import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:karaoke_flutter/page/MessagePage.dart';
import 'package:karaoke_flutter/page/NotificationPage.dart';
import 'package:karaoke_flutter/page/SearchPage.dart';
import 'package:karaoke_flutter/page/UserFeedPage.dart';
import 'package:karaoke_flutter/utils/LogUtils.dart';

void main() => runApp(MyApp());
var TAG = "Main";
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LogUtils.i(TAG, "build :::: Flutter Demo ");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  // page index
  var selectIndex = 0;

  var pages = [UserFeedPage(), SearchPage(), NotificationPage(), MessagePage()];
  var navBarTexts = ["me", "friends", "notice", "message"];
  var navBarIcons = [
    FontAwesomeIcons.user,
    FontAwesomeIcons.userFriends,
    FontAwesomeIcons.bell,
    FontAwesomeIcons.envelope
  ];

  @override
  Widget build(context) {
    return Scaffold(
        body: pages[selectIndex],
        bottomNavigationBar: BottomAppBar(
            child: Row(
          children: <Widget>[
            _genBottomButtons(0),
            _genBottomButtons(1),
            _genBottomButtons(2),
            _genBottomButtons(3),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
        ))

        // bottomNavigationBar: BottomNavigationBar(
        //     items: [
        //       _genBottomNavigationBar(0),
        //       _genBottomNavigationBar(1),
        //       _genBottomNavigationBar(2),
        //       _genBottomNavigationBar(3),
        //     ],
        //     selectedFontSize: 8,
        //     unselectedFontSize: 8,
        //     selectedItemColor: Colors.blue,
        //     unselectedItemColor: Colors.blueGrey,
        //     onTap: (index) {
        //       setState(() {
        //         selectIndex = index;
        //       });
        //     },
        //     currentIndex: selectIndex)
        );
  }

  Column _genBottomButtons(int index) {
    var _color = _genNavItemColor(index);
    var _text = navBarTexts[index];
    var _icon = navBarIcons[index];

    return Column(

      children: [
        IconButton(
          icon: Icon(
            _icon,
            size: 20,
          ),
          color: _color,
          onPressed: () {
            setState(() {
              selectIndex = index;
            });
          },
        ),
        SizedBox(
          height: 0,
          width: 1,
        ),
        Text(
          _text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: _color),
        ),
        SizedBox(
          width: 1,
          height: 2,
        )
      ],
      mainAxisSize: MainAxisSize.min,
    );
  }

  /*
   * generate nav bar with index
   * 
   * @param index 
   */
  BottomNavigationBarItem _genBottomNavigationBar(int index) {
    var _color = _genNavItemColor(index);

    if (index < 0) throw Exception("invalid index ");

    if (index >= pages.length ||
        index >= navBarIcons.length ||
        index >= navBarIcons.length) {
      throw Exception("index overflow resource's size ");
    }

    return BottomNavigationBarItem(
        title: Text(
          "", // "navBarTexts[index]",
          style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.normal, color: _color),
        ),
        icon: Icon(navBarIcons[index], color: _color));
  }

  /*
   * select text or icon color with index
   * 
   * @param index 
   */
  Color _genNavItemColor(index) {
    return index == selectIndex ? Colors.blue : Colors.blueGrey;
  }
}
