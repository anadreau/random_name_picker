import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_name_picker/data/user_data.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orange,
        body: Center(
          child: Column(
            children: [
              Text('UserData'),
              Text(''),
            ],
          ),
        ),
      ),
    );
  }
}
