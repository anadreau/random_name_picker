import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_name_picker/data/user_data.dart';
import 'package:random_name_picker/data/user_file.dart';

Directory dir = Directory.current;
File file = File(dir.path + '/filetest.txt');

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orange,
        body: Center(
          child: Column(
            children: [
              Text('UserData'),
              RaisedButton(
                onPressed: () {
                  writeFile(file);
                  print(dir.path);
                },
              ),
              RaisedButton(
                onPressed: () {
                  readFile(file);
                },
              ),
              RaisedButton(
                onPressed: () {
                  addName(file, 'Jason');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
