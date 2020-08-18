import 'package:deon_greenmed/comps/textfield_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlphaInputField extends StatefulWidget {
  const AlphaInputField({
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
  });

  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onChanged;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _AlphaInputFieldState createState() => new _AlphaInputFieldState();
}

class _AlphaInputFieldState extends State<AlphaInputField> {

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: new TextFormField(
        key: widget.fieldKey,
        onSaved: widget.onSaved,
        keyboardType: TextInputType.name,
        textCapitalization: TextCapitalization.sentences,
        validator: widget.validator,
        onChanged: widget.onChanged,

        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: new InputDecoration(
          border: InputBorder.none,
          hintText: 'Full name',
          labelText: widget.labelText,
          helperText: widget.helperText,
        ),
      ),
    );
  }
}