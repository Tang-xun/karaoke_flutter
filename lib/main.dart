import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:karaoke_flutter/page/MessagePage.dart';
import 'package:karaoke_flutter/page/NotificationPage.dart';
import 'package:karaoke_flutter/page/SearchPage.dart';
import 'package:karaoke_flutter/page/UserFeedPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
  var navBarTexts = ["me", "search", "notificatioin", "message"];
  var navBarIcons = [
    FontAwesomeIcons.user,
    FontAwesomeIcons.search,
    FontAwesomeIcons.bell,
    FontAwesomeIcons.envelope
  ];

  @override
  Widget build(context) {
    return Scaffold(
        body: pages[selectIndex],
        bottomNavigationBar: BottomNavigationBar(
            items: [
              _genBottomNavigationBar(0),
              _genBottomNavigationBar(1),
              _genBottomNavigationBar(2),
              _genBottomNavigationBar(3),
            ],
            onTap: (index) {
              setState(() {
                selectIndex = index;
              });
            },
            currentIndex: selectIndex));
  }

  /*
   * generate nav bar with index
   * 
   * @param index 
   */
  BottomNavigationBarItem _genBottomNavigationBar(int index) {
    var _color = _genNavItemColor(index);

    if (index < 0) throw Exception("invalid index ");

    if (index >= pages.length || index >= navBarIcons.length || index >= navBarIcons.length) {
        throw Exception("index overflow resource's size ");
    } 

    return BottomNavigationBarItem(
        title: Text(
          navBarTexts[index],
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
