import 'package:flutter_learn_bipul/users/user_model.dart';
import 'package:sqflite/sqflite.dart';

class UserDBHelper{
  var _userTableName = "users";
  // create db file

  Future<String>_createDBFile()async{
    var dbPath = await getDatabasesPath();
    return "$dbPath/users.db";
  }

  Future<Database>_initDb()async{
    // get db file name
    var dbPath = await _createDBFile();
    // open file to create it database
    return await openDatabase(dbPath,version:1,onCreate: (db,v)async{
      // write query for table with fields
      var query = "CREATE TABLE $_userTableName ('id' INTEGER PRIMARY KEY, 'name' TEXT, 'email' TEXT, 'phone' TEXT, 'gender' TEXT)";
      // execute your query with database
      await db.execute(query);

    });
  }

  insertUser(UserModel data)async{
    var db = await _initDb();
    await db.insert(_userTableName, data.toJson());
  }

  updateTableUser(UserModel data)async{
    var db = await _initDb();
    await db.update(_userTableName, data.toJson(),where: "id = ?", whereArgs: [data.id]);
  }

  Future<List<Map<String, Object?>>> getTableUsers()async{
    var db = await _initDb();
    return await db.query(_userTableName);
  }

  deleteTableUser(int id)async{
    var db = await _initDb();
    await db.delete(_userTableName,where: "id = ?", whereArgs: [id]);
  }
}