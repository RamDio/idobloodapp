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
  var _isSecured = true;
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
    var url = "https://idobloodadmin.000webhostapp.com/insertuser.php";

    http.post(url, body: {
      "firstname": _firstnameController.text,
      "lastname": _lastnameController.text,
      "gender": _genderController.text,
      "contact": _contactController.text,
      "address": _addressController.text,
      "bloodtype": _bloodtypeController.text,
      "username": _usernameController.text,
      "password": _passwordController.text
    });
    onCreatedAccount();
    //print(_adresseController.text);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Padding(
        padding: const EdgeInsets.only(
            left: 16.0, top: 30.0, right: 16.0, bottom: 16.0),
        child: ListView(
          children: <Widget>[
            Text("data"),
            new ListTile(
              title: Card(
                child: TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                      ),
                      labelText: "First Name : ",
                      hintText: " First Name ",
                      border: InputBorder.none),
                  controller: _firstnameController,
                ),
              ),
            ),
            new ListTile(
              title: TextField(
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                    ),
                    labelText: "Last Name : ",
                    hintText: " Last Name ",
                    border: InputBorder.none),
                controller: _lastnameController,
              ),
            ),
            new ListTile(
              title: TextField(
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                    ),
                    labelText: "Gender : ",
                    hintText: " Gender ",
                    border: InputBorder.none),
                controller: _genderController,
              ),
            ),
            new ListTile(
              title: TextField(
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.phone,
                    ),
                    labelText: "Contact Number : ",
                    hintText: " Contact Number ",
                    border: InputBorder.none),
                controller: _contactController,
              ),
            ),
            new ListTile(
              title: TextField(
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.home,
                    ),
                    labelText: "Address : ",
                    hintText: " Address ",border: InputBorder.none),
                controller: _addressController,
              ),
            ),
            new ListTile(
              title: TextField(
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.pin_drop,
                    ),
                    labelText: "Bloodtype : ",
                    hintText: " Bloodtype ",border: InputBorder.none),
                controller: _bloodtypeController,
              ),
            ),
            new ListTile(
              title: TextField(
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                    ),
                    labelText: "UserName : ",
                    hintText: " User Name ",border: InputBorder.none),
                controller: _usernameController,
              ),
            ),
            new ListTile(
              title: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    icon: new IconButton(
                        icon: Icon(
                          Icons.remove_red_eye,
                        ),
                        onPressed: () {
                          setState(() {
                            _isSecured = !_isSecured;
                          });
                        }),
                    labelText: "Password : ",
                    hintText: "Password ",border: InputBorder.none),
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
              },
            ),
            new RaisedButton(
              child: Text("Register"),
              onPressed: () {
                _addData();
              },
            ),
          ],
        ),
      ),
    );
  }
}
