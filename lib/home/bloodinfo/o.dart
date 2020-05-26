import 'package:flutter/material.dart';

class Bloodtype extends StatelessWidget {
  const Bloodtype({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: new Container(
          constraints: new BoxConstraints.expand(),
          color: new Color(0xFF736AB7),
          child: new Stack(
            children: <Widget>[
            
              new Container(
                // child: new Image.asset(
                //   "asset/bg.jpg",
                //   fit: BoxFit.cover,
                //   height: 300.0,
                // ),
                // constraints: new BoxConstraints.expand(height: 300.0),
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
                          padding: const EdgeInsets.only(top: 100.0),
                          child: Column(
                            children: <Widget>[
                              new Text("Blood Types (Groups)",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(top:18.0),
                                child: new Text(bloodtype, style: TextStyle(fontSize: 20,color:Colors.white),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:18.0),
                                child: new Text(bloodtype1, style: TextStyle(fontSize: 20,color:Colors.white),),
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


  String bloodtype="A blood type (also called a blood group) is defined"
  " as the classification of blood based on the presence or absence of"
  " inherited antigenic substances on the surface of red blood cells (RBCs). "
  "A series of related blood types constitutes a blood group system, such as "
  "the Rh or ABO system. The frequencies of the ABO and Rh blood types vary "
  "from population to population.";

  String bloodtype1="•	Blood Type A - If the red blood cell has only ""'A'"" molecules on it.\n"
  "\n"
"•	Blood Type B - If the red blood cell has only 'B' molecules on it.\n"
  "\n"
"•	Blood Type AB - If the red blood cell has a mixture of both" "A" "and" "B" "molecules.\n"
  "\n"
"•	Blood Type O - If the red blood cell has neither A or B molecule.\n"
  "\n"

"•	Receiving blood from the wrong ABO group can be life threatening. For example, if someone with group B blood is given group A blood, their anti-A antibodies will attack the group A cells.\n"
  "\n"
"•	This is why group A blood must never be given to someone who has group B blood and vice versa.\n"
  "\n"
"•	As group O red blood cells do not have any A or B antigens, it can safely be given to any other group.\n";