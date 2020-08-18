import 'dart:async';

mixin Validators{

  var phoneValidator = StreamTransformer<String,String>.fromHandlers(
      handleData: (phone,sink){
        if(phone.contains(new RegExp(r'^-?[0-9]+$'))){
          sink.add(phone);
        }else{
          sink.addError("Phone number is not valid");
        }
      }
  );

  var passwordValidator = StreamTransformer<String,String>.fromHandlers(
      handleData: (password,sink){
        if(password.length > 4 && password.isNotEmpty){
          sink.add(password);
        }else{
          sink.addError("Password length should be greater than 4 chars.");
        }
      }
  );

  var nameValidator = StreamTransformer<String,String>.fromHandlers(
      handleData: (name,sink){
        if(name.contains(new RegExp(r'^[a-zA-Z]+$')) && name.isNotEmpty){
          sink.add(name);
        }else{
          sink.addError("Please enter Your name.");
        }
      }
  );

}