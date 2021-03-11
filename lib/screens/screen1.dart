import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'screen2.dart';
import 'package:random_name_picker/data/user_file.dart';
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
        drawer: Drawer(
          child: Container(
            color: Colors.grey[700],
            child: ListView(
              //padding: EdgeInsets.zero,
              padding: EdgeInsets.all(12.0),
              children: <Widget>[
                DrawerHeader(
                  child: Text(
                    'Goon Settings',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    image: DecorationImage(
                        image: AssetImage('assets/images/JB.png')),
                  ),
                ),
                ListTile(
                  tileColor: kGoonRed,
                  title: Text(
                    'Create file',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  onTap: () {
                    lotteryList.writeFile(file);
                    print(dir.path);
                  },
                ),
                Divider(),
                ListTile(
                  tileColor: kGoonBlue,
                  title: Text(
                    'Reset',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  onTap: () {
                    lotteryList.clearMap();
                  },
                ),
                Divider(),
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
              ],
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment(-1.2, -.1),
              image: AssetImage('assets/images/JB.png'),
            ),
          ),
          foregroundDecoration: BoxDecoration(
            image: DecorationImage(
                alignment: Alignment(.2, -.8),
                scale: 3.0,
                image: AssetImage('assets/images/chat.png')),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Center(child: Image.asset('assets/images/JB.png')),
                Center(
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Goonscription Winner',
                        style: kGoonBlueStyle,
                      ),
                      Text(lotteryList.winnerName.toString(),
                          style: kGoonRedStyle),
                      // Text(lotteryList.userMap.toString(),
                      //     softWrap: true, style: kGoonBlue),
                      //Text(test.winnerName),
                      // RaisedButton(
                      //   child: Text('Create file'),
                      //   onPressed: () {
                      //     lotteryList.writeFile(file);
                      //     print(dir.path);
                      //   },
                      // ),

                      // Container(
                      //   height: 40.0,
                      //   width: 150.0,
                      //   child: TextField(
                      //     decoration: InputDecoration(
                      //       enabledBorder: OutlineInputBorder(
                      //           borderSide: BorderSide(color: Colors.transparent),
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(30.0))),
                      //       focusedBorder: OutlineInputBorder(
                      //           borderSide: BorderSide(color: Colors.transparent),
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(30.0))),
                      //       hintText: 'Add Name',
                      //       filled: true,
                      //       fillColor: Colors.grey[200],
                      //       prefixIcon: Icon(Icons.add),
                      //     ),
                      //     controller: _controller,
                      //     focusNode: nameFocusNode,
                      //     onSubmitted: (String addName) {
                      //       addName = _controller.text;
                      //       lotteryList.addName(file, addName);
                      //       _controller.clear();
                      //       nameFocusNode.requestFocus();
                      //     },
                      //   ),
                      // ),
                      // RaisedButton(
                      //   child: Text('Add name'),
                      //   onPressed: () {
                      //     addName = _controller.text;
                      //     lotteryList.addName(file, addName);
                      //     _controller.clear();
                      //   },
                      // ),
                      // RaisedButton(
                      //   child: Text('Read file'),
                      //   onPressed: () {
                      //     lotteryList.readFile(file);
                      //   },
                      // ),
                      // RaisedButton(
                      //   child: Text('Clear List'),
                      //   onPressed: () {
                      //     lotteryList.clearMap();
                      //   },
                      // ),
                      ElevatedButton(
                          child: Text('Choose Winner'),
                          onPressed: () {
                            lotteryList.readFile(file);
                            lotteryList.chooseWinner();
                          }),
                      ElevatedButton(
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
        ),
      ),
    );
  }
}
