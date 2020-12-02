import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_name_picker/data/user_file.dart';
import 'package:random_name_picker/screens/screen2.dart';

Directory dir = Directory.current;
File file = File(dir.path + '/filetest.txt');

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final test = Provider.of<UserModel>(context);
    // final test = UserModel();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orange,
        body: Row(
          children: [
            Center(child: Image.asset('assets/images/JB.png')),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('UserData'),
                  Text(test.winnerName.toString()),
                  Text(test.userMap.toString()),
                  //Text(test.winnerName),
                  RaisedButton(
                    child: Text('Create file'),
                    onPressed: () {
                      test.writeFile();
                      print(dir.path);
                    },
                  ),
                  RaisedButton(
                    child: Text('Read file'),
                    onPressed: () {
                      test.readFile(file);
                    },
                  ),
                  RaisedButton(
                    child: Text('Add name'),
                    onPressed: () {
                      test.addName(file, 'Jason');
                    },
                  ),
                  RaisedButton(
                    child: Text('Clear List'),
                    onPressed: () {
                      test.clearMap();
                    },
                  ),
                  RaisedButton(
                    child: Text('Choose Winner'),
                    onPressed: () => test.chooseWinner(),
                  ),
                  RaisedButton(
                    child: Text('Video Test'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/second');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
