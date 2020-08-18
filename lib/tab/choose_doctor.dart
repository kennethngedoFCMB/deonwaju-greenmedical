import 'package:deon_greenmed/comps/mapsgoogle.dart';
import 'file:///C:/FlutterVS/deon_greenmed/lib/screens/home/welcome/doctors/GpDoc.dart';
import 'file:///C:/FlutterVS/deon_greenmed/lib/screens/home/welcome/doctors/SpecialistsDoc.dart';
import 'package:flutter/material.dart';

class Homer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //build function returns a "Widget"
    final tabController = new DefaultTabController(
      length: 4,
      child: new Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(220),
          child: new AppBar(
            leading: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            backgroundColor: Colors.white,
            title: SafeArea(
              minimum: EdgeInsets.all(0),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: new Text("Choose a doctor",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold
                ),
                ),
              ),
            ),
            bottom: new TabBar(
                labelColor: Colors.black ,
                indicatorColor: Colors.green,
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),

                tabs: [
                  new Tab(text: "GP"),
                  new Tab(text: "Specialist"),
                  new Tab(text: "Dentist",),
                  new Tab(text: "Therapist",)
                ]),
          ),
        ),
        body: new TabBarView(
            children: [
              new GpDocList(),
              new SpecialistsDp(),
              new GpDocList(),
              new GpDocList(),
//              new Tab1(),
//              new Tab2(),
//              new Tab3(),
//              new Tab4()
            ]
        ),
      ),
    );
    return new MaterialApp(
        title: "Tabs example",
        home: tabController
    );
  }
}

