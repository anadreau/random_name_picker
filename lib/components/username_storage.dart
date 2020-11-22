import 'dart:core';
import 'dart:io';

var userList = List();

void main() {
  //UsernameStore().addUser();
  //UsernameStore().addUser();
  UsernameStore().showUser();
}

class UsernameStore {

 //var userList = List();


  void showUser(){
  print(userList);
}

  void addUser(){

  print('Add name');
  String name = stdin.readLineSync();
  userList.add(name);
}


}
