import 'package:flutter/material.dart';
import 'package:flutter_app/ui/contactlist/contact_list_item.dart';
import 'package:flutter_app/model/contact.dart';


class ContactsList extends StatelessWidget {
  static const String routeName = "/parse";
  final List<ContactModal> _contactModal;

  ContactsList(this._contactModal);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      children: _buildContactsList()

    );
  }

  List<ContactListItem> _buildContactsList() {
    return _contactModal
        .map((contact) => ContactListItem(contact))
        .toList();
  }
}
