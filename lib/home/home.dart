

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:idobloodapp/drawer/maindrawer.dart';
import 'package:idobloodapp/home/updateprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login.dart';
import 'donationhistory.dart';
import 'rewards.dart';

class Home extends StatelessWidget {
  var idUser,
      data,
      username,
      firstname,
      lastname,
      gender,
      contact,
      address,
      bloodtype;
  Home(
      {Key key,
      this.idUser,
      this.firstname,
      this.lastname,
      this.username,
      this.gender,
      this.contact,
      this.address,
      this.bloodtype})
      : super(key: key);

      Widget _fullname() {
    TextStyle _nametextstyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
    );

    return Text(
      "$firstname $lastname",
      style: _nametextstyle,
    );
  }

  Widget _username(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        "$username",
        style: TextStyle(
            fontFamily: 'Spectral',
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.w300),
      ),
    );
  }

  Widget _separator(Size screenSize) {
    return Container(
      width: screenSize.width ,
      height: 2.0,
      color: Colors.black54,
      margin: EdgeInsets.only(top: 4.0),
    );
  }

 

  Widget _info(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 18.0),
      child: Column(
        children: <Widget>[
          Text("$gender",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              )),
          Text("$contact",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              )),
          Text("$address",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              )),
          Text("$bloodtype",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              )),
        ],
      ),
    );
  }

  

  @override
  Widget build(BuildContext context) {
        Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.red,
        title: Text(
          "",
          style: TextStyle(color: Colors.black),
        ),

        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(FontAwesomeIcons.signOutAlt),
            label: Text('LOGOUT'),
            onPressed: () async {
               SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.remove('username');
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext ctx) => Login()));
            },
          )
        ], //remove drop shadow
      ),
      drawer: MainDrawer(),
       body: Stack(
          children: <Widget>[
            _coverimage(screenSize),
            SafeArea(
                child: SingleChildScrollView(
              child: Column(children: <Widget>[
                SizedBox(
                  height: screenSize.height / 14.4,
                ),
                _profileimage(),
                _fullname(),
                _username(context),
                _separator(screenSize),
                _info(context),
                _buttons(context),
              ]),
            ))
          ],
        ),
    );
  }
}

Widget _coverimage(Size screenSize) {
  return Container(
    height: screenSize.height / 5.6,
    decoration: BoxDecoration(
      color: Colors.red,
    ),
  );
}

Widget _profileimage() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Row(
          children: <Widget>[
            Container(
              width: 140.0,
              height: 140.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("asset/kitty.jpeg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(80.0),
                  border: Border.all(color: Colors.white, width: 10.0)),
                  
            ),
            FlatButton.icon(
            icon: Icon(FontAwesomeIcons.edit),
           label: Text(""),
            onPressed: () async {
      
                             
            },
          )
          ],
        ),
      ),
    ),
  );
}

Widget _buttons(BuildContext context){
  return Padding(padding: EdgeInsets.symmetric(
    vertical: 40.0,horizontal:16.0
  ),
  child: Row(children: <Widget>[
    Expanded(child: InkWell(onTap:(){
      Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => Rewards()));
    } ,
    child: Container(
      height:40.0,
      decoration:BoxDecoration(
        border: Border.all(),
        color: Color(0xFF404A5C)
      ),
      child: Center(
        child: Text("REWARDS",
        style: TextStyle(
          color:Colors.white,
          fontWeight:FontWeight.w600,
        ),
        ),
      ),
    ),
    ),
    ),
    SizedBox(width: 10.0,),
    Expanded(child: InkWell(onTap:(){
      Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => DonationHistory()));
    } ,
    child: Container(
      height:40.0,
      decoration:BoxDecoration(
        border: Border.all(),
       
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Donation History",
          style: TextStyle(
            
            fontWeight:FontWeight.w600,
          ),
          ),
        ),
      ),
    ),
    ),
    ),
    SizedBox(width: 10.0,)
  ],),
  );
}