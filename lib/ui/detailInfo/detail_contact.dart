import 'package:flutter/material.dart';
import 'package:flutter_app/model/contact.dart';

class DetailContract extends StatelessWidget {
  final ContactModal _contactModal;
  static const String routeName = "/detail";

  DetailContract(this._contactModal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        // Title
        title: Text("Details page"),
        // App Bar background color
      ),
      // Body
      body: Container(
        // Center the content
        child: Container(
          child: Column(
            // Center content in the column
            // mainAxisAlignment: MainAxisAlignment.center,
            // add children to the column
            children: <Widget>[
              // Text
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
                child: Column(
                  children: <Widget>[
                    Text(
                      _contactModal.fullName,
                      // Setting the style for the Text
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                      // Set text alignment to center
                      textAlign: TextAlign.center,
                    ),
                    new Container(margin: const EdgeInsets.only(top: 10.0)),
                    Text(
                      _contactModal.email,
                      // Setting the style for the Text
                      style: TextStyle(fontSize: 15.0
                          , color: Colors.black38),
                      // Set text alignment to center
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
