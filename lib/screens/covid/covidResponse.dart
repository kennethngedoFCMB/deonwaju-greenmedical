import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'country_listview.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// HttpLink - A system of modular components for GraphQL networking.
    final HttpLink httpLink =
    HttpLink(uri: 'https://countries.trevorblades.com/');

    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: httpLink as Link,
        cache: OptimisticCache(
          dataIdFromObject: typenameDataIdFromObject,
        ),
      ),
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GraphQLProvider(
        child: CountryListView(),
        client: client,
      ),
    );
  }
}