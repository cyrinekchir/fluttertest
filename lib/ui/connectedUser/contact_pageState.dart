import 'package:flutter/material.dart';
import 'package:flutter_app/ui/connectedUser/userList.dart';
import 'package:flutter_app/model/user.dart';
import 'package:flutter_app/database/Repository/UserRepository.dart';
import 'package:flutter_app/database/database.dart';
import 'dart:async';

class UserConnectedList extends StatefulWidget {
  static const String routeName = "/users";

  @override
  _UserConnectedState createState() => _UserConnectedState();
}

class _UserConnectedState extends State<UserConnectedList> {
  List<User> _users = new List();
  Timer timer;

  @override
  void initState() {
    listenForUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child:  UserList(_users, listenForUsers()),
        ));
  }

  listenForUsers() {
    DatabaseProvider databaseProvider = DatabaseProvider.get;
    UserRepository user1Repository = new UserRepository(databaseProvider);
    Stream<List<User>> users = user1Repository.getNotes().asStream();
    users.listen((List<User> user) => setState(() => _users = user));
  }
}
