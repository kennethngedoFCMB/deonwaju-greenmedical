import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../constants.dart';

class BarneyStinson extends StatelessWidget {
  var _name;
  var _description;
  var _imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          width: double.infinity,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,

                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(40),
                      )
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(40),
                            )
                        ) ,
                        child: Image.asset(
                          'assets/images/mantwo.png',
                          height: 120,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Dr. Barney Stinson',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Gynecologist'
                                '',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                '10 yrs of experience',
                                style: TextStyle(
                                  fontSize: 14
                                ),
                              )

                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/mantwo.png',
                            height: 35,
                          ),
                          Row(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/womanthree.png',
                                height: 35,
                              ),
                              Image.asset(
                                'assets/images/womantwo.png',
                                height: 35,
                              ),
                              Icon(
                                Icons.add
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Vouched for by 10+ patients',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Gynecologist'
                                    '',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          )
                        ],
                      ),
                      Text(
                        'Working Time',
                        style: TextStyle(
                          fontSize: 18,
                          color: kTitleTextColor,
                        ),
                      ),
                      Text(
                        '- Mon - Fri 09:00 - 17:00',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          height: 1.6,
                          color: kTitleTextColor.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Education',
                        style: TextStyle(
                          fontSize: 18,
                          color: kTitleTextColor,
                        ),
                      ),
                      Text(
                        '-Medical degree at NYU - 2001 \n - Gynecologist at NYU - 2009.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          height: 1.6,
                          color: kTitleTextColor.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Biography',
                        style: TextStyle(

                          fontSize: 18,
                          color: kTitleTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Dr. Barney is the top most Gynecologist at Green\nMedical. He has treated over 200 women \nwithin past 3 years. He has achieved several\nawards for his wonderful contribution in his own\nfield. He is available for private consultation for\ngiven schedules.',
                        style: TextStyle(
                          height: 1.6,
                          fontWeight: FontWeight.bold,
                          color: kTitleTextColor.withOpacity(0.7),
                        ),
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    ButtonTheme(
                      minWidth: 330,
                      height: 56  ,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                        ),
                        child: new Text("Book an appointment",style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),),
                        color: Colors.green,
                      ),
                  ),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}