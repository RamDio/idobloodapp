import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../drawer/maindrawer.dart';
import 'bloodinfo/a.dart';
import 'bloodinfo/ab.dart';
import 'bloodinfo/b.dart';
import 'bloodinfo/o.dart';
import 'updateprofile.dart';

class BloodInfo extends StatefulWidget {
  @override
  _BloodInfoState createState() => _BloodInfoState();
}

class _BloodInfoState extends State<BloodInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 13, 48, 1),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(244, 13, 48, 1),
        title: Text(
          "Blood Information",
          style: TextStyle(color: Colors.black),
        ),
      ),
      drawer: MainDrawer(),
      body: ListView(
        children: <Widget>[
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 0.0, top: 80.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: SizedBox(
                          height: 120.0,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => A()));
                            },
                            child: Card(
                              elevation: 10,
                              child: Center(
                                  child: Row(
                                children: <Widget>[
                                  new Image.asset(
                                    'asset/drop.png',
                                    width: 70.0,
                                    height: 120.0,
                                    fit: BoxFit.cover,
                                  ),
                                  Text(
                                    "What Is Blood?",
                                    style: TextStyle(fontSize: 30.0),
                                  ),
                                ],
                              )),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: SizedBox(
                          height: 120.0,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => B()));
                            },
                            child: Card(
                              elevation: 10,
                              child: Row(
                                children: <Widget>[
                                  new Image.asset(
                                    'asset/bloodfacts.jpg',
                                    width: 80.0,
                                    height: 120.0,
                                    fit: BoxFit.cover,
                                  ),
                                  Text(
                                    "Blood Fact",
                                    style: TextStyle(fontSize: 30.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: SizedBox(
                          height: 120.0,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => O()));
                            },
                            child: Card(
                              elevation: 10,
                              child: Center(
                                  child: Row(
                                    children: <Widget>[
                                      new Image.asset(
                                    'asset/bloodtype.jpg',
                                    width: 80.0,
                                    height: 120.0,
                                    fit: BoxFit.cover,
                                  ),
                                      Text(
                                "Blood Types",
                                style: TextStyle(fontSize: 30.0),
                              ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: SizedBox(
                          height: 120.0,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => AB()));
                            },
                            child: Card(
                              elevation: 10,
                              child: Center(
                                  child: Row(
                                    children: <Widget>[
                                        new Image.asset(
                                    'asset/blooddonation.png',
                                    width: 80.0,
                                    height: 120.0,
                                    fit: BoxFit.cover,
                                  ),
                                      Text(
                                "Benefits of Blood ""\n""Donation",
                                style: TextStyle(fontSize: 25.0),
                              ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        ],
      ),
    );
  }
}
