import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:random_name_picker/components/randomizer.dart';

class UserModel extends ChangeNotifier {
  Map<int, String> userMap = Map<int, String>();
  String winnerName = 'The winner is...';

  void writeFile([File file]) {
    //Append, Write
    RandomAccessFile raf = file.openSync(mode: FileMode.write);

    //raf.writeStringSync('Monthly Lottery Names');
    raf.flushSync();
    raf.closeSync();
  }

  void readFile(File file) {
    //reads the file and maps values to userMap

    if (!file.existsSync()) {
      print('file not found!');
      return;
    }

    print('Reading file...');
    // TODO: Attempt to start readFile from line 1 instead of 0
    List values = file.readAsLinesSync();
    values.forEach((value) => print(value));
    values.forEach((value) => mapFile(file, value));
  }

  void mapFile(File file, value) {
    //converts file to map
    userMap.putIfAbsent(userMap.length + 1, () => value);
    notifyListeners();
  }

  void addName(File file, String name) {
    //Add name to file
    // TODO: add way to get input from user and then right to file
    RandomAccessFile raf = file.openSync(mode: FileMode.append);

    raf.writeStringSync(name + '\n');
    raf.flushSync();
    raf.closeSync();
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
    winnerName = userMap[value].toString();

    print(winnerName);
    print(userMap[value]);
    notifyListeners();
  }
}
