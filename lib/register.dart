
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:idobloodapp/home/home.dart';
import 'login.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

 void onCreatedAccount() {
    var alert = new AlertDialog(
      title: new Text('Info'),
      content: new SingleChildScrollView(
        child: new ListBody(
          children: <Widget>[
            new Text('You have created a new Account.'),
          ],
        ),
      ),
      actions: <Widget>[
        new FlatButton(
          child: new Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
    showDialog(context: context, child: alert);
  }

  
  var _firstnameController = new TextEditingController();
  var _lastnameController = new TextEditingController();
  var _genderController = new TextEditingController();
  var _contactController = new TextEditingController();
  var _addressController = new TextEditingController();
  var _bloodtypeController = new TextEditingController();
   var _usernameController = new TextEditingController();
  var _passwordController = new TextEditingController();
  void _addData() {
    var url =
        "https://idobloodadmin.000webhostapp.com/insertuser.php";

    http.post(url, body: {
      
      "firstname": _firstnameController.text,
      "lastname": _lastnameController.text,
      "gender": _genderController.text,
      "contact":_contactController.text,
      "address":_addressController.text,
      "bloodtype":_bloodtypeController.text,
      "username": _usernameController.text,
      "password": _passwordController.text
    });
    onCreatedAccount();
    //print(_adresseController.text);
  }



  @override
  Widget build(BuildContext context) {
   return new Scaffold(
      appBar: AppBar(),
      body: new Padding(
        padding: const EdgeInsets.only(
            left: 16.0, top: 30.0, right: 16.0, bottom: 16.0),
        child: ListView(
          children: <Widget>[
           
            new ListTile(
              leading: const Icon(Icons.person),
              title: TextField(
                decoration: InputDecoration(
                    labelText: "First Name : ", hintText: " First Name "),
                controller: _firstnameController,
              ),
            ),
             new ListTile(
              leading: const Icon(Icons.person),
              title: TextField(
                decoration: InputDecoration(
                    labelText: "Last Name : ", hintText: " Last Name "),
                controller: _lastnameController,
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.person),
              title: TextField(
                decoration: InputDecoration(
                    labelText: "Gender : ", hintText: " Gender "),
                controller: _genderController,
              ),
            ),
             new ListTile(
              leading: const Icon(Icons.person),
              title: TextField(
                decoration: InputDecoration(
                    labelText: "Contact Number : ", hintText: " Contact Number "),
                controller: _contactController,
              ),
            ),
             new ListTile(
              leading: const Icon(Icons.person),
              title: TextField(
                decoration: InputDecoration(
                    labelText: "Address : ", hintText: " Address "),
                controller: _addressController,
              ),
            ),
             new ListTile(
              leading: const Icon(Icons.person),
              title: TextField(
                decoration: InputDecoration(
                    labelText: "Bloodtype : ", hintText: " Bloodtype "),
                controller: _bloodtypeController,
              ),
            ),
             new ListTile(
              leading: const Icon(Icons.person),
              title: TextField(
                decoration: InputDecoration(
                    labelText: "UserName : ", hintText: " User Name "),
                controller: _usernameController,
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.remove_red_eye),
              title: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password : ", hintText: "Password "),
                controller: _passwordController,
              ),
            ),
            SizedBox(
              height: 25.0,
            ),

            new RaisedButton(
              child: Text("Cancel"),
               onPressed: () {
                      Navigator.of(context).pop();
                      //_UpdateData(widget.idUser, _nom.text, _pseudo.text, _prenom.text, _numTel.text);
                    },),
                    new RaisedButton(
              child: Text("Register"),
                onPressed: () {
                      _addData();
                    },),
          ],
        ),
      ),
    );
  }
}