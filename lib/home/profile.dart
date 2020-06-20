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

  Future<List> getData() async{

  final response=await http.get("https://idobloodadmin.000webhostapp.com/php/donationhistory.php");
  return json.decode(response.body);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IDoBlood"),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context,snapshot){
           if(snapshot.hasError)
            print(snapshot.error);
          return snapshot.hasData
              ?new ItemList(list: snapshot.data,)
              :new Center(
                child: new CircularProgressIndicator(),
              );
        },
      )
    );
  }
}

class ItemList extends StatelessWidget{

  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(
        itemCount: list==null?0:list.length,
      itemBuilder: (context,i){
          return new ListTile(
            title: new Text(list[i]['bloodcode']),
            subtitle: new Text(list[i]['date']),
            leading: new Icon(Icons.http),
            // onTap:()=> Navigator.of(context).push(
            //   new MaterialPageRoute(
            //       builder: (BuildContext context)=>new Details(list: list,index: i),

            //   )
            // ),
          );
      },
    );
  }
}