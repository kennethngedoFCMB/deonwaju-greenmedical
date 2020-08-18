import 'package:deon_greenmed/comps/textfield_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldKey,
    this.onChanged,
    this.hintText,
    this.errorText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });

  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final String errorText;
  final FormFieldSetter<String> onSaved;
  final FormFieldSetter<String> onChanged;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _PasswordFieldState createState() => new _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: new TextFormField(
        key: widget.fieldKey,
        obscureText: _obscureText,
        onSaved: widget.onSaved,
        onChanged: widget.onChanged,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: new InputDecoration(
          border: InputBorder.none,
          hintText: 'Password',
          errorText: widget.errorText,
          labelText: widget.labelText,
          helperText: widget.helperText,
          suffixIcon: new GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child:
            new Icon(_obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey[400],),
          ),
        ),
      ),
    );
  }
}