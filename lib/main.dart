import 'package:apirestflutter/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() => runApp(MyApp());

final HttpLink httpLink =
    new HttpLink(uri: 'https://graphqlzero.almansi.me/api');
final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
    GraphQLClient(cache: InMemoryCache(), link: httpLink));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: "Material App",
        home: HomePage(),
      ),
    );
  }
}

//  https://graphqlzero.almansi.me/api
