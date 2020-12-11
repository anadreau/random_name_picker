import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_name_picker/data/user_file.dart';
import 'package:random_name_picker/screens/screen2.dart';

Directory dir = Directory.current;
File file = File(dir.path + '/Goon_Lottery.txt');

class Screen1 extends StatelessWidget {
  static const String id = 'home';
  @override
  Widget build(BuildContext context) {
    final lotteryList = Provider.of<UserModel>(context);
    // final lotteryList = UserModel();

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
                  Text('Goonscription Winner'),
                  Text(lotteryList.winnerName.toString()),
                  Text(
                    lotteryList.userMap.toString(),
                    softWrap: true,
                  ),
                  //Text(test.winnerName),
                  RaisedButton(
                    child: Text('Create file'),
                    onPressed: () {
                      lotteryList.writeFile(file);
                      print(dir.path);
                    },
                  ),
                  RaisedButton(
                    child: Text('Read file'),
                    onPressed: () {
                      lotteryList.readFile(file);
                    },
                  ),
                  RaisedButton(
                    child: Text('Add name'),
                    onPressed: () {
                      //TextField();
                      lotteryList.addName(file, 'Jason');
                    },
                  ),
                  RaisedButton(
                    child: Text('Clear List'),
                    onPressed: () {
                      lotteryList.clearMap();
                    },
                  ),
                  RaisedButton(
                    child: Text('Choose Winner'),
                    onPressed: () => lotteryList.chooseWinner(),
                  ),
                  RaisedButton(
                    child: Text('Video Test'),
                    onPressed: () {
                      Navigator.pushNamed(context, Screen2.id);
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
