import 'package:deon_greenmed/bloc/signup_bloc.dart';
import 'package:deon_greenmed/comps/login_presenterme.dart';
import 'package:deon_greenmed/database/database_helper.dart';
import 'package:deon_greenmed/models/user.dart';
import 'package:deon_greenmed/widgets/alphabetinput_field.dart';
import 'package:deon_greenmed/widgets/password_field.dart';
import 'package:deon_greenmed/widgets/rounded_text.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {


  const RegisterPage({
    Key key,
  }) : super(key: key);



  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> implements LoginPageContract {


  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final bloc = SignUpBloc();
  String _name, _username, _password;


  @override
  Widget build(BuildContext context) {
    _ctx = context;

    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 100),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Text(
                    "Sign Up",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.024,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  "Please ensure to provide the correct details below.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.040,),

              StreamBuilder<String>(
                stream: bloc.name,
                builder: (context, snapshot) {
                  return AlphaInputField(
                    hintText: "Full name",
                    onChanged: bloc.nameChanged,
                    onSaved: (val) => _name = val,
                  );
                }
              ),


              StreamBuilder<String>(
                stream: bloc.phone,
                builder: (context, snapshot) {
                  return NumberInputField(
                    onChanged: bloc.phoneChanged,
                    hintText: "Phone number",
                    onSaved: (val) => _username = val,

                  );
                }
              ),

              StreamBuilder<String>(
                stream: bloc.password,
                builder: (context, snapshot) {
                  return PasswordField(
                    onSaved: (val) => _password = val,
                    onChanged: bloc.passwordChanged,
                    errorText: snapshot.error,
                  );
                }
              ),

              SizedBox(height: size.height * 0.20,),


            StreamBuilder<bool>(
              stream: null,
              builder: (context, snapshot) {
                return new ButtonTheme(
                minWidth: 330,
                height: 56  ,
                child: StreamBuilder<bool>(
                  stream: bloc.submitCheck,
                  builder: (context, snapshot) => RaisedButton(
                    onPressed: _submit,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: new Text("Sign up",style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                    ),),
                    color: Colors.teal,),
                )
        );
              }
            ),

              SizedBox(height: size.height * 0.04),

            ],
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
        var user = new User(_name, _username, _password, null);
        var db = new DatabaseHelper();
        db.saveUser(user);
        _isLoading = false;
        Navigator.of(context).pushNamed("/login");
      });
    }
  }

  @override
  void onLoginError(String error) {
    // TODO: implement onLoginError
  }

  @override
  void onLoginSuccess(User user) {
    // TODO: implement onLoginSuccess
  }


}