import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../drawer/maindrawer.dart';
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
          "Blood Type Info",
          style: TextStyle(color: Colors.black),
        ),
      ),
      drawer: MainDrawer(),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 0.0,top:80.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: SizedBox(
                      height: 120.0,
                      width: 120.0,
                      child: Card(
                        elevation: 10,
                        child: Center(child: Text("A",style: TextStyle(
                          fontSize:50.0
                        ),)),
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: SizedBox(
                      height: 120.0,
                      width: 120.0,
                      child: Card(
                        elevation: 10,
                        child: Center(child: Text("B",style: TextStyle(
                          fontSize:50.0
                        ),)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0.0,top:20.0),
              child: Row(
                children: <Widget>[
                   Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: SizedBox(
                      height: 120.0,
                      width: 120.0,
                      child: Card(
                        elevation: 10,
                        child: Center(child: Text("O",style: TextStyle(
                          fontSize:50.0
                        ),)),
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: SizedBox(
                      height: 120.0,
                      width: 120.0,
                      child: Card(
                        elevation: 10,
                        child: Center(child: Text("AB",style: TextStyle(
                          fontSize:50.0
                        ),)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
