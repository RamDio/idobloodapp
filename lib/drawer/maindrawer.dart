import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idobloodapp/home/events.dart';
import 'package:idobloodapp/home/home.dart';
import 'package:idobloodapp/home/profile.dart';
import 'package:idobloodapp/home/rewards.dart';


class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(''),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/diomar.png'),
              ),
              // color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.home),
            title: Text("DASHBOARD",
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
              FontAwesomeIcons.moneyBill,
              color: Colors.green,
            ),
            title: Text("Profile",
                style: TextStyle(
                  fontSize: 18,
                )),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Profile()));
            },
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.coins,
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
            leading: Icon(FontAwesomeIcons.clock, color: Colors.blue),
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
