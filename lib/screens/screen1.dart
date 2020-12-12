import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_name_picker/data/user_file.dart';
//import 'package:random_name_picker/screens/screen2.dart';
import 'package:random_name_picker/components/constants.dart';

Directory dir = Directory.current;
File file = File(dir.path + '/Goon_Lottery.txt');

class Screen1 extends StatelessWidget {
  static const String id = 'home';
  final FocusNode nameFocusNode = FocusNode();

  final _controller = TextEditingController();
  final String addName = '';

  @override
  Widget build(BuildContext context) {
    final lotteryList = Provider.of<UserModel>(context);
    // final lotteryList = UserModel();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[700],
        body: Row(
          children: [
            Center(child: Image.asset('assets/images/JB.png')),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Goonscription Winner',
                    style: kGoonBlue,
                  ),
                  Text(lotteryList.winnerName.toString(), style: kGoonRed),
                  Text(lotteryList.userMap.toString(),
                      softWrap: true, style: kGoonBlue),
                  //Text(test.winnerName),
                  RaisedButton(
                    child: Text('Create file'),
                    onPressed: () {
                      lotteryList.writeFile(file);
                      print(dir.path);
                    },
                  ),

                  Container(
                    height: 40.0,
                    width: 150.0,
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        hintText: 'Add Name',
                        filled: true,
                        fillColor: Colors.grey[200],
                        prefixIcon: Icon(Icons.add),
                      ),
                      controller: _controller,
                      focusNode: nameFocusNode,
                      onSubmitted: (String addName) {
                        addName = _controller.text;
                        lotteryList.addName(file, addName);
                        _controller.clear();
                        nameFocusNode.requestFocus();
                      },
                    ),
                  ),
                  // RaisedButton(
                  //   child: Text('Add name'),
                  //   onPressed: () {
                  //     addName = _controller.text;
                  //     lotteryList.addName(file, addName);
                  //     _controller.clear();
                  //   },
                  // ),
                  RaisedButton(
                    child: Text('Read file'),
                    onPressed: () {
                      lotteryList.readFile(file);
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
                  // RaisedButton(
                  //   child: Text('Video Test'),
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, Screen2.id);
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
