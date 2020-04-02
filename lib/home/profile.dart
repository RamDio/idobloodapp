// import 'package:econstat/update_profile.dart';
import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:idobloodapp/home/updateprofile.dart';

class Profile extends StatefulWidget {
  var idUser;
  Profile({Key key, this.idUser}) : super(key: key);
  @override
  _ProfileState createState() => new _ProfileState();
}

class _ProfileState extends State<Profile> {
  List data;
  var _isLoading = false;
  String firstname = "FirstName ",
      lastname = "LastName ",
      gender = "Gender ",
      address="address",
      bloodtype="bloodtype",
      username = "userName ";
  int contact;

  /**************** Get Login Connection && Data ************************/
  Future<String> getLogin(String id) async {
    var response = await http.get(
        Uri.encodeFull(
            "https://idobloodadmin.000webhostapp.com/consultprofile.php?ID=" +
                id +
                ""),
        headers: {"Accept": "application/json"});

    setState(() {
      _isLoading = true;
      var convertDataToJson = json.decode(response.body);
      data = convertDataToJson['result'];
      if (data != null) {
       
        firstname = data[0]['firstname'];
        lastname = data[0]['lastname'];
        gender = data[0]['gender'];
        contact=data[0]['contact'];
        address=data[0]['address'];
        bloodtype=data[0]['bloodtype'];
        username = data[0]['username'];
      }
    });
    print(data);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getLogin(widget.idUser);
    });
  }

  // _launchURL() async {
  //   const url = 'tel:27181132';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not make Call';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    {
      return new Scaffold(
        appBar: AppBar(
          title: Text(" Menu"),
          actions: <Widget>[
            // new IconButton(
            //     icon: new Icon(Icons.call),
            //     onPressed: () {
            //       _launchURL();
            //     }),

            // action button
            new IconButton(
              icon: new Icon(Icons.map),
              onPressed: () {},
            ),
          ],
        ),
        body: !_isLoading
            ? new CircularProgressIndicator()
            : new Container(
                child: new Center(
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            new Container(
                              width: 60.0,
                              height: 60.0,
                              child: new CircleAvatar(
                                minRadius: 50.0,
                                backgroundColor: Colors.blue.shade50,
                                child: new Text(gender),
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              username,
                              style: TextStyle(fontSize: 20.0),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        new Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    "User Name : ",
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    username,
                                    style: TextStyle(fontSize: 20.0),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Last Name : ",
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    lastname,
                                    style: TextStyle(fontSize: 20.0),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "First Name : ",
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    firstname,
                                    style: TextStyle(fontSize: 20.0),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Gender : ",
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    gender,
                                    style: TextStyle(fontSize: 20.0),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        new ButtonBarTheme(
                          data: null,
                          // make buttons use the appropriate styles for cards
                          child: new ButtonBar(
                            children: <Widget>[
                              new FlatButton(
                                child: const Text('Update'),
                                onPressed: () {
                                  var route = new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        new Updateprofile(
                                          idUser: widget.idUser,
                                        ),
                                  );
                                  Navigator.of(context).push(route);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      );
    }
  }
}