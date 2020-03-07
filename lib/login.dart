import 'package:flutter/material.dart';
import 'package:idobloodapp/registration.dart';


class Login extends StatefulWidget {
  // Login({Key key}) : super(key: key);
  static String tag='login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
   final logo=Hero(
     tag: 'hero',
      child: CircleAvatar(
        backgroundColor:Colors.transparent,
        radius: 70.0,
        child:Image.asset('asset/blood.jpg')
      ),
      );

      
      final username = TextFormField(
        autofocus:false,
        decoration: InputDecoration(
          hintText:'username',
          contentPadding:EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0)
          ),
        ),
      );

      final password = TextFormField(
        autofocus:false,
        obscureText: true,
        decoration: InputDecoration(
          hintText:'Password',
          contentPadding:EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0)
          ),
        ),
      );

      final loginButton=Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
         child: RaisedButton(
           shape: RoundedRectangleBorder(
             borderRadius:BorderRadius.circular(24),
           ),
           onPressed: null,
           padding: EdgeInsets.all(12),
           color:Colors.green,
           child: Text("Log In",style:TextStyle(
             color: Colors.white,fontSize: 17.0)),
           
           ),
         
         
         );


         final signup = FlatButton(
           child:Text(
             'Dont have any account? Signup',
             style: TextStyle(
               color:Colors.purple,fontSize: 15
             ),
           ),
           
           onPressed: (){
             Navigator.push(
               context, 
               MaterialPageRoute(builder: (context){
                 return new Registration();
               })  
           );

           },);

           return Scaffold(
             backgroundColor: Colors.white,
             body: Center(
               child:ListView(shrinkWrap: true,
               padding: EdgeInsets.only(left:24.0,right:24.0),
               children: <Widget>[
                 logo,
                 SizedBox(height: 30.0,),
                 username,
                 SizedBox(height: 20.0,),
                 password,
                 SizedBox(height: 50.0,),
                 loginButton,signup
               ],
               )
             ),
           );
  }
}