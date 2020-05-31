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
                              new Text("WHAT ARE THE STEPS IN BLOOD DONATION?",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(top:18.0),
                                child: new Text(step1, style: TextStyle(fontSize: 20,color:Colors.white),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:18.0),
                                child: new Text(step1a, style: TextStyle(fontSize: 18,color:Colors.white),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:18.0),
                                child: new Text(step2, style: TextStyle(fontSize: 20,color:Colors.white),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:18.0),
                                child: new Text(step2a, style: TextStyle(fontSize: 18,color:Colors.white),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:18.0),
                                child: new Text(step3, style: TextStyle(fontSize: 20,color:Colors.white),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:18.0),
                                child: new Text(step3a, style: TextStyle(fontSize: 18,color:Colors.white),),
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

  String step1="A. Before blood donation   ";
  String step1a="1. You will be asked to fill up a Donor's Form upon arrival at the blood collection site.\n"    
"2. Questions regarding your health history wil be asked by a trained professional staff. \n"   
"3. Pre-donation educationand counselling will be given by a trained professional staff. \n "  
"4. Your weight, blood pressure, pulse rate and temperature will be checked.\n"    
"5. You will be examined by a physician.  \n "     
"6. Small sample of blood will be taken to check your blood type and hemoglobin level.\n"
"7. Screening and selection procedure will usually take  about 10 to 15 minutes."
" You are encouraged to give accurate data for your own safety and that of the recipient."
"  All information gathered wil be treated with utmost confidentiality.  \n";


String step2="B. During Blood Donation";
String step2a="1. You will be asked to lie down on the blood donor's couch for blood collection which will be done by a skilled phlebotomist.\n""\n"
"2. The amount of blood which will be taken and will be determined by a physician. It will depend mainly on your body weight and does not exceed 450 ml.\n""\n"
"3. This will take another 10 to 15 minutes.";

String step3="C. After Blood Donation";
String step3a="1. You will be advised to rest for 10 more minutes.\n"
"2. Beverage and simple snacks will be served.\n"
"3. Post-donation education  and counselling will be given by a trained professional staff.\n"
"4. You will be advised to drink more fluids.\n"
"5. The volume of fluids taken is completely replaced by the body within 3 to 5 hours.\n ";