
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
        elevation:0.0,
         backgroundColor: Color.fromRGBO(244, 13, 48, 1),
        title: Text(
          "",
          style: TextStyle(color: Colors.black),
        ),
    
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(FontAwesomeIcons.signOutAlt),
            label: Text('LOGOUT'),
            onPressed: () async {
              // await _auth.signOut();
            },
          )
        ], //remove drop shadow
      ),

        drawer:MainDrawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        
          children:<Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 100.0,top:7.0),
                  child: Row(
                    children: <Widget>[
                     
                         Padding(
                           padding: const EdgeInsets.only(left:28.0),
                           child: Row(
                             children: <Widget>[
                               Text("",
                               style:TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 28.0, color: Colors.white
                                
                                )
                               
                               ),
                             ],
                           ),
                         ),
                    ],
                  ),
                ),
           
              ],
            ),
                 Padding(
                   padding: const EdgeInsets.only(left:100.0),
                   child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                                              child: Column(
                          children: <Widget>[

                            Text("",
                            style:TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 28.0, color: Colors.white,
                            
                            
                            ),
                             overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                ),
                 ),
            
              Padding(
                padding: const EdgeInsets.only(left:0.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left:48.0),
                      child: Column(
                        children: <Widget>[
                          Text("RANK ",
                           style:TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 28.0, color: Colors.white,
                          ),
                          
                          ),
                          Text("Bronze ",
                           style:TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 28.0, color: Colors.white,
                          ),
                          
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:48.0),
                      child: Column(
                        children: <Widget>[
                          Text("POINTS",
                           style:TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 28.0, color: Colors.white,
                          ),
                          
                          ),
                          Text("0 ",
                           style:TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 28.0, color: Colors.white,
                          ),
                          
                          ),
                        ],
                      ),
                    ),
                   
                  ],
                ),
              ),
              
              Expanded(
                child: ListView(
                  children: <Widget>[
                    new ListTile(
                      title: Card(
                        
                      ),
                    )
                  ],
                ),
                ),

                   
          ]
        ),
    );
  }
}