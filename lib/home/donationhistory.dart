import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../drawer/maindrawer.dart';
import 'updateprofile.dart';


Future<History> fetchHistory() async {
  final response =
      await http.get('https://idobloodadmin.000webhostapp.com/php/dhistory.php');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return  History.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}


class History {
  final int userid;
  final String bloodcode;
  final String date;

 History({this.userid, this.bloodcode, this.date});

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      userid: json['userid'],
      bloodcode: json['bloodcode'],
      date: json['date'],
    );
  }
}
class DonationHistory extends StatefulWidget {
  @override
  _DonationHistoryState createState() => _DonationHistoryState();
}

class _DonationHistoryState extends State<DonationHistory> {
  Future<History> futureHistory;
   
   Future<List> getData()async{
    final response= await http.get("https://idobloodadmin.000webhostapp.com/fetchdata.php");
  return json.decode(response.body);
  
  }

   @override
  void initState() {
    super.initState();
    futureHistory = fetchHistory();
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
                child:  FutureBuilder<History>(
                  future: futureHistory,
                  builder:(context, snapshot) {
                    if(snapshot.hasData){
                      return Center(child: Column(
                        children: <Widget>[
                        
                             Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new ListTile(
                                title: SizedBox(
                                  height:80,
                                  child:Card(
                                    elevation: 10,
                                    child: ListTile(
                                        title:Text(snapshot.data.bloodcode!=null?snapshot.data.bloodcode:'${snapshot.data.bloodcode}',
                              style:TextStyle(fontWeight:FontWeight.w900 )
                              ),
                              subtitle: Text(snapshot.data.bloodcode!=null?snapshot.data.bloodcode:'${snapshot.data.date}'),
                                    ),
                                  )
                                ),
                              ),
                              // Text(snapshot.data.bloodcode!=null?snapshot.data.bloodcode:'${snapshot.data.bloodcode}'),
                              // Text(snapshot.data.bloodcode!=null?snapshot.data.bloodcode:'${snapshot.data.date}')
                            ],
                          ),
                        ],
                      ));
                    }else if(snapshot.hasError){
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  },
                  ),
              ),
            ),
          ]),
     
    );
  }
}
