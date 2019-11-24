import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:karaoke_flutter/channel/ComUtils.dart';
import '../channel/LogUtils.dart';

class UserFeedPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    print("UserFeedPage ::: createSate");
    return UserFeedPageState();
  }
}

var TAG = "UserFeedPage";

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
      body: _loadGitDataWitLocal(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("user float press");
          _loadGitData();
        },
        child: Icon(FontAwesomeIcons.featherAlt),
      ),
    );
  }

  FutureBuilder _loadGitDataWitLocal(context) {
    return new FutureBuilder(
      future: DefaultAssetBundle.of(context)
          .loadString("assets/json/tencent.repos"),
      builder: (context, snapshot) {
        LogUtils.i(TAG,
            "load data finish ::: ${snapshot.hasData} ${snapshot.hasError}");

        if (snapshot.hasData) {
          List<dynamic> repoData = json.decode(snapshot.data.toString());
          repoData.sort((a, b) => b["forks"].compareTo(a["forks"]));
          return new ListView.builder(
            itemCount: repoData.length,
            itemBuilder: (BuildContext context, int index) {
              var itemData = repoData[index];

              var name = itemData["name"];
              int forks = itemData["forks"];

              LogUtils.i(TAG, "name : $name forks: $forks");

              return new GestureDetector(
                  onTap: () {
                    LogUtils.i(TAG ,"click ::: ${itemData["name"]}");
                    ComUtils.toastS(itemData["name"]);
                  },
                  
                  child: Card(
                  elevation: 2.0,
                  borderOnForeground: true,
                  margin: EdgeInsets.all(5),
                  child: Row(
                    children: <Widget>[
                      Container(
                          child: Image.asset(
                            "./assets/imgs/tencent.png",
                            width: 45,
                            height: 45,
                            alignment: Alignment.centerLeft,
                          ),
                          margin: EdgeInsets.fromLTRB(15, 20, 15, 20),),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Text(
                                "${itemData["name"]}",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              '${itemData["description"]}',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                              softWrap: true,
                              maxLines: 3,
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Row(
                                children: <Widget>[
                                  _genStartIcon(0, forks),
                                  _genStartIcon(1, forks),
                                  _genStartIcon(2, forks),
                                  _genStartIcon(3, forks),
                                  _genStartIcon(4, forks),
                                  Container(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        "create : " +
                                            itemData["created_at"]
                                                .toString()
                                                .split("T")[0],
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.lightGreen),
                                      )),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        "update : " +
                                            itemData["updated_at"]
                                                .toString()
                                                .split("T")[0],
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.lightGreen),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              ) ;
            },
          );
        }
        return CircularProgressIndicator();
      },
    );
  }

  // for start's icon
  Icon _genStartIcon(int index, int forks) {
    double flag = (forks / 500.0) - index;
    if (flag > 1) {
      return Icon(
        Icons.star,
        color: Colors.blue,
        size: 12,
      );
    } else if (flag > 0.5) {
      return Icon(
        Icons.star_half,
        color: Colors.blue,
        size: 12,
      );
    }
    return Icon(
      Icons.star_border,
      color: Colors.grey,
      size: 12,
    );
  }

  _loadGitData() async {
    var httpClient = new HttpClient();
    var request = await httpClient
        .getUrl(Uri.parse('https://api.github.com/orgs/Tencent/repos'));
    var response = await request.close();
    if (response.statusCode != 200) {
      print("response is fail ::: code ${response.statusCode}");
      return;
    }
    var responseBody = await response.transform(utf8.decoder).join();

    var jsonData = jsonDecode(responseBody);

    for (var s in jsonData) {
      print(s);
    }
  }
}
