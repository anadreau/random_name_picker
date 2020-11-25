import 'dart:io';
//import 'package:path_provider/path_provider.dart';

main(List<String> arguments) {
  Directory dir = Directory.current;
  print(dir.path);

  File file = File(dir.path + '/filetest.txt');

  writeFile(file);
  readFile(file);
}

void writeFile(File file) {
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
  print(file.readAsStringSync());

  print('Reading bytes.....');
  List values = file.readAsBytesSync();
  values.forEach((value) => print(value));
}

// class UserStorage {
//   Future<String> get _localPath async {
//     final directory = await getApplicationDocumentsDirectory();
//
//     return directory.path;
//   }
//
//   Future<File> get _localFile async {
//     final path = await _localPath;
//     return File('$path/counter.txt');
//   }
//
//   Future<int> readCounter() async {
//     try {
//       final file = await _localFile;
//
//       // Read the file
//       String contents = await file.readAsString();
//
//       return int.parse(contents);
//     } catch (e) {
//       // If encountering an error, return 0
//       return 0;
//     }
//   }
//
//   Future<File> writeCounter(int counter) async {
//     final file = await _localFile;
//
//     // Write the file
//     return file.writeAsString('$counter');
//   }
// }
