import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';


class Profile extends StatefulWidget {
  var idUser;
  Profile({Key key, this.idUser}) : super(key: key);
  @override
  _ProfileState createState() => new _ProfileState();
}

class _ProfileState extends State<Profile> {
  List data;
  var _isLoading = false;
  String username = "userName ",
      firstname = "FirstName ",
      lastname = "LastName ",
      gender = "Gender ",
      contact="Contact",
      address="Address",
      bloodtype="Bloodtype";

  /**************** Get Login Connection && Data ************************/
  Future<String> getLogin(String id) async {
    var response = await http.get(
        Uri.encodeFull(
            "http://idobloodadmin.000webhostapp.com/php/profile.php?ID=" +
                id +
                ""),
        headers: {"Accept": "application/json"});

    setState(() {
      _isLoading = true;
      var convertDataToJson = json.decode(response.body);
      data = convertDataToJson['result'];
      if (data != null) {
        username = data[0]['username'];
        firstname = data[0]['firstname'];
        lastname = data[0]['lastname'];
        gender = data[0]['gender'];
        contact = data[0]['contact'];
        address = data[0]['address'];
        bloodtype = data[0]['bloodtype'];
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


  @override
  Widget build(BuildContext context) {
    {
      return new Scaffold(
        appBar: AppBar(
          title: Text(" Menu"),
        
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
                               Row(
                                children: <Widget>[
                                  Text(
                                    "Contact : ",
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    contact,
                                    style: TextStyle(fontSize: 20.0),
                                  )
                                ],
                              ),
                               Row(
                                children: <Widget>[
                                  Text(
                                    "Address : ",
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    address,
                                    style: TextStyle(fontSize: 20.0),
                                  )
                                ],
                              ),
                               Row(
                                children: <Widget>[
                                  Text(
                                    "bloodtype : ",
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    bloodtype,
                                    style: TextStyle(fontSize: 20.0),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        // new ButtonTheme.bar(
                        //   // make buttons use the appropriate styles for cards
                        //   child: new ButtonBar(
                        //     children: <Widget>[
                        //       new FlatButton(
                        //         child: const Text('Update'),
                        //         onPressed: () {
                        //           var route = new MaterialPageRoute(
                        //             builder: (BuildContext context) =>
                        //                 new Update(
                        //                   idUser: widget.idUser,
                        //                 ),
                        //           );
                        //           Navigator.of(context).push(route);
                        //         },
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
      );
    }
  }
}