import 'abstractDao.dart';
import 'package:flutter_app/model/user.dart';

class UserDao implements Dao<User> {
  final tableName = 'user';
  final columnId = 'id';
  final _columnUser = 'username';
  final _columnPassword = 'password';
  final _columnDateTime = 'date_time';

  @override
  String get createTableQuery =>
      "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY,"
          " $_columnUser TEXT,"
          " $_columnDateTime TEXT,"
          " $_columnPassword TEXT)";

  @override
  User fromMap(Map<String, dynamic> query) {
    User user = User();
    user.id = query[columnId];
    user.name = query[_columnUser];
    user.password = query[_columnPassword];
    user.dateTime = query[_columnDateTime];
    return user;
  }

  @override
  Map<String, dynamic> toMap(User object) {
    return <String, dynamic>{
      _columnUser: object.name,
      _columnPassword: object.password,
      _columnDateTime : object.dateTime
    };
  }

  @override
  List<User> fromList(List<Map<String,dynamic>> query) {
    List<User> users = List<User>();
    for (Map map in query) {
      users.add(fromMap(map));
    }
    return users;
  }
}