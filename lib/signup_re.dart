import 'package:deon_greenmed/bloc/signup_bloc.dart';
import 'package:deon_greenmed/widgets/alphabetinput_field.dart';
import 'package:deon_greenmed/widgets/password_field.dart';
import 'package:deon_greenmed/widgets/rounded_text.dart';
import 'package:flutter/material.dart';

import 'database/database_helper.dart';
import 'models/user.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => new _RegistrationPageState();
}

class _RegistrationPageState  extends State<RegistrationPage> {
  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _name, _phone, _password;
  final bloc = SignUpBloc();



  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var loginBtn = new ButtonTheme(
      minWidth: 330,
      height: 56,
      child:   StreamBuilder<bool>(
        stream: bloc.submitCheck,
        builder: (context, snapshot) {
          return RaisedButton(
          onPressed: _submit,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: new Text("SignUp", style: TextStyle(
            color: Colors.white,
            fontSize: 18
          ),),
          color: Colors.teal,
    );
        }
      ));


    var loginForm = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: new Column(
              children: <Widget>[

                SizedBox(height: 100,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Please ensure to provide the right details below',
                      style: TextStyle(
                          fontSize: 18,

                      ),
                    ),
                  ),
                ),

                new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: StreamBuilder<String>(
                    stream: bloc.name,
                    builder: (context, snapshot) {
                      return new AlphaInputField(
                        onChanged: bloc.nameChanged,
                        onSaved: (val) => _name = val,

                      );
                    }
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: StreamBuilder<String>(
                    stream: bloc.phone,
                    builder: (context, snapshot) {
                      return new NumberInputField(
                        errorText: snapshot.error,
                        onChanged: bloc.phoneChanged,
                        onSaved: (val) => _phone = val,

                      );
                    }
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: StreamBuilder<String>(
                    stream: bloc.password,
                    builder: (context, snapshot) {
                      return new PasswordField(
                        errorText: snapshot.error,
                        onChanged: bloc.passwordChanged,
                        onSaved: (val) => _password = val,
                      );
                    }
                  ),
                )
              ],
            ),
          ),
        ),
        loginBtn
      ],
    );

    return new Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: new Container(
          child: new Center(
            child: loginForm,
          ),
        ),
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