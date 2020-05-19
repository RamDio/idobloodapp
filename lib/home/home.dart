

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idobloodapp/drawer/maindrawer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'rewards.dart';

class Home extends StatefulWidget {
  final idUser,username,firstname,lastname,gender,contact,address,bloodtype;
  Home({Key key, this.idUser,this.firstname,this.lastname,this.username,this.gender,this.contact,this.address,this.bloodtype}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<File> _image;

  chooseImage(){
    setState(() {
      _image=ImagePicker.pickImage(source: ImageSource.gallery);
    });

  }

  uploadImage(){

  }

  showImage(){
    return FutureBuilder<File>(
      future: _image,
      builder: (BuildContext context,AsyncSnapshot<File>snapshot){
        if(snapshot.connectionState==ConnectionState.done&&
        null !=snapshot.data
        ){
          return CircleAvatar(
            radius: 50,
            child: Image.file(snapshot.data),
          )
          ;
        }else if(null!=snapshot.error){
          return  CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("asset/kitty.jpg"),
          )
          ;
        }
      },
      
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 13, 48, 1),
      appBar: AppBar(
        elevation:0.0,
         backgroundColor: Color.fromRGBO(244, 13, 48, 1),
        title: Text(
          "My Profile",
          style: TextStyle(color: Colors.black),
        ),
    
        // actions: <Widget>[
        //   FlatButton.icon(
        //     icon: Icon(FontAwesomeIcons.signOutAlt),
        //     label: Text('LOGOUT'),
        //     onPressed: () async {
        //       // await _auth.signOut();
        //     },
        //   )
        // ], //remove drop shadow
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
                      showImage(),
                      // CircleAvatar(
                      //   radius:50,
                      //   backgroundImage:AssetImage(showImage()),
                      // ),
                      Row(
                        children: <Widget>[
                          RaisedButton(
                            child:Icon(Icons.image) ,
                            onPressed: chooseImage,
                            ),
                            RaisedButton(
                            child:Icon(Icons.image) ,
                            onPressed: uploadImage,
                            ),
                        ],
                      ),
                         Padding(
                           padding: const EdgeInsets.only(left:28.0),
                           child: Row(
                             children: <Widget>[
                               Text("O",
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

                            Text("Riamae Paragamac",
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
                    Text("@Ria",
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
                             Text("Female",style:TextStyle(
                               fontSize:40
                             ),
                              overflow: TextOverflow.ellipsis,),
                           ],
                         ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.contact_phone,size: 40,color: Color.fromRGBO(244, 13, 48, 1),),
                                Text("0915123457",style:TextStyle(
                               fontSize:40
                             )),
                              ],
                            ),
                           Expanded(
                                                          child: Row(
                                children: <Widget>[
                                  Icon(Icons.location_city,size: 40,color: Color.fromRGBO(244, 13, 48, 1),),
                                  Text("Macanhan, cdoc",style:TextStyle(
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

              
                     
                  Center(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: SizedBox(
                            height: 50.0,
         
                            child: GestureDetector(
                              onTap: () {
                              
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => Rewards()));
                              },
                              child: Card(
                                elevation: 10,
                                child: Center(
                                    child: Text(
                                  "Rewards",
                                  style: TextStyle(fontSize: 20.0),
                                )),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: SizedBox(
                            height: 50.0,
                           
                            child: GestureDetector(
                              onTap: () {
                              
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => Rewards()));
                              },
                              child: Card(
                                elevation: 10,
                                child: Center(
                                    child: Text(
                                  "Donation History",
                                  style: TextStyle(fontSize: 20.0),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                  ),
                
          ]
        ),
    );
  }
}