import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:idobloodapp/home/home.dart';
import 'package:idobloodapp/registration.dart';
import 'login.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
   var _pseudoController = new TextEditingController();
  var _passwordController = new TextEditingController();
  var data;

  var _isSecured = true;
  @override
  Widget build(BuildContext context) {
    /**************** Get Login Connection && Data ************************/
    Future<String> getLogin(String pseudo) async {
      var response = await http.get(
          Uri.encodeFull(
              "https://astringent-dents.000webhostapp.com/EConstat/FlutterTraining/Login.php?PSEUDO=${pseudo}"),
          headers: {"Accept": "application/json"});

      print(response.body);
      setState(() {
        var convertDataToJson = json.decode(response.body);
        data = convertDataToJson['result'];
      });
    }

    /*********************Alert Dialog Pseudo******************************/
    void onSignedInErrorPassword() {
      var alert = new AlertDialog(
        title: new Text("Pseudo Error"),
        content: new Text(
            "There was an Password error signing in. Please try again."),
      );
      showDialog(context: context, child: alert);
    }
    /*********************Alert Dialog Pseudo******************************/
    void onSignedInErrorPseudo() {
      var alert = new AlertDialog(
        title: new Text("Pseudo Error"),
        content:
            new Text("There was an Pseudo error signing in. Please try again."),
      );
      showDialog(context: context, child: alert);
    }

    /******************* Check Data ****************************/
    VerifData(String pseudo, String password, var datadb) {
      if (data[0]['username'] == pseudo) {
        if (data[0]['password'] == password) {
          // Navigator.of(context).pushNamed("/seconds");

          var route = new MaterialPageRoute(
            builder: (BuildContext context) =>
                new Home(idUser: data[0]['userid'],firstname: data[0]['firstname'],lastname: data[0]['lastname'],username: data[0]['username'],),
          );
          Navigator.of(context).push(route);
        } else {
          onSignedInErrorPassword();
        }
      } else {
        onSignedInErrorPseudo();
      }
    }

    /******************* LOGO ************************/
    // var logo = new Center(
    //   child: new Container(
    //     width: 190.0,
    //     height: 190.0,
    //     decoration: new BoxDecoration(
    //       shape: BoxShape.circle,
    //       image: new DecorationImage(
    //           fit: BoxFit.fill,
    //           image: new NetworkImage("https://vignette.wikia.nocookie.net/flutter-butterfly-sanctuary/images/7/7f/FlutterLogo.PNG/revision/latest?cb=20131017172902")),
    //     ),
    //   ),
    // );
    /*******************************************************/

    /****************** TextField Pseudo*******************************/
    var pseudo = new ListTile(
      leading: const Icon(Icons.person),
      title: TextFormField(
        decoration: InputDecoration(
            labelText: "Username",
            filled: true,
            hintText: "Write your Username please",
            border: InputBorder.none),
        controller: _pseudoController,
      ),
    );

    /************************************************************/

    /******************** TextField Password ******************************/
    var password = new ListTile(
      leading: const Icon(Icons.remove_red_eye),
      title: TextField(
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
            labelText: "your Password",
            hintText: "Write your Password please",
            border: InputBorder.none),
        obscureText: _isSecured,
        controller: _passwordController,
      ),
    );

    /****************************************************/
    /********************* Button Login****************************************/
    var createaccount = new Container(
      child: FlatButton(
        child: const Text('Register'),

        onPressed: () {
          var route = new MaterialPageRoute(
            builder: (BuildContext context) => new Registration(),
          );
          Navigator.of(context).push(route);
        },
      ),
    );
/*************************************************/

    /********************* Button Login****************************************/
    var loginButton = new Container(
      child: RaisedButton(
        child: const Text('LogIn'),
        color: Theme.of(context).accentColor,
        elevation: 8.0,
        splashColor: Colors.blueGrey,
        onPressed: () {
          // Perform some action
          //SnackBar(content: Text("TEST SNACK BAR"),backgroundColor: Colors.deepOrange,);
          getLogin(_pseudoController.text);
          VerifData(_pseudoController.text, _passwordController.text, data);
        },
      ),
    );
/*************************************************/

    /********************Button Cancel ***********************/
    var cancelButton = new Container(
      child: FlatButton(
        child: const Text('Cancel'),
        onPressed: () {
          _passwordController.clear();
          _pseudoController.clear();
        },
      ),
    );

/***********************************************/
    return Container(
  );
  }
}