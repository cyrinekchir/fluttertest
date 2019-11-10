import 'package:flutter/material.dart';
import 'package:flutter_app/ui/GridView/PictureGridView.dart';
import 'package:flutter_app/ui/connectedUser/contact_pageState.dart';
import 'package:flutter_app/ui/contactlist/contact_pageState.dart';

class TabBarMenu extends StatelessWidget {
  static const String routeName = "/tabbar";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Center(
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                  title: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.account_circle)),
                  Tab(icon: Icon(Icons.list)),
                  Tab(icon: Icon(Icons.photo_camera))
                ],
              )),
              body: TabBarView(
                children: [
                  Home(),
                  UserConnectedList(),
                  GridViewList()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
