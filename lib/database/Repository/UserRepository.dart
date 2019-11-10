import 'package:flutter_app/database/database.dart';
import 'package:flutter_app/model/user.dart';
import 'package:flutter_app/database/Repository/AbstractUserRepository.dart';
import '../Dao/userDao.dart';
class UserRepository implements AbstractUserRepository {
  final dao = UserDao();

  @override
  DatabaseProvider databaseProvider;

  UserRepository(this.databaseProvider);

  @override
  Future<User> delete(User user) async {
    final db = await databaseProvider.db();
    await db.delete(dao.tableName,
        where: dao.columnId + " = ?", whereArgs: [user.id]);
    return user;
  }

  @override
  Future<List<User>> getNotes() async{
    final db = await databaseProvider.db();
    List<Map> maps = await db.query(dao.tableName);
    return dao.fromList(maps);
  }

  @override
  Future<User> insert(User user) async {
    final db = await databaseProvider.db();
    user.id = await db.insert(dao.tableName, dao.toMap(user));
    return user;
  }

  @override
  Future<User> update(User note) async {
    final db = await databaseProvider.db();
    await db.update(dao.tableName, dao.toMap(note),
        where: dao.columnId + " = ?", whereArgs: [note.id]);
    return note;
  }


}