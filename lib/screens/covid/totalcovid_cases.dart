import 'dart:math';
import 'dart:typed_data';

import 'package:deon_greenmed/screens/covid/totalcovid_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Total extends StatefulWidget {
  @override
  _TotalState createState() => _TotalState();
}

class _TotalState extends State<Total> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        FutureBuilder(
          future: Future.wait([
            getTotalStats(),
            getMaskUsageTipsImage()
          ]),
          builder: (context, snapshot) {
            print('http.Response: ' + snapshot.data.toString());

            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator(),);
            } else {
              TotalResponse totalResponse = TotalResponse.fromJson(
                  snapshot.data[0][0]);

              String confirmed = totalResponse.confirmed;
              String recovered = totalResponse.recovered;
              String deaths = totalResponse.deaths;
              String active = (int.parse(confirmed) - int.parse(recovered) -
                  int.parse(deaths)).toString();

              print(snapshot.data[1]);
              List<int> list = snapshot.data[1]
                  .toString()
                  .codeUnits;
              Uint8List bytes = Uint8List.fromList(list);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Card(child: Image.memory(bytes)),
                  Card(
                    color: Colors.white,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: <Widget>[
                          Container(alignment: Alignment.center,
                              padding: EdgeInsets.all(5),
                              child: Text('Overall', style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold))),
                          Divider(),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(alignment: Alignment.topLeft,
                                    child: Text('Confirmed: ' + confirmed,
                                        style: TextStyle(fontSize: 18,
                                            color: Colors.black))),
                                Container(alignment: Alignment.topLeft,
                                    child: Text('Recovered: ' + recovered,
                                        style: TextStyle(fontSize: 18,
                                            color: Colors.blue[700]))),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(alignment: Alignment.topLeft,
                                    child: Text('Deaths: ' + deaths,
                                        style: TextStyle(fontSize: 18,
                                            color: Colors.red[700]))),
                                Container(alignment: Alignment.topLeft,
                                    child: Text('Active: ' + active,
                                        style: TextStyle(fontSize: 18,
                                            color: Colors.green[700]))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }

  Future<dynamic> getMaskUsageTipsImage() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'image/jpeg',
      'x-rapidapi-host': 'covid-193.p.rapidapi.com',
      'x-rapidapi-key': 'cbf0bcdf57msha6d6885d8a75f00p149267jsn83d528b7355b',
    };

    http.Response response = await http.get(
        'https://covid-193.p.rapidapi.com/statistics',
        headers: requestHeaders);

    return response.body;
  }

  Future<dynamic> getTotalStats() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'x-rapidapi-host': 'covid-19-data.p.rapidapi.com',
      'x-rapidapi-key': '7f2e5d6204mshd06cf5aa1786578p1257e0jsn204c97056783',
    };

    http.Response response = await http.get(
        'https://covid-19-data.p.rapidapi.com/totals', headers: requestHeaders);

    return jsonDecode(response.body);
  }
}
