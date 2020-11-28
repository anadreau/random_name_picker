import 'dart:io';
import 'dart:async';
import 'package:random_name_picker/components/randomizer.dart';

import 'package:random_name_picker/main.dart';
//import 'package:path_provider/path_provider.dart';

Map<int, String> userMap = Map<int, String>();

main(List<String> arguments) {
  Directory dir = Directory.current;

  print(dir.path);

  File file = File(dir.path + '/filetest.txt');

  writeFile(file);
  readFile(file);
}

void writeFile([File file]) {
  //Append, Write

  RandomAccessFile raf = file.openSync(mode: FileMode.write);

  raf.writeStringSync('Hello!\r\nThis is a test.');
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
}

void mapFile(File file, value) {
  int i;
  userMap.putIfAbsent(userMap.length + 1, () => value);
}

void readMap() {
  print(userMap);
  print(userMap.length);
}

void chooseWinner() {
  //choosing random winner from map
  int value = numberGenerator(1, userMap.length + 1);
  print(userMap[value]);
}

void clearMap() {
  //clearing map of names
  userMap.clear();
}
