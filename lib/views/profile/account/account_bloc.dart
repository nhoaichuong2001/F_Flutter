import 'dart:async';

import 'package:fluter_19pmd/views/profile/account/account_event.dart';

class ProfileInfoAccountBloc {
  bool openAccount = false;
  bool openAddress = false;
  final _stateStreamController = StreamController<bool>();
  StreamSink<bool> get _editProfileSink => _stateStreamController.sink;
  Stream<bool> get editProfileStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<AccountEvent>();
  StreamSink<AccountEvent> get eventSink => _eventStreamController.sink;
  Stream<AccountEvent> get _eventStream => _eventStreamController.stream;

  ProfileInfoAccountBloc() {
    _eventStream.listen((event) {
      switch (event) {
        case AccountEvent.editAccount:
          openAccount = !openAccount;
          openAddress = false;
          _editProfileSink.add(openAccount);
          break;
        case AccountEvent.addOrEditAddress:
          openAccount = false;
          openAddress = true;
          _editProfileSink.add(openAddress);
          break;
        default:
      }
    });
  }
  void dispose() {
    _stateStreamController.close();
  }
}
