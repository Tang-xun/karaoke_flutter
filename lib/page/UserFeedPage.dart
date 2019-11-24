import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:karaoke_flutter/utils/LogUtils.dart';

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
              var name = repoData[index]["name"];
              int forks = repoData[index]["forks"];
              LogUtils.i(TAG, "name : $name forks: $forks");
              return new Card(
                  elevation: 2.0,
                  borderOnForeground: true,
                  margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  child: Row(
                    children: <Widget>[
                      Container(
                          child: Image.asset(
                            "./assets/imgs/tencent.png",
                            width: 45,
                            height: 45,
                            alignment: Alignment.centerLeft,
                          ),
                          margin: EdgeInsets.fromLTRB(15, 20, 15, 20)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "${repoData[index]["name"]}",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${repoData[index]["description"]}',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                            softWrap: true,
                          ),
                          Row(
                            children: <Widget>[
                              _genStartIcon(0, forks),
                              _genStartIcon(1, forks),
                              _genStartIcon(2, forks),
                              _genStartIcon(3, forks),
                              _genStartIcon(4, forks),
                              Text(
                                '${repoData[index]["created_at"]}',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 8, color: Colors.black38),
                              ),
                              Text(
                                '${repoData[index]["update_at"]}',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 8, color: Colors.black38),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ));
            },
          );
        }
        return CircularProgressIndicator();
      },
    );
  }

  Icon _genStartIcon(int index, int forks) {
    double size = (forks / 500.0);
    if (size - index > 1) {
      return Icon(
        Icons.star,
        color: Colors.blue,
        size: 12,
      );
    } else if (size - index > 0.5) {
      return Icon(
        Icons.star_half,
        color: Colors.blue,
        size: 12,
      );
    } else {
      return Icon(
        Icons.star_border,
        color: Colors.grey,
        size: 12,
      );
    }
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
