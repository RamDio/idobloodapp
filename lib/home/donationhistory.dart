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
   
   Future<List> getData()async{
    final response= await http.get("https://idobloodadmin.000webhostapp.com/fetchdata.php");
  return json.decode(response.body);
  
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
    );
  }
}
