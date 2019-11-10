import 'package:flutter_app/database/database.dart';
import 'package:flutter_app/model/user.dart';
abstract class AbstractUserRepository {
  DatabaseProvider databaseProvider;
  Future<User> insert(User note);
  Future<User> update(User note);
  Future<User> delete(User note);
  Future<List<User>> getNotes();
}