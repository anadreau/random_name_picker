import 'dart:io';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_name_picker/components/rive_stuff.dart';
import 'package:random_name_picker/data/user_file.dart';
import 'package:random_name_picker/components/constants.dart';

Directory dir = Directory.current;
File file = File(dir.path + '/Goon_Lottery.txt');

class Screen3 extends StatelessWidget {
  static const String id = 'Test';
  final FocusNode nameFocusNode = FocusNode();

  final _controller = TextEditingController();
  final String addName = '';

  @override
  Widget build(BuildContext context) {
    final lotteryList = Provider.of<UserModel>(context);

    return Scaffold(
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
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.grey[700],
          // height: 1000,
          // width: 1000,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                      // flex: 1,
                      child: Container(
                        child: Image.asset(
                          'assets/images/JB.png',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(alignment: Alignment.center, children: <Widget>[
                      Image(
                        image: AssetImage('assets/images/chat.png'),
                        height: 350,
                        width: 300,
                      ),
                      Text(lotteryList.winnerName.toString(),
                          style: TextStyle(
                              color: Color(0xFFd80707),
                              fontWeight: FontWeight.bold,
                              fontSize: 38.0)),
                    ]),
                    SizedBox(
                      height: 150.0,
                    ),
                    ElevatedButton(
                        child: Text(
                          'Choose Winner',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: kGoonBlue,
                          onPrimary: kGoonRed,
                        ),
                        //elevation: 10.0,
                        //color: kGoonBlue,
                        //splashColor: kGoonRed,
                        //shape: RoundedRectangleBorder(
                        //borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          lotteryList.readFile(file);
                          lotteryList.chooseWinner();
                        }),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Center(
                      child: SizedBox(
                        height: 400,
                        width: 400,
                        child: RiveStuff(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
