import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[400],
      child: Center(
        child: Row(
          children: <Widget>[
            SpinKitPumpingHeart(
              color: Colors.red,
              size: 70.0,
              
              ),
              new Text("Loading Please Wait",
              style: TextStyle(
                fontSize: 40,fontWeight: FontWeight.bold
              ),
              ),
          ],
        ),
          
          ),
    );
  }
}