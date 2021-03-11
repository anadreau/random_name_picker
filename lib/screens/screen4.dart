import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen2.dart';
import 'package:random_name_picker/data/user_file.dart';
import 'package:random_name_picker/components/constants.dart';

Directory dir = Directory.current;
File file = File(dir.path + '/Goon_Lottery.txt');

class Screen4 extends StatelessWidget {
  static const String id = 'positionTest';
  final FocusNode nameFocusNode = FocusNode();

  final _controller = TextEditingController();
  final String addName = '';

  @override
  Widget build(BuildContext context) {
    final lotteryList = Provider.of<UserModel>(context);

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
        body: CustomMultiChildLayout(
          delegate: MyDelegate(),
          children: [
            LayoutId(
              id: 1, // The id can be anything, i.e. any Object, also an enum value.
              child: Container(
                child: Image(image: AssetImage('assets/images/JB.png')),
              ), // This is the widget you actually want to show.
            ),
            LayoutId(
              id: 3, // The id can be anything, i.e. any Object, also an enum value.
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 800,
                    width: 500,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage('assets/images/chat.png'),
                      height: 350,
                      width: 400,
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(lotteryList.winnerName.toString(),
                          style: TextStyle(
                              color: Color(0xFFd80707),
                              fontWeight: FontWeight.bold,
                              fontSize: 45.0)),
                    ),
                  ),
                  Positioned(
                    top: 400,
                    right: 150,
                    child: ElevatedButton(
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
                  ),
                  // Positioned(
                  //   top: 450,
                  //   right: 150,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(20.0),
                  //     child: ElevatedButton(
                  //       child: Text('Video Test'),
                  //       style: ElevatedButton.styleFrom(
                  //         primary: kGoonBlue,
                  //         onPrimary: kGoonRed,
                  //       ),
                  //       onPressed: () {
                  //         Navigator.pushNamed(context, Screen2.id);
                  //       },
                  //     ),
                  //   ),
                  // ),
                ],
              ), // This is the widget you actually want to show.
            ),
            // LayoutId(
            //   id: 2, // You will need to refer to that id when laying out your children.
            //   //mainAxisAlignment: MainAxisAlignment.center,
            //   child: Column(
            //     children: [
            //       RaisedButton(
            //           child: Text(
            //             'Choose Winner',
            //             style: TextStyle(
            //               fontSize: 18.0,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //           elevation: 10.0,
            //           color: kGoonBlue,
            //           splashColor: kGoonRed,
            //           shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(20)),
            //           onPressed: () {
            //             lotteryList.readFile(file);
            //             lotteryList.chooseWinner();
            //           }),
            //     ],
            //   ),
            // ),
            // LayoutId(
            //   id: 4,
            //   child: Text(
            //     lotteryList.winnerName.toString(),
            //     style: kGoonRedStyle,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class MyDelegate extends MultiChildLayoutDelegate {
  MyDelegate({this.position});

  final Offset position;

  @override
  void performLayout(Size size) {
    Size leadingSize = Size
        .zero; // If there is no widget with id `1`, the size will remain at zero.
    // Remember that `1` here can be any **id** - you specify them using LayoutId.
    if (hasChild(1)) {
      //id 1 is Sock
      leadingSize = layoutChild(
        1, // The id once again.
        BoxConstraints.loose(
            size), // This just says that the child cannot be bigger than the whole layout.
      );
      // No need to position this child if we want to have it at Offset(0, 0).
      positionChild(1, Offset(-100, 0));
    }

    if (hasChild(2)) {
      //id 2 is the winner button
      layoutChild(
        2,
        BoxConstraints(
          // This is exactly the same as above, but this can be anything you specify.
          // BoxConstraints.loose is a shortcut to this.
          maxWidth: size.width,
          maxHeight: size.height,
        ),
      );

      positionChild(
        2,
        Offset(
          leadingSize.width / 2, 400, // Centers the second child vertically.
        ),
      );
    }
    if (hasChild(3)) {
      //id 3 is the chat image
      layoutChild(
        3,
        BoxConstraints(
          // This is exactly the same as above, but this can be anything you specify.
          // BoxConstraints.loose is a shortcut to this.
          maxWidth: size.width,
          maxHeight: size.height,
        ),
      );

      positionChild(
        3,
        Offset(
          leadingSize.width / 2, 50, // Centers the second child vertically.
        ),
      );
    }
    if (hasChild(4)) {
      //id 4 is the winner text
      layoutChild(
        4,
        BoxConstraints(
          // This is exactly the same as above, but this can be anything you specify.
          // BoxConstraints.loose is a shortcut to this.
          maxWidth: size.width,
          maxHeight: size.height,
        ),
      );

      positionChild(
        4,
        Offset(
          leadingSize.width / 1.3, 140, // Centers the second child vertically.
        ),
      );
    }
  }

  @override
  bool shouldRelayout(MyDelegate oldDelegate) {
    return oldDelegate.position != position;
  }
}
