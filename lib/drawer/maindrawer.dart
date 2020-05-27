import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idobloodapp/home/bloodinfo.dart';
import 'package:idobloodapp/home/events.dart';
import 'package:idobloodapp/home/home.dart';
import 'package:idobloodapp/home/rewards.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert'
;
class MainDrawer extends StatelessWidget {

   


  
  MainDrawer({Key key, }) : super(key: key);

  // @override
  // void initState() {
  //   super.initState();
  //   setState(() {
  //     getLogin(widget.idUser);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration
            (
                gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.1, 0.3, 0.7, 1],
      colors: [Colors.green, Colors.blue, Colors.orange, Colors.pink])
            ),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  // child: CircleAvatar(
                  //   radius: 50,
                  //   backgroundImage: 
                  //   AssetImage('asset/kitty.jpeg'),
                  // ),
                  child: Image.asset("asset/rlogo.png"),
                ),
               
               
              ],
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.home),
            title: Text("Blood Drive Info",
                style: TextStyle(
                  fontSize: 18,
                )),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => Events()));
            },
          ),
          new Divider(
            color: Colors.black,
            indent: 100.0,
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.user,
              color: Colors.green,
            ),
            title: Text("Events",
                style: TextStyle(
                  fontSize: 18,
                )),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Events()));
            },
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.calendarWeek,
              color: Colors.red,
            ),
            title: Text("My Profile",
                style: TextStyle(
                  fontSize: 18,
                )),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Home()));
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.trophy, color: Colors.blue),
            title: Text("Donation Benefits and Blood Info",
                style: TextStyle(
                  fontSize: 18,
                )),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => BloodInfo()));
            },
          ),
        ],
      ),
    );
  }
}
