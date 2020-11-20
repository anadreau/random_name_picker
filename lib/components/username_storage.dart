import 'dart:core';
import 'dart:io';

List<String> userList = [];

void main(){
  print('Add name');
  String name = stdin.readLineSync();
  usernameStorage(name);
}


void usernameStorage(name){
  //something
  addUser(name);
  print(userList);
  print(userList.length);
}

void addUser(name){
  userList.add(name);
}



