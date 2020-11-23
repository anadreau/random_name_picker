import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:random_name_picker/components/users.dart';
import 'package:flutter/cupertino.dart';

class UserData extends ChangeNotifier {
  final List<Users> _users = [
    Users('John', 1),
  ];

  void addUser(String newName) {
    final user = Users(newName, _users.length + 1);
    _users.add(user);
    notifyListeners();
  }

  void removeAll() {
    _users.clear();
    notifyListeners();
  }
}
