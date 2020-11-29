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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('UserData'),
              Text('' + winnerName),
              RaisedButton(
                child: Text('Create file'),
                onPressed: () {
                  writeFile(file);
                  print(dir.path);
                },
              ),
              RaisedButton(
                child: Text('Read file'),
                onPressed: () {
                  readFile(file);
                },
              ),
              RaisedButton(
                child: Text('Add name'),
                onPressed: () {
                  addName(file, 'Jason');
                },
              ),
              RaisedButton(
                child: Text('Read Map'),
                onPressed: () {
                  readMap();
                },
              ),
              RaisedButton(
                child: Text('Choose Winner'),
                onPressed: () {
                  chooseWinner();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
