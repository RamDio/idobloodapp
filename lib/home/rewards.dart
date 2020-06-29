import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../drawer/maindrawer.dart';
import 'updateprofile.dart';

class Rewards extends StatefulWidget {
  @override
  _RewardsState createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 13, 48, 1),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(244, 13, 48, 1),
        title: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            "Reward Points",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      // drawer: MainDrawer(),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(244, 13, 48, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: ListView(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                              child: Column(
                            children: <Widget>[
                              Text("1",
                                  style: TextStyle(
                                      fontSize: 80,
                                      fontWeight: FontWeight.w900)),
                              Text("POINT/S",
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.w900)),
                            ],
                          )),
                          ListTile(
                            title: SizedBox(
                              height: 80,
                              child: Card(
                                elevation: 10,
                                child: new ListTile(
                                  title: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 3.0),
                                        child: Center(
                                          child: new Text("P100 Load",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 25)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: new Text("1 Pt.",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20)),
                                      ),
                                    ],
                                  ),
                                  leading: new Icon(
                                    FontAwesomeIcons.checkCircle,
                                    size: 40,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            title: SizedBox(
                              height: 80,
                              child: Card(
                                elevation: 10,
                                child: new ListTile(
                                  title: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 0.0),
                                        child: Center(
                                          child: new Text("P200 Load",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 25)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: new Text("2 Pts.",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20)),
                                      ),
                                    ],
                                  ),
                                  leading: new Icon(
                                    FontAwesomeIcons.checkCircle,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            title: SizedBox(
                              height: 80,
                              child: Card(
                                elevation: 10,
                                child: new ListTile(
                                  title: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 0.0),
                                        child: Center(
                                          child: new Text("P300 Load",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 25)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: new Text("3 Pts.",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20)),
                                      ),
                                    ],
                                  ),
                                  leading: new Icon(
                                    FontAwesomeIcons.checkCircle,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            title: SizedBox(
                              height: 80,
                              child: Card(
                                elevation: 10,
                                child: new ListTile(
                                  title: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 0.0),
                                        child: Center(
                                          child: new Text("P400 Load",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 25)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: new Text("4 Pts.",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20)),
                                      ),
                                    ],
                                  ),
                                  leading: new Icon(
                                    FontAwesomeIcons.checkCircle,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            title: SizedBox(
                              height: 80,
                              child: Card(
                                elevation: 10,
                                child: new ListTile(
                                  title: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 0.0),
                                        child: Center(
                                          child: new Text("P500 Load",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 25)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: new Text("5 Pts.",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20)),
                                      ),
                                    ],
                                  ),
                                  leading: new Icon(
                                    FontAwesomeIcons.checkCircle,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
