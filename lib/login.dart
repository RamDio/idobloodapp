import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:idobloodapp/home/home.dart';
import 'package:idobloodapp/register.dart';
import 'package:idobloodapp/register.dart';
import 'package:idobloodapp/registration.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  TextEditingController _pseudoController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  var data;
   var _isSecured = true;


  @override
  Widget build(BuildContext context) {
    
    /**************** Get Login Connection && Data ************************/
    Future<String> getLogin(String pseudo) async {
      var response = await http.get(
          Uri.encodeFull(
              "https://idobloodadmin.000webhostapp.com/login.php?PSEUDO=${pseudo}"),
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
                new Home(
                idUser: data[0]['userid'],
                 firstname : data[0]['firstname'],
        lastname:data[0]['lastname'],
        gender:data[0]['gender'],
        contact:data[0]['contact'],
        address:data[0]['address'],
        bloodtype:data[0]['bloodtype'],
        username:data[0]['username'],
                
                ),
          );
          Navigator.of(context).push(route);
        } else {
          onSignedInErrorPassword();
        }
      } else {
        onSignedInErrorPseudo();
      }
    }


    /****************** TextField Pseudo*******************************/
    var pseudo = new ListTile(
      title: Card(
        
              child: TextFormField(
          decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                    ),
              labelText: "Username",
              hintText: "Write your Username please",
              border: InputBorder.none
              ),
          controller: _pseudoController,
        ),
      ),
    );

    /************************************************************/

    /******************** TextField Password ******************************/
    var password = new ListTile(
     
      title: Card(
              child: TextFormField(
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
      ),
    );

    /****************************************************/
    /********************* Button Login****************************************/
    var createaccount = new Container(
      child: FlatButton(
        child: const Text('No Account? Tap to Register'),

        onPressed: () {
          var route = new MaterialPageRoute(
            builder: (BuildContext context) => new Register(),
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

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: new ListView(
        children: <Widget>[
          SizedBox(
            height: 50.0,
          ),
          Center(child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: <Widget>[
                Image.asset("asset/login.png",height: 150,width: 150,),
                new Text("LOGIN",style:TextStyle(fontSize: 30)),
              ],
            ),
          )),
          new Padding(
            padding: const EdgeInsets.all(9.0),  
                child: Column(
                  children: <Widget>[pseudo, password,
                  SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[Center(child: cancelButton), Center(child: loginButton)],
                    ),
                  ),
                  ],
                ),
          ),
          SizedBox(height: 5.0,),
          createaccount
        ],
      ),
    );
  }
}
