import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class Profile extends StatefulWidget {
  var idUser;

  Profile({Key key, this.idUser}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var data;
  int idUser,contact;
  String username,
      firstname ,
      lastname,
      gender,
      address,
      bloodtype;
  // Future<List> getData() async{

  // final response=await http.get("https://idobloodadmin.000webhostapp.com/php/donationhistory.php");
  // return json.decode(response.body);

  // }
  Future<String> getLogin(String pseudo) async {
    var response = await http.get(
        Uri.encodeFull(
            "https://idobloodadmin.000webhostapp.com/php/login.php?PSEUDO=${pseudo}"),
        headers: {"Accept": "application/json"});

    print(response.body);
    setState(() {
      var convertDataToJson = json.decode(response.body);
      data = convertDataToJson['result'];
    });
  }

  VerifData(String pseudo, String password, var datadb) {
    if (data[0]['username'] == pseudo) {
      // Navigator.of(context).pushNamed("/seconds");

      idUser=
      data[0]['userid'];
      firstname=
      data[0]['firstname'];
      lastname=
      data[0]['lastname'];
      gender=
      data[0]['gender'];
      contact=
      data[0]['contact'];
      address=
      data[0]['address'];
      bloodtype=
      data[0]['bloodtype'];
      username=
      data[0]['username'];
    } else {
      onSignedInErrorPseudo();
    }
  }

  void onSignedInErrorPseudo() {
    var alert = new AlertDialog(
      title: new Text("Pseudo Error"),
      content:
          new Text("There was an Pseudo error signing in. Please try again."),
    );
    showDialog(context: context, child: alert);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("IDoBlood"),
        ),
        body: FutureBuilder(
          future: getLogin(widget.idUser),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? Container(
                  child: Row(
                    children: <Widget>[
                      // Text(data[0]['firstname']),
                      //  Text(data[0]['lastname']),
                      //  Text(data[0]['gender']),
                      //  Text(data[0]['contact']),
                      //  Text(data[0]['address']),
                      //  Text(data[0]['address']),
                      //  Text(data[0]['bloodtype']),
                       Text("$firstname"),
                       Text("$lastname"),
                       Text("$gender"),
                       Text("$contact"),
                       Text("$address"),
                       Text("$bloodtype"),
                       Text("$username"),
                    ],
                  ),
                )
                // new ItemList(
                //     list: snapshot.data,
                //   )
                : new Center(
                    child: new CircularProgressIndicator(),
                  );
          },
        ));
  }
}

// class ItemList extends StatelessWidget {
//   final List list;
//   ItemList({this.list});

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return new ListView.builder(
//       itemCount: list == null ? 0 : list.length,
//       itemBuilder: (context, i) {
//         return new ListTile(
          
//           title: Column(
//             children: <Widget>[
//               new Text(list[i]['bloodcode']),
//               new Text(data[0]['']),
//             ],
//           ),
//           // subtitle: new Text(list[i]['date']),
//           leading: new Icon(Icons.http),
//           // onTap:()=> Navigator.of(context).push(
//           //   new MaterialPageRoute(
//           //       builder: (BuildContext context)=>new Details(list: list,index: i),

//           //   )
//           // ),
//         );
//       },
//     );
//   }
// }
