import 'package:flutter/material.dart';
import 'package:flutter_app/model/user.dart';

class UpdateUser extends StatelessWidget {
  User user;
  static const String routeName = "/detail";
  final myController = TextEditingController();
  final myController2 = TextEditingController();

  UpdateUser(user);

  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myController2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //_showPopupForUpdate(context, user);
    return new Row(children: <Widget>[
      TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.account_circle),
          labelText: 'Username',
        ),
        controller: myController2,
      ),
      TextField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.lock),
          labelText: 'Password',
        ),
        controller: myController,
      ),
    ]);
  }
}
