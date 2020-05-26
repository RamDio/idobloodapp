import 'package:flutter/material.dart';

class B extends StatelessWidget {
  const B({Key key}) : super(key: key);

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
                //   "asset/facts.jpg",
                //   fit: BoxFit.contain,
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
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                  "asset/facts.jpg",
                  fit: BoxFit.contain,
                  height: 300.0,
                ),
                
                              
                              Padding(
                                padding: const EdgeInsets.only(top:20.0),
                                child: new Text(trivia1, style: TextStyle(fontSize: 20,color:Colors.white),),
                              ),
                               Padding(
                                padding: const EdgeInsets.only(top:20.0),
                                child: new Text(trivia2, style: TextStyle(fontSize: 20,color:Colors.white),),
                              ),
                               Padding(
                                padding: const EdgeInsets.only(top:20.0),
                                child: new Text(trivia3, style: TextStyle(fontSize: 20,color:Colors.white),),
                              ),
                               Padding(
                                padding: const EdgeInsets.only(top:20.0),
                                child: new Text(trivia4, style: TextStyle(fontSize: 20,color:Colors.white),),
                              ),
                               Padding(
                                padding: const EdgeInsets.only(top:20.0),
                                child: new Text(trivia5, style: TextStyle(fontSize: 20,color:Colors.white),),
                              ),
                               Padding(
                                padding: const EdgeInsets.only(top:20.0),
                                child: new Text(trivia6, style: TextStyle(fontSize: 20,color:Colors.white),),
                              ),
                               Padding(
                                padding: const EdgeInsets.only(top:20.0),
                                child: new Text(trivia7, style: TextStyle(fontSize: 20,color:Colors.white),),
                              ),
                               Padding(
                                padding: const EdgeInsets.only(top:20.0),
                                child: new Text(trivia8, style: TextStyle(fontSize: 20,color:Colors.white),),
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



  String trivia1="•There are 150 Billion red blood cells in one ounce of blood.";
  String trivia2="•There are 2.4 Trillion red blood cells in one pint of blood.";
  String trivia3="•The human body manufactures 17 million red blood cells per"
                  " second. If stress precipitates a need the body can produce up to 7 times "
                  "that amount. (That’s up to 119 million red blood cells per second.)";
  String trivia4="•A red blood cell is around 7 microns in size. (A micron is one millionth of a meter).";
  String trivia5="•It only takes 20 to 60 seconds for a drop of blood to travel from the heart, through your body, and back to the heart again.";
  String trivia6="•Cows have 800 (and possibly more) blood types.";
  String trivia7="•All blood isn’t red. Crabs have blue blood. Earthworms and leeches have green blood."
                  " Many invertebrates, such as starfish, have clear or yellowish blood.";
  String trivia8="•	Apheresis is a special kind of blood donation that allows a donor to give specific blood components, such as platelets.\n"
"\n"
"•	42 days: how long most donated red blood cells can be stored.\n"
"\n"
"•	Five days: how long most donated platelets can be stored.\n"
"\n"


"•	One year: how long frozen plasma can be stored.\n"
"\n"
"•	Much of today’s medical care depends on a steady supply of blood from healthy donors.\n"
"\n"
"•	2.7 pints: the average whole blood and red blood cell transfusion.\n"
"\n"
"•	Children being treated for cancer, premature infants and children having heart surgery need blood and platelets from donors of all types, especially type O.\n";