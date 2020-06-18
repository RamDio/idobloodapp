import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';



class Profile extends StatefulWidget {

  var idUser;
  Profile({Key key, this.idUser}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  getMethod()async{
    String theUrl = "https://idobloodadmin.000webhostapp.com/php/dhistory.php";

    var res = await http.get(Uri.encodeFull(theUrl),headers: {"Accept":"application/json"});


    
    Map<String,dynamic> responsBody = json.decode(res.body);
    print(responsBody);
    return responsBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IDoBlood"),
      ),
      body: FutureBuilder(
        future: getMethod(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          List<dynamic> snap = snapshot.data;

            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if(snapshot.hasError){
              return Center(
                child: Text("Error fetching Data"),
              );
            }

            return ListView.builder(
              itemBuilder: (context,index){
                return ListTile(
                  title: Text("Bloodcode: ${snap[index]['bloodcode']}"),
                  subtitle: Text("date: ${snap[index]['date']}"),
                );
              }
              );
        },
      )
    );
  }
}