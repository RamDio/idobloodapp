import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idobloodapp/drawer/maindrawer.dart';

class Profile extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        // title: Center(
        //   child: Text(
      
        //     "MY PROFILE",
        //     style: TextStyle(color: Colors.black),
        //   ),
        // ),

      ),

        drawer:MainDrawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:5.0,top:40),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: 
                    AssetImage('asset/kitty.jpeg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:20.0,top: 60),
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children:<Widget>[
                      Text('HIGH BLOOD ',
                      style:TextStyle(
                        fontWeight:FontWeight.bold,
                        fontSize:28,
                        color:Colors.white )
                      ), 
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          //BUTNGAN NATO DIRI OG BUTTONS PARA I EDIT
                          Icon(Icons.edit,
                          color: Colors.white,size: 19,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Text('Edit Profile',style: TextStyle(
                              color:Colors.white,
                              wordSpacing: 2,
                              letterSpacing: 4
                            ),),
                          )
                        ],
                      )      
                      
                    ],
                  ),
                  
                ),
                     
              ],
            ),
         //NEXT NGA WIDGET
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[

         ],),

         Expanded(child: Container(
           width: double.infinity,
           margin: EdgeInsets.only(top:20),
           decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.vertical(
              )),
               child: Column(
                 mainAxisAlignment:MainAxisAlignment.start,
                 crossAxisAlignment:CrossAxisAlignment.start,
                 children:<Widget>[
                   Padding(
                     padding: const EdgeInsets.only(top:10.0,left: 10.0),
                     child: Text('Name :',style:TextStyle(fontWeight: FontWeight.bold,
                     fontSize:25
                     )),
                     
                   ),
                   Padding(
                     padding: const EdgeInsets.only(top:10.0,left: 10.0),
                     child: Text('Address :',style:TextStyle(fontWeight: FontWeight.bold,
                     fontSize:25
                     )),),
                      Padding(
                     padding: const EdgeInsets.only(top:10.0,left: 10.0),
                     child: Text('Bloodtype :',style:TextStyle(fontWeight: FontWeight.bold,
                     fontSize:25
                     )),),
                      Padding(
                     padding: const EdgeInsets.only(top:10.0,left: 10.0),
                     child: Text('Mobile :',style:TextStyle(fontWeight: FontWeight.bold,
                     fontSize:25
                     )),),
                   
                 ]
               ),
         ))
          ],  ),
  
      

        
    );
  }


  
}