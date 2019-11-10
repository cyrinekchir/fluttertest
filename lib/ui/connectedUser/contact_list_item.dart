import 'package:flutter/material.dart';
import 'package:flutter_app/database/Repository/UserRepository.dart';
import 'package:flutter_app/database/database.dart';
import 'package:flutter_app/model/user.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ConnectedUserItem extends StatelessWidget {
  final User _user;
  final TextEditingController textEditingController = TextEditingController(),
      textEditingController2 = TextEditingController();
  final Function() notifyParent;

  ConnectedUserItem(this._user, this.notifyParent);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(Icons.accessibility),
        title: new InkWell(
          onTap: () {
            _showPopupForUpdate(context, _user);
          },
          child: new Text(_user.name),
        ),
        onLongPress: () => _showPopupForUpdate(context, _user),
        trailing: new FlatButton(
          onPressed: () {
            _deleteUser(context, _user);
          },
          child: new Icon(
            Icons.delete,
            color: Colors.black38,
          ),
        ),
        subtitle: Text(_user.dateTime != null ? _user.dateTime : "-"));
  }

  void _showPopupForUpdate(context, User _user) {
    textEditingController.text = _user.name;
    textEditingController2.text = _user.password;
    Alert(
        context: context,
        title: "LOGIN",
        content: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: 'Username',
              ),
              controller: textEditingController,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'Password',
              ),
              controller: textEditingController2,
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => _updateUser(context, textEditingController.text,
                textEditingController2.text),
            child: Text(
              "LOGIN",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  void _updateUser(context, String updateUsername, String updatePassword) {
    _user.dateTime = DateFormat('dd.MM.yyyy hh:mm:ss').format(DateTime.now());
    _user.name = updateUsername;
    _user.password = updatePassword;
    DatabaseProvider databaseProvider = DatabaseProvider.get;
    UserRepository user1Repository = new UserRepository(databaseProvider);
    user1Repository.update(_user);
    Navigator.pop(context);
  }

  _deleteUser(context, User _user) {
    DatabaseProvider databaseProvider = DatabaseProvider.get;
    UserRepository user1Repository = new UserRepository(databaseProvider);
    user1Repository.delete(_user);
    notifyParent();
  }
}
