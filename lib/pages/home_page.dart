// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  final String getProperties = """
  query getProperties {
      properties: getPropertiesFromFincaRaiz{
        title_description
        price
        area
        bedrooms
        images
      }
  }
  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            tooltip: 'Atrás',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Lista de propiedades'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: null,
            ),
          ],
        ),
        body: new Container(
            child: Query(
                options: QueryOptions(documentNode: gql(getProperties)),
                builder: (QueryResult result, {fetchMore, refetch}) {
                  if (result.hasException) {
                    return Text(result.exception.toString());
                  }

                  if (result.loading) {
                    return Center(child: CircularProgressIndicator());
                  }

                  List properties = result.data["properties"];
                  print(properties);

                  return Container(
                      child: ListView.builder(
                          itemCount: properties.length,
                          itemBuilder: (context, index) {
                            final price = properties[index]['price'];
                            final bedrooms = properties[index]['bedrooms'];
                            final img =
                                properties[index]['images']['images'][0]['url'];
                            return ListTile(
                              title: cardProperty(price, bedrooms, img),
                            );
                          }));
                })));
  }
}

Widget cardProperty(price, bedrooms, img) {
  return Row(
    children: <Widget>[
      Align(
          alignment: Alignment.topRight,
          child: RichText(
            text: TextSpan(
              text: 'Hab. ' + bedrooms + ' - ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  fontSize: 15),
              children: <TextSpan>[
                TextSpan(
                    text: price,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          )),
      SizedBox(
        height: 5,
      ),
      Image.network(img, width: 150, height: 150, fit: BoxFit.fill)
    ],
  );
}
