import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:idobloodapp/drawer/maindrawer.dart';

import '../drawer/maindrawer.dart';

class Profile extends StatefulWidget {
  var idUser;
  Profile({Key key, this.idUser}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

 var _isLoading = false;
   var data;

  
  
  var _firstname = "";
  var _lastname = "";
  var _gender = "";
  var _contact="";
  var _address="";
  var _bloodtype="";
  var _username = "";

  


  Future<List> getData()async{
    final response= await http.get("https://idobloodadmin.000webhostapp.com/fetchdata.php");
  return json.decode(response.body);
  
  }

  _fetchData() async {
    final url =
        "https://idobloodadmin.000webhostapp.com/consultprofile.php?ID=${widget.idUser}";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final map = json.decode(response.body);
      final videosMap = map["result"];

      setState(() {
        _isLoading = true;
        this.data = videosMap;
        _firstname = data[0]['firstname'];
        _lastname = data[0]['lastname'];
        _gender = data[0]['gender'];
        _contact=data[0]['contact'];
        _address=data[0]['address'];
        _bloodtype=data[0]['bloodtype'];
        _username = data[0]['username'];
        print(data);
      });
    }
  }

   @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(
          title: Text("Update Profile"),
        ),
        body: new Center(
          child: data == null
              ? new CircularProgressIndicator()
              : new ListView(
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          new Padding(
                            padding:
                                const EdgeInsets.only(top: 4.0, bottom: 25.0),
                            child: Center(
                              child: Text(
                                "Update your Profile",
                                textScaleFactor: 3.0,
                              ),
                            ),
                          ),
                          
                          TextField(
                            decoration: InputDecoration(
                                labelText: ("First Name : "),
                                filled: true,
                                hintText: _firstname),
                          
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                labelText: ("Last Name : "),
                                filled: true,
                                hintText: _lastname),
                            
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                labelText: ("Gender : "),
                                filled: true,
                                hintText: _gender),
                           
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                labelText: ("Contact : "),
                                filled: true,
                                hintText: _contact),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                labelText: ("Address : "),
                                filled: true,
                                hintText: _address),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                labelText: ("Blood Type : "),
                                filled: true,
                                hintText: _bloodtype),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                       TextField(
                            decoration: InputDecoration(
                                labelText: ("User Name : "),
                                filled: true,
                                hintText: _username),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
        )
    );
  }
}

