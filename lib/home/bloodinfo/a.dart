import 'package:flutter/material.dart';

class A extends StatelessWidget {
  const A({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
          constraints: new BoxConstraints.expand(),
          color: new Color(0xFF736AB7),
          child: new Stack(
            children: <Widget>[
            
              new Container(
                child: new Image.asset(
                  "asset/vlhad.jpg",
                  fit: BoxFit.cover,
                  height: 300.0,
                ),
                constraints: new BoxConstraints.expand(height: 300.0),
              ),
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
                          padding: const EdgeInsets.only(top: 200.0),
                          child: Column(
                            children: <Widget>[
                              new Text("BLOOD",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(top:18.0),
                                child: new Text(blood, style: TextStyle(fontSize: 20,color:Colors.white),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:30.0),
                                child: new Text("Blood Components",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:18.0),
                                child: new Text(blood2, style: TextStyle(fontSize: 20,color:Colors.white),),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top:30.0),
                                child: new Text("Red Blood Cells",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:18.0),
                                child: new Text(blood3, style: TextStyle(fontSize: 20,color:Colors.white),),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top:30.0),
                                child: new Text("Platelets",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:18.0),
                                child: new Text(blood4, style: TextStyle(fontSize: 20,color:Colors.white),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:30.0),
                                child: new Text("Plasma",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:18.0),
                                child: new Text(blood5, style: TextStyle(fontSize: 20,color:Colors.white),),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top:30.0),
                                child: new Text("White Blood Cells",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:18.0),
                                child: new Text(blood6, style: TextStyle(fontSize: 20,color:Colors.white),),
                              ),
                              
                              
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

  String blood="is a body fluid in humans and other"
  " animals that delivers necessary substances such"
  " as nutrients and oxygen to the cells and transports"
  " metabolic waste products away from those same cells. "
  "In vertebrates, it is composed of blood cells suspended in blood plasma."
  " There is no substitute for blood. It cannot be made or manufactured."
  " Generous blood donors are the only source of blood for patients in need of a blood transfusion.";

  String blood2="There are four basic components that comprise human blood: plasma, red blood cells, white blood cells and platelets.";
   String blood3="Red blood cells represent 40%-45% of your blood volume. They are generated from your bone marrow at a rate of four "
                "to five billion per hour. They have a lifecycle of about 120 days in the body.";
 String blood4="Platelets are an amazing part of your blood. Platelets are the smallest of our blood cells and literally look like small"
 " plates in their non-active form. Platelets control bleeding. Wherever a wound occurs, the blood vessel will send out a signal."
 "";
 String blood5="Plasma is the liquid portion of your blood. Plasma is yellowish in color and is made up mostly of water, but it also"
 " contains proteins, sugars, hormones and salts. It transports water and nutrients to your body’s tissues.";
 String blood6="Although white blood cells (leukocytes) only account for about 1% of your blood, they are very important. White blood"
 " cells are essential for good health and protection against illness and disease."
 "They flow through the bloodstream and attack foreign bodies, like viruses and bacteria.";
