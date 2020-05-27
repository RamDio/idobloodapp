import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idobloodapp/home/bloodinfo/blood.dart';
import 'package:idobloodapp/home/bloodinfo/blooddonation.dart';
import 'package:idobloodapp/home/bloodinfo/bloodtype.dart';
import '../drawer/maindrawer.dart';

import 'bloodinfo/bloodfact.dart';
import 'updateprofile.dart';

class BloodInfo extends StatefulWidget {
  @override
  _BloodInfoState createState() => _BloodInfoState();
}

class _BloodInfoState extends State<BloodInfo> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(244, 13, 48, 1),
        title: Text(
          "Blood Awareness",
          style: TextStyle(color: Colors.white),
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
                  padding: const EdgeInsets.only(left: 0.0, top: 50.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0,right:30.0),
                        child: SizedBox(
                          
                          height: 120.0,
                          child: GestureDetector(
                            
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => Blood()));
                            },
                            child: Card(
                           
                              color:Color(0xff98aad7),
                              elevation: 10,
                              child: Center(
                                  child: Row(
                                children: <Widget>[
                                  new Image.asset(
                                    'asset/bladrap.png',
                                    width: 80.0,
                                    height: 120.0,
                                    fit: BoxFit.cover,
                                  ),
                                  Text(
                                    "What Is Blood?",
                                    style: TextStyle(fontSize: 25.0,color: Colors.white,fontWeight: FontWeight.w800),
                                  ),
                                ],
                              )),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0,right:30.0),
                        child: SizedBox(
                          height: 120.0,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => Bloodfact()));
                            },
                            child: Card(
                              color:Color(0xff697fbf),
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
                                    style: TextStyle(fontSize:25.0,color: Colors.white,fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0,right:30.0),
                        child: SizedBox(
                          height: 120.0,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => Bloodtype()));
                            },
                            child: Card(
                              color:Color(0xfffbaa19),
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
                                style: TextStyle(fontSize: 25.0,color: Colors.white,fontWeight: FontWeight.w800),
                              ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0,right:30.0),
                        child: SizedBox(
                          height: 120.0,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => Blooddonation()));
                            },
                            child: Card(
                              color:Color(0xffe98324),
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
                                style: TextStyle(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.w800),
                              ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0,right:30.0),
                        child: SizedBox(
                          height: 120.0,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => Blooddonation()));
                            },
                            child: Container(
                              decoration:BoxDecoration(
                                gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.1, 0.3, 0.7, 1],
      colors: [Color(0xff98aad7), Color(0xff697fbf), Color(0xfffbaa19), Color(0xffe98324)])
                              )
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
