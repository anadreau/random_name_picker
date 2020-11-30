import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:random_name_picker/components/randomizer.dart';

class UserModel extends ChangeNotifier {
  Map<int, String> userMap = Map<int, String>();
  String winnerName;

  void writeFile([File file]) {
    //Append, Write

    RandomAccessFile raf = file.openSync(mode: FileMode.write);

    raf.writeStringSync('Monthly Lottery Names');
    raf.flushSync();
    raf.closeSync();
  }

  void readFile(File file) {
    if (!file.existsSync()) {
      print('file not found!');
      return;
    }

    print('Reading string...');
    // print(file.readAsStringSync());

    // print('Reading bytes.....');
    List values = file.readAsLinesSync();
    values.forEach((value) => print(value));
    values.forEach((value) => mapFile(file, value));
  }

  void addName(File file, String name) {
    RandomAccessFile raf = file.openSync(mode: FileMode.append);

    raf.writeStringSync('\n' + name);
    raf.flushSync();
    raf.closeSync();
    notifyListeners();
  }

  void mapFile(File file, value) {
    //int i;
    userMap.putIfAbsent(userMap.length + 1, () => value);
    notifyListeners();
  }

  void clearMap() {
    //used to clear the map of all values
    //does not clear the actual file of data
    userMap.clear();
    print(userMap);
    print(userMap.length);
    notifyListeners();
  }

  void chooseWinner() {
    //choosing random winner from map
    //needs map to choose name so will give error if map is not created first

    int value = numberGenerator(1, userMap.length + 1);
    winnerName = userMap[value];

    print(winnerName);
    print(userMap[value]);
    notifyListeners();
  }
}

// main(List<String> arguments) {
//   Directory dir = Directory.current;
//
//   print(dir.path);
//
//   File file = File(dir.path + '/filetest.txt');
//
//   writeFile(file);
//   readFile(file);
// }
