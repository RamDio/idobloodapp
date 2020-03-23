import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


String username='';


class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() =>  _RegistrationState();
}

class _RegistrationState extends State<Registration> {

TextEditingController name=new TextEditingController();
TextEditingController email=new TextEditingController();
TextEditingController mobile=new TextEditingController();

Future<List> senddata() async {
  final response = await http.post("https://idobloodadmin.000webhostapp.com/insertdata.php", body: {
    "name": name.text,
    "email": email.text,
    "mobile":mobile.text,
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register"),),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Username",style: TextStyle(fontSize: 18.0),),
              TextField(   
                controller: name,                
                decoration: InputDecoration(
                  hintText: 'name'
                ),           
                ),
              Text("Email",style: TextStyle(fontSize: 18.0),),
              TextField(  
                controller: email,      
                 decoration: InputDecoration(
                  hintText: 'Email'
                ),                
                ),
                Text("Mobile",style: TextStyle(fontSize: 18.0),),
              TextField(  
                controller: mobile,        
                 decoration: InputDecoration(
                  hintText: 'Mobile'
                ),                
                ),
              
              RaisedButton(
                child: Text("Register"),
                onPressed: (){
                  senddata;
                },
              ),

             

            ],
          ),
        ),
      ),
    );
}
}