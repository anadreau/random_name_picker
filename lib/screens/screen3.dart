import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:random_name_picker/data/user_file.dart';
import 'package:random_name_picker/components/constants.dart';
//
// class Screen3 extends StatelessWidget {
//   static const String id = 'test';
//   @override
//   Widget build(BuildContext context) {
//     return CustomMultiChildLayout(
//       delegate: MyDelegate(),
//       children: [
//         LayoutId(
//           id: 1, // The id can be anything, i.e. any Object, also an enum value.
//           child: Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 alignment: Alignment(-1.2, -.1),
//                 image: AssetImage('assets/images/JB.png'),
//               ),
//             ),
//             foregroundDecoration: BoxDecoration(
//               image: DecorationImage(
//                   alignment: Alignment(.2, -.8),
//                   scale: 3.0,
//                   image: AssetImage('assets/images/chat.png')),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Center(
//                   child: Column(
//                     children: [
//                       Text(
//                         'Goonscription Winner',
//                         style: kGoonBlueStyle,
//                       ),
//                       Text(lotteryList.winnerName.toString(),
//                           style: kGoonRedStyle),
//                       RaisedButton(
//                           child: Text('Choose Winner'),
//                           onPressed: () {
//                             lotteryList.readFile(file);
//                             lotteryList.chooseWinner();
//                           }),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ), // This is the widget you actually want to show.
//         ),
//         LayoutId(
//           id: 2, // You will need to refer to that id when laying out your children.
//           child: Text('Widget two'),
//         ),
//       ],
//     );
//   }
// }
//
// class MyDelegate extends MultiChildLayoutDelegate {
//   MyDelegate({this.position});
//
//   final Offset position;
//
//   @override
//   void performLayout(Size size) {
//     Size leadingSize = Size
//         .zero; // If there is no widget with id `1`, the size will remain at zero.
//     // Remember that `1` here can be any **id** - you specify them using LayoutId.
//     if (hasChild(1)) {
//       leadingSize = layoutChild(
//         1, // The id once again.
//         BoxConstraints.loose(
//             size), // This just says that the child cannot be bigger than the whole layout.
//       );
//       // No need to position this child if we want to have it at Offset(0, 0).
//       positionChild(1, Offset(100, 100));
//     }
//
//     if (hasChild(2)) {
//       final secondSize = layoutChild(
//         2,
//         BoxConstraints(
//           // This is exactly the same as above, but this can be anything you specify.
//           // BoxConstraints.loose is a shortcut to this.
//           maxWidth: size.width,
//           maxHeight: size.height,
//         ),
//       );
//
//       positionChild(
//         2,
//         Offset(
//           leadingSize.width, // This will place child 2 to the right of child 1.
//           size.height / 2 -
//               secondSize.height / 2, // Centers the second child vertically.
//         ),
//       );
//     }
//   }
//
//   @override
//   bool shouldRelayout(MyDelegate oldDelegate) {
//     return oldDelegate.position != position;
//   }
// }
