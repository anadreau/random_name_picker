import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:random_name_picker/data/user_file.dart';
import 'package:random_name_picker/components/constants.dart';

class Screen3 extends StatelessWidget {
  static const String id = 'Test';
  // final FocusNode nameFocusNode = FocusNode();

  // final _controller = TextEditingController();
  // final String addName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.grey[700],
          // height: 1000,
          // width: 1000,
          child: Row(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      // color: Colors.black,
                      // width: 250,
                      // height: 800,
                      child: Image.asset(
                        'assets/images/JB.png',
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/chat.png'),
                    height: 350,
                    width: 300,
                  ),
                  SizedBox(
                    height: 200.0,
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
                        // lotteryList.readFile(file);
                        // lotteryList.chooseWinner();
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
