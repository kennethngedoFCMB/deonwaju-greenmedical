
import 'package:deon_greenmed/comps/textfield_container.dart';
import 'package:deon_greenmed/database/database_helper.dart';
import 'file:///C:/FlutterVS/deon_greenmed/lib/widgets/alphabetinput_field.dart';
import 'file:///C:/FlutterVS/deon_greenmed/lib/widgets/password_field.dart';
import 'file:///C:/FlutterVS/deon_greenmed/lib/widgets/rounded_text.dart';
import 'package:deon_greenmed/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPageMe extends StatefulWidget {

  @override
  _RegisterPageMeState createState() => new _RegisterPageMeState();
}

class _RegisterPageMeState  extends State<RegisterPageMe> {
  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _name, _phone, _password;



  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var loginBtn = new ButtonTheme(
        minWidth: 330,
        height: 56  ,

      child: RaisedButton(
          onPressed: _submit,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
          ),
          child: new Text("Register",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18
            ),
          ),
      color: Colors.green,

    ));


    var loginForm = new SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

        ClipRect(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: new Form(
              key: formKey,
              child: new Column(
                children: <Widget>[

                  new Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Sign up',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                    ),
                  ),

                  new Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Please ensure to provide the correct details below.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),


                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: AlphaInputField(
                      onSaved: (val) => _name = val,
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new NumberInputField(
                      hintText: 'Phone number',
                      onSaved: (val) => _phone = val,
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new PasswordField(
                      onSaved: (val) => _password = val,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Align(
            alignment: FractionalOffset.bottomCenter,
              child: loginBtn),
        )
      ],
    ));

    return new Scaffold(
      key: scaffoldKey,
      body: new SingleChildScrollView(
        child: loginForm,
      ),
    );
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  void _submit(){
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        var user = new User(_name, _phone, _password, null);
        var db = new DatabaseHelper();
        db.saveUser(user);
        _isLoading = false;
        Navigator.of(context).pushNamed("/login");
      });
    }
  }
}