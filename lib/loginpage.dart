import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:idobloodapp/home/home.dart';
import 'login.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient:LinearGradient(
          colors:[
            Colors.blue,Colors.teal,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
          ),

      ),
      child: ListView(
        children:<Widget>[
          headerSection(),
          textSection(),
          buttonSection(),

        ],
      ),
      
    );
  }


  Container buttonSection(){
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top:30.0),
      padding: EdgeInsets.symmetric(horizontal:20.0),
      child: RaisedButton(
        onPressed:(){
          signIn();
        },
        color:Colors.purple,
        shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(5.0),
        ),
        child: Text("Sign In",style:TextStyle(color: Colors.white70)),
         ),
    );

  }


  Container textSection(){

    return Container(
      padding: EdgeInsets.symmetric(horizontal:20.0),
      margin: EdgeInsets.only(top:30.0),
      child:Column(
        children:<Widget>[
          txtSection("Username",Icons.person),
          SizedBox(height:30.0),
          txtSection("Password",Icons.lock),
        ]
      ) ,

    );
  }

  TextFormField txtSection(String title, IconData icon){
    return TextFormField(
      obscureText: title=="Username" ? false:true,
      style: TextStyle(
        color:Colors.white70
      ),
      decoration: InputDecoration(
        hintText:title,
        hintStyle:TextStyle(color: Colors.white70),
        icon:Icon(icon)
      ),

    );
  }



  Container headerSection(){

  return Container(
    padding: EdgeInsets.symmetric(
      horizontal:20.0,vertical:30.0
    ),
    child: Text("IDOBLOOD",style: TextStyle(
      color:Colors.white,
    ),),
  );
  }
}