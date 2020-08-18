import 'file:///C:/FlutterVS/deon_greenmed/lib/screens/home/welcome/doctors/doctor_details/barney_stinson.dart';
import 'package:deon_greenmed/screens/auth/login/login.dart';
import 'package:deon_greenmed/screens/auth/login/login_screen.dart';
import 'package:deon_greenmed/screens/auth/signup/signup_screen.dart';
import 'package:deon_greenmed/signup_re.dart';
import 'file:///C:/FlutterVS/deon_greenmed/lib/screens/home/welcome/welcome_screen.dart';
import 'package:deon_greenmed/tab/choose_doctor.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

final routes = {
  '/login': (BuildContext context) => new LoginPage(),
  '/home': (BuildContext context) => new WelcomeScreen(),
  '/register': (BuildContext context) => new SignUpScreen(),
  '/docProfile': (BuildContext context) => new BarneyStinson(),
  '/selectDoc': (BuildContext context) => new Homer(),
  '/': (BuildContext context) => new LoginScreen(),
};


class MyApp extends StatelessWidget with PreferredSizeWidget{
  // This widget is the root of your application.
//  Store<AppState> store;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      routes: routes,
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
