import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:idobloodapp/drawer/mainmenu.dart';

import 'package:idobloodapp/home/home.dart';
import 'package:idobloodapp/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loading/loading.dart';
import 'registeruser.dart';
import 'registration.dart';


Future<void> main() async {
      WidgetsFlutterBinding.ensureInitialized();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var username = prefs.getString('username');
      print(username);
      runApp(MaterialApp(home: username == null ? Login() : Home()));
    }
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // bool loading = false;
  
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
              labelText: " Password",
              hintText: "Password",
              border: InputBorder.none),
          obscureText: _isSecured,
          controller: _passwordController,
        ),
      ),
    );


    /********************* Button Login****************************************/
    var loginButton = new Container(
      child: RaisedButton(
        child: const Text('LogIn'),
        color: Theme.of(context).accentColor,
        elevation: 8.0,
        splashColor: Colors.blueGrey,
        onPressed: () async{
          // setState(() => loading = true);
           SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('username', username);
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
         
        ],
      ),
       bottomNavigationBar: new FlatButton(
        child: new Text("No Account? Sign Up",
        style: TextStyle(fontSize: 20.0)),
        onPressed: (){
            Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => RegisterUser()));

          },
          ),
     
    
    );
  }
}
