import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idobloodapp/drawer/maindrawer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Events extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final Completer<WebViewController>_controller=
    Completer<WebViewController>();


    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
       
      ),

        drawer:MainDrawer(),
        body: WebView(
          initialUrl: "https://redcross.org.ph/",
          onWebViewCreated:(WebViewController webViewController){
            _controller.complete(webViewController);
          } ,
        ),
    );
  }


  
}