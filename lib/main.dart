import 'package:flutter/material.dart';
import 'package:flutter_app/ui/TabBar/TabBar.dart';
import 'package:flutter_app/ui/contactlist/contact_pageState.dart';
import 'package:flutter_app/ui/detailInfo/detail_contact.dart';
import 'package:flutter_app/ui/login/login_contact.dart';
import 'package:flutter_app/ui/contactlist/contact_list.dart';
import 'package:flutter_app/ui/connectedUser/contact_pageState.dart';

Future main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Test project"),
        ),
        body: LoginPage()),
    routes: <String, WidgetBuilder>{
      // Set named routes
      DetailContract.routeName: (BuildContext context) =>
          DetailContract(ModalRoute.of(context).settings.arguments),
      ContactsList.routeName: (BuildContext context) => Home(),
      UserConnectedList.routeName: (BuildContext context) =>
          UserConnectedList(),
      TabBarMenu.routeName: (BuildContext context) => TabBarMenu(),
    },
  ));
}
