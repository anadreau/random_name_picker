import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
              child: Container(
                child: Image(
                  image: AssetImage('assets/images/chat.png'),
                  height: 200,
                  width: 400,
                ),
              ), // This is the widget you actually want to show.
            ),
            LayoutId(
              id: 2, // You will need to refer to that id when laying out your children.
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Goonscription Winner',
                          style: kGoonBlueStyle,
                        ),
                        Text(lotteryList.winnerName.toString(),
                            style: kGoonRedStyle),
                        RaisedButton(
                            child: Text('Choose Winner'),
                            onPressed: () {
                              lotteryList.readFile(file);
                              lotteryList.chooseWinner();
                            }),
                      ],
                    ),
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

class MyDelegate extends MultiChildLayoutDelegate {
  MyDelegate({this.position});

  final Offset position;

  @override
  void performLayout(Size size) {
    Size leadingSize = Size
        .zero; // If there is no widget with id `1`, the size will remain at zero.
    // Remember that `1` here can be any **id** - you specify them using LayoutId.
    if (hasChild(1)) {
      leadingSize = layoutChild(
        1, // The id once again.
        BoxConstraints.loose(
            size), // This just says that the child cannot be bigger than the whole layout.
      );
      // No need to position this child if we want to have it at Offset(0, 0).
      positionChild(1, Offset(0, 0));
    }

    if (hasChild(2)) {
      final secondSize = layoutChild(
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
          100, 400, // Centers the second child vertically.
        ),
      );
    }
    if (hasChild(3)) {
      final thirdSize = layoutChild(
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
          300, 100, // Centers the second child vertically.
        ),
      );
    }
  }

  @override
  bool shouldRelayout(MyDelegate oldDelegate) {
    return oldDelegate.position != position;
  }
}
