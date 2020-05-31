import 'package:flutter/material.dart';


class Bloodsteps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
          constraints: new BoxConstraints.expand(),
          color: new Color(0xFF736AB7),
          child: new Stack(
            children: <Widget>[
            
              // new Container(
              //   child: new Image.asset(
              //     "asset/bd.png",
              //     fit: BoxFit.cover,
              //     height: 300.0,
              //   ),
              //   constraints: new BoxConstraints.expand(height: 300.0),
              // ),
              new Container(
                margin: new EdgeInsets.only(top: 190.0),
                height: 110.0,
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    colors: <Color>[
                      new Color(0x00736AB7),
                      new Color(0xFF736AB7)
                    ],
                    stops: [0.0, 0.9],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(0.0, 1.0),
                  ),
                ),
              ),
              new ListView(
                padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
                children: <Widget>[
                  new Container(
                    padding: new EdgeInsets.symmetric(horizontal: 32.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 100.0),
                          child: Column(
                            children: <Widget>[
                              new Text("The Benefits of Donating Blood",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold)),
                              // Padding(
                              //   padding: const EdgeInsets.only(top:18.0),
                              //   child: new Text(benefit, style: TextStyle(fontSize: 20,color:Colors.white),),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.only(top:18.0),
                              //   child: new Text(benefit2, style: TextStyle(fontSize: 20,color:Colors.white),),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.only(top:18.0),
                              //   child: new Text(benefit3, style: TextStyle(fontSize: 20,color:Colors.white),),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.only(top:18.0),
                              //   child: new Text(benefit4, style: TextStyle(fontSize: 35,color:Colors.white,fontWeight: FontWeight.bold),),
                              // ),
                              //  Padding(
                              //   padding: const EdgeInsets.only(top:18.0),
                              //   child: new Text(benefit5, style: TextStyle(fontSize: 20,color:Colors.white),),
                              // ),
                               
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
               _getToolbar(context),
            ],
          )),
    );
  }
}

 Container _getToolbar(BuildContext context) {
    return new Container(
            margin: new EdgeInsets.only(
                top: MediaQuery
                    .of(context)
                    .padding
                    .top),
            child: new BackButton(color: Colors.white),
          );
  }