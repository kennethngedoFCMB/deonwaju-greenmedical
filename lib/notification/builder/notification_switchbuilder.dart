
import 'package:deon_greenmed/notification/utils/notification_helper.dart';
import 'package:flutter/material.dart';

import '../book_appointment.dart';

class NotificationSwitchBuilder extends StatefulWidget {
  @override
  _NotificationSwitchBuilderState createState() =>
      _NotificationSwitchBuilderState();
}

class _NotificationSwitchBuilderState extends State<NotificationSwitchBuilder> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Switch(
              value: isSwitched,
              onChanged: (value) {
                if (!value) {
                  turnOffNotification(flutterLocalNotificationsPlugin);
                }
                setState(() {
                  isSwitched = value;
                });
              },
              activeTrackColor: Colors.lightBlueAccent,
              activeColor: Colors.blueAccent,
            ),
            Text(
              'CANCEL ALL',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ])),
    );
  }
}
