import 'package:flutter/material.dart';
import 'package:random_name_picker/screens/screen1.dart';
import 'package:random_name_picker/screens/screen2.dart';
import 'package:random_name_picker/screens/screen4.dart';
import 'package:provider/provider.dart';
import 'package:random_name_picker/data/user_file.dart';
import 'screens/screen1.dart';
import 'package:random_name_picker/screens/screen3.dart';
import 'data/user_file.dart';
import 'package:random_name_picker/components/rive_stuff.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserModel(),
      child: MaterialApp(
          title: 'Random Name Picker',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: Screen3.id,
          routes: {
            Screen1.id: (context) => Screen1(),
            Screen2.id: (context) => Screen2(),
            Screen3.id: (context) => Screen3(),
            Screen4.id: (context) => Screen4(),
            RiveStuff.id: (context) => RiveStuff(),
          }),
    );
  }
}
