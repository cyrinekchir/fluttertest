import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'Dao/pictureDao.dart';
import 'Dao/userDao.dart';

class DatabaseProvider {
  static final _instance = DatabaseProvider._internal();
  static DatabaseProvider get = _instance;
  //static final init = db();
  bool isInitialized = false;
  Database _db;

  DatabaseProvider._internal();

  Future<Database> db() async {
    if (!isInitialized) await _init();
    return _db;
  }

  Future _init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, "todo_app.db");

    _db = await openDatabase(path, version: 5,
        onCreate: (Database db, int version) async {
      await db.execute(UserDao().createTableQuery);
      await db.execute(PictureDao().createTableQuery);
    });
  }
}
