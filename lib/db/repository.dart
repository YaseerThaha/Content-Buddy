import 'package:content_buddy/db/db_con.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  late DbCon _dbCon;

  Repository() {
    _dbCon = DbCon();
  }

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _dbCon.setDatabase();
      return _database;
    }
  }

  // insert Data
  insertData(table, data) async {
    var con = await database;
    return await con?.insert(table, data);
  }

  //Read data
  readData(table) async {
    var con = await database;
    return await con?.query(table);
  }

  // readData by ID
  readDataById(table, userId) async {
    var con = await database;
    return await con?.query(table, where: 'id=?', whereArgs: [userId]);
  }

  // UpdateData
  update(table, data) async {
    var con = await database;
    return await con?.update(
        table, data, where: 'id=?', whereArgs: [data['id']]);
  }
  deleteDataById(table, itemId) async {
    var con = await database;
    return await con?.rawDelete("delete from $table where id=$itemId");
  }
  }


