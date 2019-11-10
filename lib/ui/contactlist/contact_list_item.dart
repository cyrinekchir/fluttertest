import 'package:flutter/material.dart';
import 'package:flutter_app/model/contact.dart';
import 'package:flutter_app/ui/detailInfo/detail_contact.dart';

class ContactListItem extends StatelessWidget {
  final ContactModal _contactModal;

  ContactListItem(this._contactModal);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(child: Text(_contactModal.fullName[0])),
        title: Text(_contactModal.fullName.length > 15
            ? _contactModal.fullName.substring(0, 15)
            : _contactModal.fullName),
        onTap: () => _goToNextScreen(context, _contactModal),
        subtitle: Text(_contactModal.email.length > 30
            ? _contactModal.email.substring(0, 30) + "..."
            : _contactModal.email));
  }

  void _goToNextScreen(context, _contactModal) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailContract(_contactModal),
        ));
  }
}
