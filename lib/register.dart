import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:idobloodapp/home/home.dart';
import 'loading/loading.dart';
import 'login.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = new GlobalKey<FormState>();

  String error='';
  String password='';
  var _isSecured = true;
  void onCreatedAccount() {
    var alert = new AlertDialog(
      title: Center(child: new Text('Registered')),
      content: new SingleChildScrollView(
        child: new ListBody(
          children: <Widget>[
            Center(
                child: new Text(
                    'Thanks For Signing Up Hero, Please Proceed to login Page ')),
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

  var gender=['Male','Female'];

  var bloodtype = [
    'A',
    'B',
    'O',
    'AB',
    'A+',
    'B+',
    'O+',
    'AB+',
    'A-',
    'B-',
    'O-',
    'AB-'
  ];
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
    return Scaffold(
      body: Form(
         key: formKey,
              child: new Padding(
          padding: const EdgeInsets.only(
              left: 16.0, top: 30.0, right: 16.0, bottom: 16.0),
          child: ListView(
            children: <Widget>[
              Center(
                  child: Text(
                "SIGN UP",
                style: TextStyle(fontSize: 30),
              )),
              new ListTile(
                title: Card(
                  child: TextFormField(
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                        ),
                        labelText: "First Name  ",
                        hintText: " First Name ",
                        border: InputBorder.none),
                    controller: _firstnameController,
                  
                  ),
                  
                ),
              ),
              new ListTile(
                title: Card(
                  child: TextField(
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                        ),
                        labelText: "Last Name ",
                        hintText: " Last Name ",
                        border: InputBorder.none),
                    controller: _lastnameController,
                  ),
                ),
              ),
            
              new ListTile(
                title: Card(
                  child: TextField(
                    controller: _genderController,
                    decoration: InputDecoration(
                      suffixIcon: PopupMenuButton<String>(
                        icon: const Icon(Icons.arrow_drop_down),
                        onSelected: (String value) {
                          _genderController.text = value;
                        },
                        itemBuilder: (BuildContext context) {
                          return gender
                              .map<PopupMenuItem<String>>((String value) {
                            return new PopupMenuItem(
                                child: new Text(value), value: value);
                          }).toList();
                        },
                      ),
                    ),
                  ),
                ),
              ),
              new ListTile(
                title: Card(
                  child: TextField(
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.phone,
                        ),
                        labelText: "Contact Number ",
                        hintText: " Contact Number ",
                        border: InputBorder.none),
                    controller: _contactController,
                  ),
                ),
              ),
              new ListTile(
                title: Card(
                  child: TextField(
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.home,
                        ),
                        labelText: "Address  ",
                        hintText: " Address ",
                        border: InputBorder.none),
                    controller: _addressController,
                  ),
                ),
              ),
             
              new ListTile(
                title: Card(
                  child: TextField(
                    controller: _bloodtypeController,
                    decoration: InputDecoration(
                      suffixIcon: PopupMenuButton<String>(
                        icon: const Icon(Icons.arrow_drop_down),
                        onSelected: (String value) {
                          _bloodtypeController.text = value;
                        },
                        itemBuilder: (BuildContext context) {
                          return bloodtype
                              .map<PopupMenuItem<String>>((String value) {
                            return new PopupMenuItem(
                                child: new Text(value), value: value);
                          }).toList();
                        },
                      ),
                    ),
                  ),
                ),
              ),
             

              new ListTile(
                title: Card(
                  child: TextField(
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                        ),
                        labelText: "UserName  ",
                        hintText: " User Name ",
                        border: InputBorder.none),
                    controller: _usernameController,
                  ),
                ),
              ),
              new ListTile(
                title: Card(
                  child: TextFormField(
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
                        labelText: "Password  ",
                        hintText: "Password ",
                        border: InputBorder.none),
                        validator: (val)=>val.length<8?'Password must be 8 characters long':null,
                  onChanged: (val){
                     setState(()=>password=val);
                  } ,
                    controller: _passwordController,
                  ),
                ),
              ),
              // SizedBox(
              //   height: 20.0,
              // ),
              new RaisedButton(
                child: Text("Back"),
                onPressed: () {
                  Navigator.of(context).pop();
                  //_UpdateData(widget.idUser, _nom.text, _pseudo.text, _prenom.text, _numTel.text);
                },
              ),
              new RaisedButton(
                child: Text("Register"),
                onPressed: () {
                if(formKey.currentState.validate()){
                  _addData();
                }else{
                  error='Please Input the blank spaces';
                }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
