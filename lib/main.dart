import 'package:flutter/material.dart';
import 'login.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // const MyApp({Key key}) : super(key: key);
  final routes=<String,WidgetBuilder>{
    Login.tag: (context)=>Login(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coding Cafe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:Colors.lightBlue,
      ),
      home: Login(),
      routes: routes,
    );
    
  }
}