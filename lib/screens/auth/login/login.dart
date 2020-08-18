import 'file:///C:/FlutterVS/deon_greenmed/lib/comps/login_presenterme.dart';
import 'file:///C:/FlutterVS/deon_greenmed/lib/widgets/password_field.dart';
import 'file:///C:/FlutterVS/deon_greenmed/lib/widgets/rounded_text.dart';
import 'package:deon_greenmed/bloc/login_bloc.dart';
import 'package:deon_greenmed/models/user.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginPageContract {
  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final bloc = Bloc();

  String _phone, _password;

  LoginPagePresenter _presenter;

  _LoginPageState() {
    _presenter = new LoginPagePresenter(this);
  }

  void _register() {
    Navigator.of(context).pushNamed("/register");
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        _presenter.doLogin(_phone, _password);
      });
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    _ctx = context;
    var loginBtn = new ButtonTheme(
        minWidth: 330,
        height: 56  ,
        child: StreamBuilder<bool>(
          stream: bloc.submitCheck,
          builder: (context, snapshot) => RaisedButton(
            onPressed: _submit,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
            ),
            child: new Text("Login",style: TextStyle(
                color: Colors.white,
                fontSize: 18
            ),),
            color: Colors.teal,),
        )
    );

    var registerBtn = new RaisedButton(
      padding: const EdgeInsets.all(10.0),
      onPressed: _register,

      child: new Text("Register"),
      color: Colors.teal,
    );
    var loginForm = new SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[

            new Form(
              key: formKey,
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                    child: Image.asset(
                      'assets/images/doctorsimg.png',
                      height: 250,
                      width: 400,
                    ),
                  ),

                  new Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Text(
                      'Welcome to Green medical clinic',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                  ),

                  new Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Text(
                      'You can be connected to us and track your healing process with this app',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),

                  new Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StreamBuilder<String>(
                      stream: bloc.phone,
                      builder: (context, snapshot) =>
                      new NumberInputField(

                        onSaved: (val) => _phone = val,
                        onChanged: bloc.phoneChanged,
                        errorText: snapshot.error,
                      ),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StreamBuilder<String>(
                      stream: bloc.password,
                      builder: (context, snapshot) => new PasswordField(
                        onChanged: bloc.passwordChanged,
                        onSaved: (val) => _password = val,
                        errorText: snapshot.error,

                      ),
                    ),
                  )
                ],
              ),
            ),
            new Padding(
                padding: const EdgeInsets.all(10.0),
                child: loginBtn
            ),

            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: RichText(
                text: TextSpan(
                  text: "Dont have an account?",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,

                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' Sign up!',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _register();
                          }),
                  ],
                ),
              ),
            ),
          ],
        )
    );

    return new Scaffold(

      key: scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: new Container(
            child: new Center(
              child: loginForm,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onLoginError(String error) {
    // TODO: implement onLoginError
    _showSnackBar("Login not successful");
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void onLoginSuccess(User user) async {
    // TODO: implement onLoginSuccess
    if(user.username == ""){
      _showSnackBar("Login not successful");
    }else{
      _showSnackBar(user.toString());
    }
    setState(() {
      _isLoading = false;
    });
    if(user.flaglogged == "logged"){
      print("Logged");
      Navigator.of(context).pushNamed("/home");
    }else{
      print("Not Logged");
    }
  }
}
