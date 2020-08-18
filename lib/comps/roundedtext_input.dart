import 'package:flutter/material.dart';

import 'textfield_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSaved;
  const RoundedInputField({
    Key key,
    this.onSaved,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        onSaved: onSaved,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.grey[400],
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}