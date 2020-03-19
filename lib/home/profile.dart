import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idobloodapp/drawer/maindrawer.dart';

class Profile extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "MY PROFILE",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
    
      ),

        drawer:MainDrawer(),
    );
  }


  
}