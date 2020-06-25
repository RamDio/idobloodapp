import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../drawer/maindrawer.dart';
import 'updateprofile.dart';


class DonationHistory extends StatefulWidget {
  @override
  _DonationHistoryState createState() => _DonationHistoryState();
}

class _DonationHistoryState extends State<DonationHistory> {
 

   Future<List> getData() async{

  final response=await http.get("https://idobloodadmin.000webhostapp.com/php/donationhistory.php");
  return json.decode(response.body);

  }
   

  //  @override
  // void initState() {
   
  // }

  
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
              "Donation History",
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
                  color: Colors.white,
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
                  subtitle: new Text(list[i]['date']),
                  leading: new Icon(Icons.history),
                ),
              ),
            ),
          );
      },
    );
  }
}