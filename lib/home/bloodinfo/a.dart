import 'package:flutter/material.dart';

class A extends StatelessWidget {
  const A({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: new Container(
         constraints:new BoxConstraints.expand(),
         color: new Color(0xFF736AB7),
         child:new Stack(
           children: <Widget>[
           new Container(
             child: new Image.asset("name",
              fit:BoxFit.cover,
              height: 300.0,
             ),
            
             )
           ],)
       ),
     
      
    );
  }
}