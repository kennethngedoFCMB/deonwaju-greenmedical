
import 'file:///C:/FlutterVS/deon_greenmed/lib/widgets/background.dart';
import 'package:deon_greenmed/tab/choose_doctor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';


class WelcomeBody extends StatefulWidget {
  const WelcomeBody({
    Key key,
  }) : super(key: key);

  @override
  _WelcomeBodyState createState() => _WelcomeBodyState();
}

class _WelcomeBodyState extends State<WelcomeBody> {

  bool isButtonPressed = false;

  void _launchUrl(String Url) async{
    if (await canLaunch(Url)) {
      await launch(Url);
    }
    else{
      throw 'could not open url';
    }
  }

  void _launchCaller(int number) async {
    var url = "tel: ${number.toString()}";
    if (await canLaunch(url)) {
      await launch(url);
    }
    else{
      throw 'Could not place call';
    }
  }


  @override
  Widget build(BuildContext context) {
    bool isButtonPressed = false;


    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            Padding(
              padding: EdgeInsets.fromLTRB(32.0, 66.0, 0, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Welcome,",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32
                  ),
                ),
              ),
            ),
            SizedBox(height: 54,),

            ClipRect(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Container(
                  height: 90,
                  width: 350,
                  child: RaisedButton(
                    color: isButtonPressed? Colors.red: Colors.green,
                    onPressed: () {

                      Navigator.of(context).pushNamed("/selectDoc");

                      },

                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24.0, 26.0, 24.0, 24.0 ),
                          child: SvgPicture.asset('assets/svg/stethoscope.svg'),
                        ),
                        Text(
                          'Visit a doctor',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24,),
            ClipRect(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                ),
                child: Container(
                  height: 90,
                  width: 350,
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {

                      });

                    },
                    color: Colors.grey[300],

                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24.0, 26.0, 24.0, 24.0 ),
                          child: SvgPicture.asset('assets/svg/notepad.svg'),
                        ),
                        Text(
                          'Prescription',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24,),
            ClipRect(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                ),
                child: Container(
                  height: 90,
                  width: 350,
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        _launchUrl("https://www.google.com/maps/place/Adeyemo+Alakija+St,+Ikeja+GRA,+Lagos/@6.5785962,3.3501541,17z/data=!3m1!4b1!4m5!3m4!1s0x103b920e2a8cfa0f:0x4f4ade203850afa5!8m2!3d6.5785962!4d3.3523428");
                      });

                    },
                    color: Colors.grey[300],

                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24.0, 26.0, 24.0, 24.0 ),
                          child: SvgPicture.asset('assets/svg/direction.svg'),
                        ),
                        Text(
                          'Directions',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24,),
            ClipRect(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                ),
                child: Container(
                  height: 90,
                  width: 350,
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {

                      });

                    },
                    color: Colors.grey[300],

                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24.0, 26.0, 24.0, 24.0 ),
                          child: SvgPicture.asset('assets/svg/call.svg'),
                        ),
                        Text(
                          'Covid 19',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24,),
            ClipRect(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                ),
                child: Container(
                  height: 90,
                  width: 350,
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        _launchCaller(2347034811040);

                      });

                    },
                    color: Colors.grey[300],

                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24.0, 26.0, 24.0, 24.0 ),
                          child: SvgPicture.asset('assets/svg/ambulance.svg'),
                        ),
                        Text(
                          'Emergency',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24,),
            ClipRect(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                ),
                child: Container(
                  height: 90,
                  width: 350,
                  child: RaisedButton(
                    onPressed: () {

                        Navigator.of(context).pushNamed("/login");


                    },
                    color: Colors.deepOrange[200],

                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24.0, 26.0, 24.0, 24.0 ),
                          child: SvgPicture.asset('assets/svg/caution.svg'),
                        ),
                        Text(
                          'Discharged',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 25,),


          ],
        ),
      ),
    );
  }


}

