import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:idobloodapp/home/home.dart';
<<<<<<< HEAD
import 'loading/loading.dart';
=======

>>>>>>> register edited 1
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

  String error = '';
<<<<<<< HEAD
=======
  String firstname = '';
  String lastname = '';
  String contact = '';
  String address = '';
  String username = '';
>>>>>>> register edited 1
  String password = '';
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

  var gender = ['Male', 'Female'];

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
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/peso.jpg'), fit: BoxFit.cover)),
        child: Form(
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
                  title: TextFormField(
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                        ),
                        labelText: "First Name  ",
                        hintText: " First Name ",
                       fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(
                        color: Colors.pink,
                      ),
                    ),),
                    controller: _firstnameController,
                  ),
                ),

                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                    ),
                    labelText: "Last Name ",
                    hintText: " Last Name ",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(
                        color: Colors.pink,
                      ),
                    ),
                  ),
                  validator: (val) =>
                      val.isEmpty ? 'Enter your lastname' : null,
                  onChanged: (val) {
                    setState(() => lastname = val);
                  },
                  controller: _lastnameController,
                ),

                TextFormField(
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
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ),

                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.phone,
                    ),
                    labelText: "Contact Number ",
                    hintText: " Contact Number ",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(
                        color: Colors.pink,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (val) => val.length < 11
                      ? 'Enter 11 digits'
                      : val.isEmpty ? 'Enter number' : null,
                  onChanged: (val) {
                    setState(() => contact = val);
                  },
                  controller: _contactController,
                ),

                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.home,
                    ),
                    labelText: "Address  ",
                    hintText: " Address ",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(
                        color: Colors.pink,
                      ),
                    ),
                  ),
                  validator: (val) => val.isEmpty ? 'Enter Address' : null,
                  onChanged: (val) {
                    setState(() => address = val);
                  },
                  controller: _addressController,
                ),

                TextFormField(
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
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ),

                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                    ),
                    labelText: "UserName  ",
                    hintText: " User Name ",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(
                        color: Colors.pink,
                      ),
                    ),
                  ),
                  validator: (val) => val.isEmpty ? 'Enter Username' : null,
                  onChanged: (val) {
                    setState(() => username = val);
                  },
                  controller: _usernameController,
                ),

                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password  ",
                    hintText: "Password ",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(
                        color: Colors.pink,
                      ),
                    ),
                    icon: new IconButton(
                        icon: Icon(
                          Icons.remove_red_eye,
                        ),
                        onPressed: () {
                          setState(() {
                            _isSecured = !_isSecured;
                          });
                        }),
                  ),
                  validator: (val) => val.length < 8
                      ? 'Password must be 8 characters long'
                      : val.isEmpty ? 'Enter password' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                  controller: _passwordController,
                ),

                SizedBox(height: 20.0),
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
                    if (formKey.currentState.validate()) {
                      _addData();
                    } else {
                      error = 'Please Input the blank spaces';
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
