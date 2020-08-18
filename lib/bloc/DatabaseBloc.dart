import 'dart:async';

import 'package:deon_greenmed/models/user.dart';

class ClientsBloc {
  ClientsBloc() {
    getClients();
  }
  final _clientController =     StreamController<List<User>>.broadcast();
  get clients => _clientController.stream;

  dispose() {
    _clientController.close();
  }




  getClients() async {
//    _clientController.sink.add(await);
//    _clientController.sink.add(await DBProvider.db.getAllClients());
  }
}