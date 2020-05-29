import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:idobloodapp/drawer/maindrawer.dart';

import '../drawer/maindrawer.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  Future<List> getData()async{
    final response= await http.get("https://idobloodadmin.000webhostapp.com/fetchdata.php");
  return json.decode(response.body);
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("data"),),
      drawer: MainDrawer(),

      body: new FutureBuilder<List>(
        future: getData(),
        builder:(context, snapshot){
          if(snapshot.hasError) print(snapshot.error);

          return snapshot.hasData 
          ? new ItemList()
          :new Center(child: new CircularProgressIndicator(),);
        }
        ),
    );
  }
}

class ItemList extends StatelessWidget {

  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list==null ? 0 : list.length,
      itemBuilder: (context,i){
        return new ListTile(
          title: new Text(list[i]['username'],style: TextStyle(color:Colors.black),),
          subtitle: new Text("Name ${list[i]['firstname']}"),
        )
        ;
      },
      );
  }
}