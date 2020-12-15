import 'package:flutter/material.dart';
import 'package:random_name_picker/screens/screen1.dart';
import 'package:random_name_picker/screens/screen2.dart';
import 'package:provider/provider.dart';
import 'package:random_name_picker/data/user_file.dart';
import 'screens/screen1.dart';
import 'data/user_file.dart';

//TODO: replace icon when John sends door at Windows: windows/runner/resources/app_icon.ico

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
          initialRoute: Screen1.id,
          routes: {
            Screen1.id: (context) => Screen1(),
            Screen2.id: (context) => Screen2(),
          }),
    );
  }
}
