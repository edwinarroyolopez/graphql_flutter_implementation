// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class CarouselPage extends StatefulWidget {
  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  @override
  Widget build(BuildContext context) {
    @override
    Widget image_carousel = new Container(
      height: 200.0,
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
        body: new ListView(
          children: <Widget>[image_carousel],
        ));
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
