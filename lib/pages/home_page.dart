// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  final String getAlbums = """
    query getAlbums{
      albums(options:{
        paginate: {
          page: 1,
          limit: 7
        }
      }){
        data{
          id
          title
          user {
            name
            username
            email
          }
        }
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
          title: Text('Lista de títulos'),
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
                options: QueryOptions(documentNode: gql(getAlbums)),
                builder: (QueryResult result, {fetchMore, refetch}) {
                  if (result.hasException) {
                    return Text(result.exception.toString());
                  }

                  if (result.loading) {
                    return Center(child: CircularProgressIndicator());
                  }

                  List albums = result.data["albums"]["data"];
                  //print(albums);

                  return Container(
                      child: ListView.builder(
                          itemCount: albums.length,
                          itemBuilder: (context, index) {
                            final album = albums[index]['title'];
                            return ListTile(
                              title: Text(album),
                            );
                          }));
                })));
  }
}
