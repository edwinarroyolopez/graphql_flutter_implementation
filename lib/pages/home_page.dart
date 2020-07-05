// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:carousel_pro/carousel_pro.dart';

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
                            final description =
                                properties[index]['title_description'];
                            final price = properties[index]['price'];
                            final bedrooms = properties[index]['bedrooms'];
                            final img =
                                properties[index]['images']['images'][0]['url'];
                            return ListTile(
                              title: cardProperty(
                                  description, price, bedrooms, img),
                            );
                          }));
                })));
  }
}

Widget cardProperty(description, price, bedrooms, img) {
  @override
  Widget image_carousel = new Container(
    height: 100.0,
    child: new Carousel(
      boxFit: BoxFit.cover,
      images: [
        Image.network(
            'https://s3.amazonaws.com/imagenes.fincaraiz.com.co/FC_COL/2020/06/09/5491029/apartamento-arriendo-antioquia-medellin-285048222.jpg'),
        Image.network(
            'https://s3.amazonaws.com/imagenes.fincaraiz.com.co/FC_COL/2020/06/09/5491029/apartamento-arriendo-antioquia-medellin-285048223.jpg'),
        Image.network(
            ' https://s3.amazonaws.com/imagenes.fincaraiz.com.co/FC_COL/2020/06/09/5491029/apartamento-arriendo-antioquia-medellin-285048224.jpg'),
        Image.network(
            'https://s3.amazonaws.com/imagenes.fincaraiz.com.co/FC_COL/2020/06/09/5491029/apartamento-arriendo-antioquia-medellin-285048226.jpg'),
      ],
      autoplay: false,
      //animationCurve: Curves.fastOutSlowIn,
      //animationDuration: Duration(milliseconds: 1000),
      dotSize: 4.0,
      indicatorBgPadding: 2.0,
    ),
  );

  return Row(
    children: <Widget>[
      Image.network(img, width: 80, height: 80, fit: BoxFit.fill),
      Column(children: <Widget>[
        SizedBox(
            width: 260,
            child: Text(
              description,
              maxLines: 4,
              overflow: TextOverflow.fade,
              softWrap: true,
              style: TextStyle(color: Colors.black, fontSize: 14.0),
            )),
        Row(
          children: <Widget>[
            Icon(
              Icons.airline_seat_individual_suite,
              color: Colors.grey[600],
              size: 24.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
            Text(bedrooms,
                maxLines: 1,
                overflow: TextOverflow.fade,
                softWrap: true,
                style: TextStyle(color: Colors.grey[600], fontSize: 16.0)),
            Icon(
              Icons.attach_money,
              color: Colors.grey[600],
              size: 24.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
            Text(price,
                maxLines: 4,
                overflow: TextOverflow.fade,
                softWrap: true,
                style: TextStyle(color: Colors.grey[600], fontSize: 16.0)),
          ],
        ),

        //  Image.network(img, width: 150, height: 150, fit: BoxFit.fill)
      ]),
      //Image.network(img, width: 150, height: 150, fit: BoxFit.fill)
    ],
  );
}
