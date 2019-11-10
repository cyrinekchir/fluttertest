// A screen that allows users to take a picture using a given camera.
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/database/Repository/PictureRepository.dart';
import 'package:flutter_app/database/database.dart';
import 'package:flutter_app/model/picture.dart';
import 'package:flutter_app/ui/TakeCamera/CameraActivity.dart';

class GridViewList extends StatefulWidget {
  @override
  GridViewListState createState() => GridViewListState();
}

class GridViewListState extends State<GridViewList> {
  List<Picture> _pictures = List<Picture>();

  @override
  void initState() {
    super.initState();
    listenForPictures();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Gallery Pictures'),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 5.0,
          children: _pictures
              .map((data) => Card(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                            flex: 8,
                            child: Align(
                                alignment: FractionalOffset.bottomCenter,
                                child: Padding(
                                    padding: EdgeInsets.only(bottom: 1.0),
                                    child: Image.file(
                                      File(data.url),
                                      fit: BoxFit.fitHeight,
                                    ) //Your widget here,
                                    ))),
                        Expanded(
                          flex: 2,
                          child: Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child: Text(data.dateTime) //Your widget here,
                                  )),
                        )
                      ],
                    ),
                  ))
              .toList(),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera_alt),
          onPressed: () async {
            final cameras = await availableCameras();
            final firstCamera = cameras.first;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  TakePictureScreen(camera: firstCamera),
              ),
            ).then((val) {
              listenForPictures();
            });
          },
        ));
  }

  listenForPictures() {
    DatabaseProvider databaseProvider = DatabaseProvider.get;
    PictureRepository pictureRepository =
        new PictureRepository(databaseProvider);
    Stream<List<Picture>> pictures = pictureRepository.getPictures().asStream();
    pictures
        .listen((List<Picture> picture) => setState(() => _pictures = picture));
  }
}
