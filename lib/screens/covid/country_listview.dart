import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CountryListView extends StatelessWidget {
  final String query = '''
                      query ReadCountries {
                          countries {
                            code
                            name
                            currency
                            emoji
                          }
                      }
                  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Countries'),
      ),
      body: Query(
        options: QueryOptions(document: query),
        builder: (QueryResult result, {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.loading) {
            return Center(child: CircularProgressIndicator());
          }

          if (result.data == null) {
            return Center(child: Text('Countries not found.'));
          }

          return _countriesView(result);
        },
      ),
    );
  }

  ListView _countriesView(QueryResult result) {
    final countryList = result.data['countries'];
    return ListView.separated(
      itemCount: countryList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(countryList[index]['name']),
          subtitle: Text('Currency: ${countryList[index]['currency']}'),
          leading: Text(countryList[index]['emoji']),
          onTap: () {
            final snackBar = SnackBar(
                content:
                Text('Selected Country: ${countryList[index]['name']}'));
            Scaffold.of(context).showSnackBar(snackBar);
          },
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}