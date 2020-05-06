import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idobloodapp/home/events.dart';
import 'package:idobloodapp/home/home.dart';
import 'package:idobloodapp/home/profile.dart';
import 'package:idobloodapp/home/rewards.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert'
;
class MainDrawer extends StatelessWidget {

   List data;
  var _isLoading = false;

  String username = "username ",
      firstname = "firstname",
      lastname = "lastname",
      bloodtype="bloodtype",
      address="address",      gender = "gender ";


int contact;
  Future<String> getLogin(String id) async {
    var response = await http.get(
        Uri.encodeFull(
            "https://idobloodadmin.000webhostapp.com/consultprofile.php?ID=" +
                id +
                ""),
        headers: {"Accept": "application/json"});

    // setState(() {
    //   _isLoading = true;
    //   var convertDataToJson = json.decode(response.body);
    //   data = convertDataToJson['result'];
    //   if (data != null) {
    //     username = data[0]['username'];
    //     firstname = data[0]['firstname'];
    //     lastname = data[0]['lastname'];
    //     gender = data[0]['gender'];
    //     contact=data[0]['contact'];
    //     address =data[0]['address'];
    //     bloodtype=data[0]['bloodtype'];
    //   }
    // });
    print(data);
  }

  var idUser;
  MainDrawer({Key key, this.idUser,this.firstname,this.lastname,this.address,this.contact,this.bloodtype,this.username}) : super(key: key);

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
            decoration: BoxDecoration(color: Colors.red),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: 
                    AssetImage('asset/kitty.jpeg'),
                  ),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text("${this.firstname}",
                        style: TextStyle(color: Colors.white, fontSize: 20.0))),
                Align(
                    alignment: Alignment.centerRight + Alignment(0, .4),
                    child: Text('hb123',
                        style: TextStyle(color: Colors.white, fontSize: 18.0))),
              ],
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.home),
            title: Text("My Profile",
                style: TextStyle(
                  fontSize: 18,
                )),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => Home()));
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
            title: Text("Blood Info",
                style: TextStyle(
                  fontSize: 18,
                )),
            onTap: () {
              var route = new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new Profile(idUser: this.idUser));
                         Navigator.of(context).push(route);
              // Navigator.of(context).pop();
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (BuildContext context) => Profile()));
            },
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.calendarWeek,
              color: Colors.red,
            ),
            title: Text("Updates and Events",
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
            leading: Icon(FontAwesomeIcons.trophy, color: Colors.blue),
            title: Text("Rewards",
                style: TextStyle(
                  fontSize: 18,
                )),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Rewards()));
            },
          ),
        ],
      ),
    );
  }
}
