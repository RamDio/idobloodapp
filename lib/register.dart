
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:idobloodapp/home/home.dart';
import 'login.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  getMethod()async{
    String theUrl = "https://idobloodadmin.000webhostapp.com/getdata.php";
    var res = await http.get(Uri.encodeFull(theUrl),headers: {"Accept":"application/json"});
    var responsBody = json.decode(res.body);

    print(responsBody);

    return responsBody;
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title:Text("kaloy i kami"),
     ),
     body: FutureBuilder(
       future: getMethod(),
       builder: (BuildContext context, AsyncSnapshot snapshot){
         List snap = snapshot.data;

         if(snapshot.connectionState == ConnectionState.waiting){
           return Center(
             child: CircularProgressIndicator(),
           );
         }
         if(snapshot.hasError){
           return Center(
             child: Text("Error Fetching data"),
           );
          
         }
          return ListView.builder(
             itemCount: snap.length,
             itemBuilder: (context,index){
               return ListTile(
                 title: Text("name: ${snap[index]['name']}"),
                 subtitle: Text("email: ${snap[index]['email']}"),
               );
             },
             );
       },
       ),

   );
  }
}