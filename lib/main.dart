import 'package:flutter/material.dart';
import 'package:random_name_picker/screens/screen1.dart';
import 'package:random_name_picker/screens/screen2.dart';
import 'package:provider/provider.dart';
import 'package:random_name_picker/data/user_file.dart';
import 'package:random_name_picker/screens/screen2.dart';
import 'screens/screen1.dart';
import 'data/user_file.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserModel(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: Screen1.id,
          routes: {
            Screen1.id: (context) => Screen1(),
            Screen2.id: (context) => Screen2(),
          }),
    );
  }
}
