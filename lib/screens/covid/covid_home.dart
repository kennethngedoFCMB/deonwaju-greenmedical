import 'package:deon_greenmed/screens/covid/totalcovid_cases.dart';
import 'package:flutter/material.dart';

import 'continental_covidcases.dart';
import 'covid_nigeria.dart';

class CovidHome extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<CovidHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Covid 19'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: 'Home',),
                Tab(text: 'Nigeria',),
                Tab(text: 'Global',),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Total(),
              Nigeria(),
              Global(),
            ],
          ),
        )
    );
  }
}