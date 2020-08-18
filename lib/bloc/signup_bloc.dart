

import 'package:deon_greenmed/mixin/validator.dart';
import 'package:rxdart/rxdart.dart';
import 'base_bloc.dart';

class SignUpBloc extends Object with Validators implements BaseBloc {
  final _phoneController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _nameController = BehaviorSubject<String>();

  Function(String) get phoneChanged => _phoneController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;
  Function(String) get nameChanged => _nameController.sink.add;

  Stream<String>  get phone => _phoneController.stream.transform(phoneValidator);
  Stream<String> get password => _passwordController.stream.transform(passwordValidator);
  Stream<String> get name => _nameController.stream.transform(nameValidator);

  Stream<bool> get submitCheck => Rx.combineLatest3(phone, password, name, (a, b, c) => true);


  @override
  void dispose() {
    _phoneController?.close();
    _passwordController?.close();
    _nameController?.close();
    // TODO: implement dispose
  }

}