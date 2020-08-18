import 'package:deon_greenmed/comps/textfield_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberInputField extends StatefulWidget {
  const NumberInputField({
    this.onChanged,
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.errorText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });

  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final String errorText;
  final FormFieldSetter<String> onChanged;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _NumberInputFieldState createState() => new _NumberInputFieldState();
}

class _NumberInputFieldState extends State<NumberInputField> {

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: new TextFormField(
        key: widget.fieldKey,
        onSaved: widget.onSaved,
        keyboardType: TextInputType.number,
        validator: widget.validator,
        onChanged: widget.onChanged,

        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: new InputDecoration(
          border: InputBorder.none,
          hintText: 'Phone',
          errorText: widget.errorText,
          labelText: widget.labelText,
          helperText: widget.helperText,
        ),
      ),
    );
  }
}