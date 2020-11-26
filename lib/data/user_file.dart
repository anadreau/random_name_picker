import 'dart:io';
import 'dart:async';
//import 'package:path_provider/path_provider.dart';

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
}

void addName(File file, String name) {
  RandomAccessFile raf = file.openSync(mode: FileMode.append);

  raf.writeStringSync('\n' + name);
  raf.flushSync();
  raf.closeSync();
}
