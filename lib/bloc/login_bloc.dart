import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:deon_greenmed/bloc/base_bloc.dart';
import 'package:deon_greenmed/mixin/validator.dart';

class Bloc extends Object with Validators implements BaseBloc{

  final _phoneController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Function(String) get phoneChanged => _phoneController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;

  Stream<String>  get phone => _phoneController.stream.transform(phoneValidator);
  Stream<String> get password => _passwordController.stream.transform(passwordValidator);

  Stream<bool> get submitCheck => Rx.combineLatest2(phone, password, (a, b) => true);

  _submit(){

  }

  @override
  void dispose() {
    _phoneController?.close();
    _passwordController?.close();
    // TODO: implement dispose
  }
}