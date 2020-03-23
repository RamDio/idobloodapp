
import 'package:flutter/material.dart';
import 'package:idobloodapp/home/home.dart';
import 'login.dart';
import 'dart:async';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState(){
    super.initState();
    Future.delayed(
      Duration(seconds: 4),
      (){
        Navigator.push(
          context, MaterialPageRoute(
            builder: (context) => Login(),
            ));
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Container(
          child: Image.asset("asset/blood.png",height: 200,width: 200),
        ),
      )

    );
  }
}