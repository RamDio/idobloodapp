import 'package:flutter/material.dart';

class O extends StatelessWidget {
  const O({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromRGBO(244, 13, 48, 1),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(244, 13, 48, 1),
        title: Text(
          "Blood Type O",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}