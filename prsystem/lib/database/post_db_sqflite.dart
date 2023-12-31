import 'package:prsystem/modal/mUser.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';
import 'dart:io';

class PostDBSqflite {
  late String databaseName;

  PostDBSqflite({required this.databaseName});

  Future<sqflite.Database> openDatabase() async {
    var appDocumentDirectory = await getApplicationDocumentsDirectory();
    var databaseLocationInApp =
        join(appDocumentDirectory.path, this.databaseName);
    var database = await sqflite.openDatabase(
      databaseLocationInApp,
      version: 1,
      onCreate: (db, version) async {
        var sql =
            "CREATE TABLE IF NOT EXISTS user (id INTEGER PRIMARY KEY AUTOINCREMENT,empCode TEXT,empName TEXT,empLname TEXT,empSection TEXT,empPosition TEXT,empDepartment TEXT,empUsername TEXT,empPassword TEXT,empEmail TEXT)";

        await db.execute(sql);
      },
    );
    return database;
  }

  Future<int> save(mUser post) async {
    var database = await this.openDatabase();
    var sql =
        "INSERT INTO user (empCode,empName,empLname,empSection,empPosition,empDepartment,empUsername,empPassword,empEmail) VALUES (?,?,?,?,?,?,?,?,?)";

    var dataID = database.rawInsert(sql, [
      post.empCode,
      post.empName,
      post.empLname,
      post.empSection,
      post.empPosition,
      post.empDepartment,
      post.empUsername,
      post.empPassword,
      post.empEmail
    ]);

    return dataID;
  }

  Future<List<mUser>> loadUser() async {
    var database = await this.openDatabase();
    var sql = "SELECT * FROM user ORDER BY id DESC";
    var result = await database.rawQuery(sql);
    List<mUser> userList = [];
    for (var e in result) {
      var _user = mUser(
          empCode: e['empCode'].toString(),
          empName: e['empName'].toString(),
          empLname: e['empLname'].toString(),
          empSection: e['empSection'].toString(),
          empPosition: e['empPosition'].toString(),
          empDepartment: e['empDepartment'].toString(),
          empUsername: e['empUsername'].toString(),
          empPassword: e['empPassword'].toString(),
          empEmail: e['empEmail'].toString());
      userList.add(_user);
    }

    return userList;
  }

  Future<bool> clearData() async {
    var database = await this.openDatabase();
    var sql = "DELETE FROM user ";
    await database.execute(sql);
    return true;
  }
}
