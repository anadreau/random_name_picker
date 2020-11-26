import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future main() async {
  // Init ffi loader if needed.
  sqfliteFfiInit();

  var databaseFactory = databaseFactoryFfi;
  var db = await databaseFactory.openDatabase(inMemoryDatabasePath);
  await db.execute('''
  CREATE TABLE IF NOT EXISTS Product (
      id INTEGER PRIMARY KEY,
      title TEXT
  )
  ''');
  db.close();
  await db.execute('''UPDATE Product''');
  await db.insert('Product', <String, dynamic>{'title': 'John'});
  await db.insert('Product', <String, dynamic>{'title': 'Jason'});

  var result = await db.query('Product');
  print(result);
  // prints [{id: 1, title: Product 1}, {id: 2, title: Product 1}]
  await db.close();
}
