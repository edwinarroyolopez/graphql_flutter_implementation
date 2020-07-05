import 'package:apirestflutter/pages/carousel.dart';
import 'package:apirestflutter/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() => runApp(MyApp());
// final HttpLink httpLink = new HttpLink(uri: 'https://graphqlzero.almansi.me/api');
final HttpLink httpLink = new HttpLink(uri: 'http://192.168.1.2:6001/api');
final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
    GraphQLClient(cache: InMemoryCache(), link: httpLink));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: "Material App",
        home: FirstRoute(),
      ),
    );
  }
}

//  https://graphqlzero.almansi.me/api

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: new Container(
        child: Column(children: <Widget>[
          RaisedButton(
            child: Text('Titulos'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: 520,
            width: double.maxFinite,
            child: Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(7),
                child: Stack(children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: Stack(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(left: 10, top: 5),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    p2(),
                                    Spacer(),
                                    //p3(),
                                    //  p1(),
                                    // Spacer(),
                                    // cryptoIcon(),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // cryptoNameSymbol(),
                                    // Spacer(),
                                    // cryptoChange(),
                                    // SizedBox(
                                    //   width: 10,
                                    // ),
                                    // changeIcon(),
                                    // SizedBox(
                                    //   width: 20,
                                    // )
                                  ],
                                ),
                                Row(
                                  children: <Widget>[cryptoAmount(1)],
                                )
                              ],
                            ))
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
        ]),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Opciones'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Propiedades'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              title: Text('Carousel'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CarouselPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

Widget p2() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SizedBox(
        width: 350,
        child: Text(
          "BBAwesome somthing very long text which should ideally soft warp lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorm ipsum",
          maxLines: 4,
          overflow: TextOverflow.fade,
          softWrap: true,
          style: TextStyle(color: Colors.grey, fontSize: 16.0),
        ),
      )
    ],
  );
}

Widget p4() {
  return SizedBox(
    width: 120.0,
    child: Text(
      "\nEnter Long Text",
      maxLines: 1,
      overflow: TextOverflow.visible,
      softWrap: false,
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
    ),
  );
}

//Widgets
Widget cryptoIcon() {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0),
    child: Align(
        alignment: Alignment.centerLeft,
        child: Icon(
          Icons.arrow_drop_down,
          color: Colors.amber,
          size: 40,
        )),
  );
}

Widget cryptoNameSymbol() {
  return Align(
    alignment: Alignment.centerLeft,
    child: RichText(
      text: TextSpan(
        text: "Bitcoin",
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
        children: <TextSpan>[
          TextSpan(
              text: "\nBTC",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}

Widget cryptoChange() {
  return Align(
    alignment: Alignment.topRight,
    child: RichText(
      text: TextSpan(
        text: "+3.67%",
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.green, fontSize: 20),
        children: <TextSpan>[
          TextSpan(
              text: "\n+202.835",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}

Widget changeIcon() {
  return Align(
      alignment: Alignment.topRight,
      child: Icon(
        Icons.arrow_drop_down,
        color: Colors.green,
        size: 30,
      ));
}

Widget cryptoAmount(a) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        children: <Widget>[
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              text: "\n\$12.279",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 35,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: "\n0.1349",
                    style: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
