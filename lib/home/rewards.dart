import 'package:flutter/material.dart';
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
        title:  Padding(
          padding: const EdgeInsets.only(left:25.0),
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
                  color:  Color.fromRGBO(244, 13, 48, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Center(child: Column(
                      children: <Widget>[
                        Text("0",style:TextStyle(fontSize: 80,fontWeight: FontWeight.w900)),
                        Text("POINTS",style:TextStyle(fontSize: 50,fontWeight: FontWeight.w900)),
                      ],
                    )),
                    
                    ],
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
