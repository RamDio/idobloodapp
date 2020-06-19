import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:idobloodapp/home/home.dart';
import 'login.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class RegisterUser extends StatefulWidget {
 
RegisterUserState createState() => RegisterUserState();
 
}
 
class RegisterUserState extends State {
 
 final formKey = new GlobalKey<FormState>();
  // Boolean variable for CircularProgressIndicator.
  bool visible = false ;
  
  String firstname="";
  String lastname="";

  String contact="";
  String address="";
 
  String username="";
  String password="";
  String error="";

  var _isSecured = true;
  // Getting value from TextField widget.
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final genderController=TextEditingController();
  final contactController=TextEditingController();
  final addressController=TextEditingController();
  final bloodtypeController=TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final gender = ['Male', 'Female'];

  final bloodtype = [
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
 
Future userRegistration() async{
 
  // Showing CircularProgressIndicator.
  setState(() {
  visible = true ; 
  });
 
  // Getting value from Controller
  String firstname = firstnameController.text;
  String lastname = lastnameController.text;
  String gender = genderController.text;
  String contact = contactController.text;
  String address = addressController.text;
  String bloodtype = bloodtypeController.text;
  String username = usernameController.text;
  String password = passwordController.text;
 
  // SERVER API URL
  var url = 'https://idobloodadmin.000webhostapp.com/php/registeruser.php';
 
  // Store all data with Param Name.
  var data = {'firstname': firstname,'lastname':lastname,'gender':gender,'contact':contact,'address':address,'bloodtype':bloodtype, 'username': username, 'password' : password};
 
  // Starting Web API Call.
  var response = await http.post(url, body: json.encode(data));
 
  // Getting Server response into variable.
  var message = jsonDecode(response.body);
 
  // If Web call Success than Hide the CircularProgressIndicator.
  if(response.statusCode == 200){
  setState(() {
    visible = false; 
  });
}
 
  // Showing Alert Dialog with Response JSON Message.
  showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: new Text(message),
      actions: <Widget>[
        FlatButton(
          child: new Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  },
  );
 
}
 
@override
Widget build(BuildContext context) {
return Scaffold(
  body: Container(
    decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/back.png'),
            fit: BoxFit.cover )
        ),
    child: SingleChildScrollView(
      child: Form(
        key: formKey,
            child: Center(
        child: Column(
          children: <Widget>[
 
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('User Registration Form', 
                      style: TextStyle(fontSize: 21,
                      color:Color(0xfff23b5f)
                      ))),
 
            Divider(),          
 
            Container(
            width: 280,
            padding: EdgeInsets.all(10.0),
            child: TextFormField(
                        decoration: InputDecoration(
                          // labelText: "First Name  ",
                          hintText: " First Name ",
                          fillColor: Colors.white,
                          filled:true,
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
                          setState(() => firstname = val);
                        },
                        controller: firstnameController,
                      ),
            ),
            Container(
            width: 280,
            padding: EdgeInsets.all(10.0),
            child: TextFormField(
                        decoration: InputDecoration(
                          // labelText: "Last Name ",
                          hintText: " Last Name ",
                          fillColor: Colors.white,
                          filled:true,
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
                        controller: lastnameController,
                      ),
            ),

            Container(
            width: 280,
            padding: EdgeInsets.all(10.0),
            child: TextFormField(
                        controller: genderController,
                        decoration: InputDecoration(
                          hintText: "Gender ",
                          suffixIcon: PopupMenuButton<String>(
                            icon: const Icon(Icons.arrow_drop_down),
                            onSelected: (String value) {
                              genderController.text = value;
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
                          filled:true,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(
                              color: Colors.pink,
                            ),
                          ),
                        ),
                      ),
            ),
            Container(
            width: 280,
            padding: EdgeInsets.all(10.0),
            child:  TextFormField(
                        decoration: InputDecoration(
                      
                          hintText: "Contact Number ",
                          // hintText: " Contact Number ",
                          fillColor: Colors.white,
                          filled:true,
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
                        controller: contactController,
                      ),
            ),
            Container(
            width: 280,
            padding: EdgeInsets.all(10.0),
            child: TextFormField(
                        decoration: InputDecoration(
                       
                          // labelText: "Address  ",
                          hintText: " Address ",
                          fillColor: Colors.white,
                          filled:true,
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
                        controller: addressController,
                      ),
            ),
            Container(
            width: 280,
            padding: EdgeInsets.all(10.0),
            child: TextFormField(
                        controller: bloodtypeController,
                        decoration: InputDecoration(
                          hintText: "Bloodtype ",
                          suffixIcon: PopupMenuButton<String>(
                            icon: const Icon(Icons.arrow_drop_down),
                            onSelected: (String value) {
                              bloodtypeController.text = value;
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
                          filled:true,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(
                              color: Colors.pink,
                            ),
                          ),
                        ),
                      ),
            ),
 
            Container(
            width: 280,
            padding: EdgeInsets.all(10.0),
            child:TextFormField(
                        decoration: InputDecoration(
                      
                          // labelText: "UserName  ",
                          hintText: " User Name ",
                          fillColor: Colors.white,
                          filled:true,
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
                        controller: usernameController,
                      ),
            ),
 
            Container(
            width: 280,
            padding: EdgeInsets.all(10.0),
            child: TextFormField(
                        obscureText: _isSecured,
                        decoration: InputDecoration(
                          // labelText: "Password  ",
                          hintText: "Password ",
                          fillColor: Colors.white,
                          filled:true,
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
                        controller: passwordController,
                      ),
            ),

              new FlatButton(
          child: const Text('Cancel'),
          onPressed: () {
            firstnameController.clear();
            lastnameController.clear();
            genderController.clear();
            contactController.clear();
           addressController.clear();
            bloodtypeController.clear();
            passwordController.clear();
            usernameController.clear();
          },
        ),
            RaisedButton(
              // userRegistration,
              onPressed: (){
                if(formKey.currentState.validate()){
                        // setState(() => loading = true);
                          dynamic result = userRegistration();
                          if(result==null){
                              setState(() {
                                error='please supply a valid email';
                                // loading=false;
                              });
                          }
                      }
              },
              // print(email);
                      // print(password);
                      
              color: Color(0xfff23b5f),
        shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(18.0),
  side: BorderSide(color: Colors.red)
),
              textColor: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text('Register'),
            ),
            SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Color(0xfff23b5f), fontSize:14.0),
                  ),   
 
            Visibility(
              visible: visible, 
              child: Container(
                margin: EdgeInsets.only(bottom: 30),
                child: CircularProgressIndicator()
                )
              ),
 
          ],
        ),
    ),
      )),
  ),
     bottomNavigationBar: new FlatButton(
        child: new Text("Click Here to Log In",
        style: TextStyle(fontSize: 20.0)),
        onPressed: (){
            Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => Login()));

          },
          ),
    );
}
}