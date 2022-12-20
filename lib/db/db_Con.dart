import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';

class DbCon {
  Future<Database> setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'contact_db');
    var database =
    await openDatabase(path, version: 1, onCreate: createDatabase);
    return database;
  }

  Future<void> createDatabase(Database database, int version) async {
    String sql =
        "CREATE TABLE users (id INTEGER PRIMARY KEY,name TEXT,contactNumber Text,description TEXT , emailAddress TEXT);";
    await database.execute(sql);
  }
}
