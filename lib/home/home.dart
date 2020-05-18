import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idobloodapp/drawer/maindrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final idUser,username,firstname,lastname,gender,contact,address,bloodtype;
  Home({Key key, this.idUser,this.firstname,this.lastname,this.username,this.gender,this.contact,this.address,this.bloodtype}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 13, 48, 1),
      appBar: AppBar(
        elevation:0.0,
         backgroundColor: Color.fromRGBO(244, 13, 48, 1),
        title: Text(
          "DATA",
          style: TextStyle(color: Colors.black),
        ),
    
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(FontAwesomeIcons.signOutAlt),
            label: Text('LOGOUT'),
            onPressed: () async {
              // await _auth.signOut();
            },
          )
        ], //remove drop shadow
      ),

        drawer:MainDrawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        
          children:<Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 100.0,top:7.0),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius:50,
                        backgroundImage:AssetImage("asset/kitty.jpeg"),
                      ),
                         Padding(
                           padding: const EdgeInsets.only(left:28.0),
                           child: Row(
                             children: <Widget>[
                               Text("$bloodtype",
                               style:TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 28.0, color: Colors.white
                                
                                )
                               
                               ),
                             ],
                           ),
                         ),
                    ],
                  ),
                ),
           
              ],
            ),
                 Padding(
                   padding: const EdgeInsets.only(left:100.0),
                   child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                                              child: Column(
                          children: <Widget>[

                            Text("$firstname $lastname",
                            style:TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 28.0, color: Colors.white,
                            
                            
                            ),
                             overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                ),
                 ),
            
              Padding(
                padding: const EdgeInsets.only(left:100.0),
                child: Row(
                  children: <Widget>[
                    Text("@ $username",
                     style:TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 28.0, color: Colors.white,
                    ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width:double.infinity,
                  margin:EdgeInsets.only(top:15),
                  decoration:BoxDecoration(
                    color:Colors.white,
                  ) ,
                  child: Padding(
                    padding: const EdgeInsets.only(top:18.0),
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                         Row(
                           children: <Widget>[
                             Icon(Icons.person,size: 40,color: Color.fromRGBO(244, 13, 48, 1),),
                             Text("$gender",style:TextStyle(
                               fontSize:40
                             ),
                              overflow: TextOverflow.ellipsis,),
                           ],
                         ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.contact_phone,size: 40,color: Color.fromRGBO(244, 13, 48, 1),),
                                Text("$contact",style:TextStyle(
                               fontSize:40
                             )),
                              ],
                            ),
                           Expanded(
                                                          child: Row(
                                children: <Widget>[
                                  Icon(Icons.location_city,size: 40,color: Color.fromRGBO(244, 13, 48, 1),),
                                  Text("$address",style:TextStyle(
                                 fontSize:40
                               ),
                                overflow: TextOverflow.ellipsis,),
                                ],
                              ),
                            ),
              
                      ],
                    ),
                  ),
                ),
                ),

                   
          ]
        ),
    );
  }


  
}