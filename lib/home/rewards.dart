import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../drawer/maindrawer.dart';
import 'updateprofile.dart';

class Rewards extends StatefulWidget {
  @override
  _RewardsState createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {


  Future<List> getData() async{

  final response=await http.get("http://192.168.18.16/php/points.php");
  return json.decode(response.body);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 13, 48, 1),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(244, 13, 48, 1),
        title:  Padding(
          padding: const EdgeInsets.only(left:25.0),
          child: Text(
              "Reward Points",
              style: TextStyle(color: Colors.white),
            ),
        ),
        
      ),
      // drawer: MainDrawer(),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color:  Color.fromRGBO(244, 13, 48, 1),
                ),
                child:  FutureBuilder(
                  future: getData(),
                  builder:(context, snapshot) {
                   
           if(snapshot.hasError)
            print(snapshot.error);
          return snapshot.hasData
              ?new ItemList(list: snapshot.data,)
              :new Center(
                child: new CircularProgressIndicator(),
              );
                  },
                  ),
              ),
            ),
          ]),
    );
  }
}
class ItemList extends StatelessWidget{

  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    
    return new ListView.builder(
        itemCount: list==null?0:list.length,
      itemBuilder: (context,i){
          return ListTile(
                      title: SizedBox(
              height: 80,
                        child: Card(
                elevation: 10,
                          child: new ListTile(
                  title: new Text(list[i]['bloodcode']),

                  leading: new Icon(Icons.history),
                ),
              ),
            ),
          );
      },
    );
  }
}