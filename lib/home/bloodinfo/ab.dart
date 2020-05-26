import 'package:flutter/material.dart';

class Blooddonation extends StatelessWidget {
  const Blooddonation({Key key}) : super(key: key);

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
                              Padding(
                                padding: const EdgeInsets.only(top:18.0),
                                child: new Text(benefit, style: TextStyle(fontSize: 20,color:Colors.white),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:18.0),
                                child: new Text(benefit2, style: TextStyle(fontSize: 20,color:Colors.white),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:18.0),
                                child: new Text(benefit3, style: TextStyle(fontSize: 20,color:Colors.white),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:18.0),
                                child: new Text(benefit4, style: TextStyle(fontSize: 35,color:Colors.white,fontWeight: FontWeight.bold),),
                              ),
                               Padding(
                                padding: const EdgeInsets.only(top:18.0),
                                child: new Text(benefit5, style: TextStyle(fontSize: 20,color:Colors.white),),
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

  String benefit="According to the American Red Cross, one donation "
  "can save as many as three lives. It turns out that donating blood doesn’t "
  "just benefit recipients. There are health benefits for donors too, on "
  "top of the benefits that come from helping others. ";

  String benefit2="Donating blood has benefits for your emotional health."
  " According to a report by the Mental Health Foundation, helping others can:";

  String benefit3="•reduce stress\n"
  "\n"
"•	improve your emotional well-being\n"
"\n"
"•	benefit your physical health\n"
"\n"
"•	help get rid of negative feelings\n"
"\n"
"•	provide a sense of belonging and reduce isolation\n";

String benefit4="Benefits of Donating Blood on Physical health:";

String benefit5="•	It reduced risk of hemochromatosis. Hemochromatosis is a health "
"condition that arises due to excess absorption of iron by the body. This may be "
"inherited or may be caused due to alcoholism, anemia or other disorders. Regular blood donation may help in reducing iron overload.\n"
"\n"
"•	Blood donation helps in lowering the risk of cancer. By donating blood the"
" iron stores in the body are maintained at healthy levels. A reduction in the iron level in the body is linked with low cancer risk. \n"
"\n"
"•	Blood donation helps in maintaining the iron levels and reduces the risk of various health ailments.\n"
"\n"
"•	Regular blood donation reduces the weight of the donors. This is helpful"
" to those who are obese and are at higher risk of cardiovascular diseases and other health disorders.\n"
"\n"
"•	After donating blood, the body works to replenish the blood loss.\n "
"\n"
"This stimulates the production of new blood cells and in turn, helps in maintaining good health.";

