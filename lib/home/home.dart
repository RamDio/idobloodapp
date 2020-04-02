import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idobloodapp/drawer/maindrawer.dart';

class Home extends StatelessWidget {
  
  var idUser,username,firstname,lastname,gender,contact,address,bloodtype;
  Home({Key key, this.idUser,this.firstname,this.lastname,this.username,this.gender,this.contact,this.address,this.bloodtype}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "OVERVIEW",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
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
          children:<Widget>[
            Text("firstname $firstname"),
             Text("lastname $lastname"),
              Text("username $username"),
               Text("gender $gender"),
                Text("contact $contact"),
                 Text("address $address"),
                  Text("bloodtype $bloodtype"),

          ]
        ),
    );
  }


  
}