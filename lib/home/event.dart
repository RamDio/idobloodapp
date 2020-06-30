import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

import 'package:idobloodapp/drawer/maindrawer.dart';

class Event {
  final String id;
  final String headline, image, content;

  Event({
    this.id,
    this.headline,
    this.image,
    this.content,
  });

  factory Event.fromJson(Map<String, dynamic> jsonData) {
    return Event(
      id: jsonData['eventid'],
      headline: jsonData['headline'],
      content: jsonData['content'],
      image: "https://idobloodadmin.000webhostapp.com/uploads/" +
          jsonData['image'],
    );
  }
}

class CustomListView extends StatelessWidget {
  final List<Event> events;

  CustomListView(this.events);

  Widget build(context) {
    return ListView.builder(
      
      itemCount: events.length,
      itemBuilder: (context, int currentIndex) {
        return createViewItem(events[currentIndex], context);
      },
    );
  }

  Widget createViewItem(Event event, BuildContext context) {
    return new ListTile(
      
        title: new Card(
          elevation: 5.0,
          child: Flexible(
                      child: new Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.all(20.0),
              child: Flexible(
                              child: Column(
                  children: <Widget>[
                    Padding(
                      child: Image.network(event.image),
                      padding: EdgeInsets.only(bottom: 8.0),
                    ),
                    Row(children: <Widget>[
                      Padding(
                          child: Text(
                            event.headline,
                            style: new TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                          padding: EdgeInsets.all(1.0)),
                     
                      // Padding(
                      //     child: Text(
                      //       event.content,
                      //       style: new TextStyle(fontStyle: FontStyle.italic),
                      //       textAlign: TextAlign.right,
                      //     ),
                      //     padding: EdgeInsets.all(1.0)),
                    ]),
                  ],
                ),
              ),
            ),
          ),
        ),
        onTap: () {
          //We start by creating a Page Route.
          //A MaterialPageRoute is a modal route that replaces the entire
          //screen with a platform-adaptive transition.
          var route = new MaterialPageRoute(
            builder: (BuildContext context) =>
                new SecondScreen(value: event),
          );
          //A Navigator is a widget that manages a set of child widgets with
          //stack discipline.It allows us navigate pages.
          Navigator.of(context).push(route);
        });
  }
}

//Future is n object representing a delayed computation.
Future<List<Event>> downloadJSON() async {
  final jsonEndpoint = "https://idobloodadmin.000webhostapp.com/php/event.php";

  final response = await get(jsonEndpoint);

  if (response.statusCode == 200) {
    List events = json.decode(response.body);
    return events
        .map((event) => new Event.fromJson(event))
        .toList();
  } else
    throw Exception('We were not able to successfully download the json data.');
}

class SecondScreen extends StatefulWidget {
  final Event value;

  SecondScreen({Key key, this.value}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      appBar: new AppBar(title: new Text('Latest Events')),
      body: new Container(
        child: new Center(
          child: ListView(
            children: [
              Column(
                children: <Widget>[
                  Padding(
                    child: new Text(
                      '${widget.value.headline}',
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                    padding: EdgeInsets.only(bottom: 20.0),
                  ),
                  Padding(
                    //`widget` is the current configuration. A State object's configuration

                    //is the corresponding StatefulWidget instance.

                    child: Image.network('${widget.value.image}'),

                    padding: EdgeInsets.all(12.0),
                  ),
                
                  Padding(
                    child: new Text(
                      '${widget.value.content}',
                      style: new TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    padding: EdgeInsets.all(20.0),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new Scaffold(
        
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: true,
        appBar: new AppBar(title: const Text('Red Cross Latest Events')),
        drawer: MainDrawer(),
        body: new Center(
          //FutureBuilder is a widget that builds itself based on the latest snapshot
          // of interaction with a Future.
          child: new FutureBuilder<List<Event>>(
            future: downloadJSON(),
            //we pass a BuildContext and an AsyncSnapshot object which is an
            //Immutable representation of the most recent interaction with
            //an asynchronous computation.
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Event> events = snapshot.data;
                return new CustomListView(events);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              //return  a circular progress indicator.
              return new CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
