import 'package:flutter/material.dart';

import '../constants.dart';
import 'textfield_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSaved;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: true,
        onChanged: onChanged,
        onSaved: onSaved,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: Colors.grey[400],
          ),

          border: InputBorder.none,
        ),
      ),
    );
  }
}