import 'dart:math';

import 'package:deon_greenmed/screens/covid/totalcovid_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'globalcovid_response.dart';

class Global extends StatefulWidget {
  @override
  _GlobalState createState() => _GlobalState();
}

class _GlobalState extends State<Global> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([
        getGlobalStats(),
        getTotalStats()
      ]),
      builder: (context, snapshot){

        print('http.Response: '+snapshot.data.toString());
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
        }else {

          GlobalResponse response = GlobalResponse.fromJson(jsonDecode(snapshot.data[0]));

          TotalResponse totalResponse = TotalResponse.fromJson(snapshot.data[1][0]);

          return ListView.builder(
              shrinkWrap: true,
              itemCount: response.countriesStat.length+1,
              itemBuilder: (context, index){

                if(index==0) {

                  String confirmed = totalResponse.confirmed;
                  String recovered = totalResponse.recovered;
                  String deaths = totalResponse.deaths;
                  int active = (int.parse(confirmed) - int.parse(recovered) - int.parse(deaths)).toString() as int;

//                  String confirmed = response.countriesStat[index].cases;
//                  String recovered = response.countriesStat[index].totalRecovered;
//                  String deaths = response.countriesStat[index].deaths;
//                  String active = response.countriesStat[index].activeCases;

                  String day = response.statisticTakenAt.day.toString();
                  String month = response.statisticTakenAt.month.toString();
                  String year = response.statisticTakenAt.year.toString();
                  String date = day + '-' + month + '-'+ year;
                  String hour = response.statisticTakenAt.hour.toString();
                  String min = response.statisticTakenAt.minute.toString();
                  String time = hour + ':' + min;

                  return Card(
                    color: Colors.black,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: <Widget>[
                          Container(alignment: Alignment.center, padding: EdgeInsets.all(5), child: Text('Total', style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold))),
                          Divider(color: Colors.white,),
                          Container(alignment: Alignment.center,padding: EdgeInsets.all(5), child: Text('Updated on ' + date +' at '+time, style: TextStyle(fontSize: 16, color: Colors.white))),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(alignment: Alignment.topLeft, child: Text('Confirmed: ' + confirmed, style: TextStyle(fontSize: 18, color: Colors.white))),
                                Container(alignment: Alignment.topLeft, child: Text('Recovered: ' + recovered, style: TextStyle(fontSize: 18, color: Colors.blue[200]))),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(alignment: Alignment.topLeft, child: Text('Deaths: ' + deaths, style: TextStyle(fontSize: 18, color: Colors.red[200]))),
                                Container(alignment: Alignment.topLeft, child: Text('Active: ' + active.toString(), style: TextStyle(fontSize: 18, color: Colors.green[200]))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                else{
                  String country = response.countriesStat[index-1].countryName;
                  String confirmed = response.countriesStat[index-1].cases;
                  String recovered = response.countriesStat[index-1].totalRecovered;
                  String deaths = response.countriesStat[index-1].deaths;
                  String active = response.countriesStat[index-1].activeCases;

                  return Card(
                    color: Colors.white,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: <Widget>[
                          Container(alignment: Alignment.center,
                              child: Text(country, style: TextStyle(fontSize: 22))),
                          Divider(),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(alignment: Alignment.topLeft,
                                    child: Text('Confirmed: ' + confirmed, style: TextStyle(fontSize: 18))),
                                Container(alignment: Alignment.topLeft,
                                    child: Text('Recovered: ' + recovered, style: TextStyle(fontSize: 18, color: Colors.blue[600]))),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(alignment: Alignment.topLeft,
                                    child: Text('Deaths: ' + deaths, style: TextStyle(fontSize: 18, color: Colors.red[600]))),
                                Container(alignment: Alignment.topLeft,
                                    child: Text('Active: ' + active, style: TextStyle(fontSize: 18, color: Colors.green[600]))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }
          );
        }
      },
    );
  }

  Future<dynamic> getGlobalStats() async {

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'x-rapidapi-host': 'coronavirus-monitor.p.rapidapi.com',
      'x-rapidapi-key': '7f2e5d6204mshd06cf5aa1786578p1257e0jsn204c97056783',
    };

    http.Response response = await http.get('https://coronavirus-monitor.p.rapidapi.com/coronavirus/cases_by_country.php', headers: requestHeaders);

    return response.body;
  }

  Future<dynamic> getTotalStats() async {

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'x-rapidapi-host': 'covid-19-data.p.rapidapi.com',
      'x-rapidapi-key': '7f2e5d6204mshd06cf5aa1786578p1257e0jsn204c97056783',
    };

    http.Response response = await http.get('https://covid-19-data.p.rapidapi.com/totals', headers: requestHeaders);

    return jsonDecode(response.body);
  }

}