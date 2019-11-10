import 'package:flutter/material.dart';
import 'package:flutter_app/ui/connectedUser/contact_list_item.dart';
import 'package:flutter_app/model/user.dart';

class UserList extends StatelessWidget {
  final List<User> _users;
  Function() notifyParent;
  UserList(this._users , notifyParent);

  @override
  Widget build(BuildContext context) {

    return new ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: _buildContactsList());
  }

  List<ConnectedUserItem> _buildContactsList() {
    return _users.map((user) => ConnectedUserItem(user, notifyParent)).toList();
  }
}
