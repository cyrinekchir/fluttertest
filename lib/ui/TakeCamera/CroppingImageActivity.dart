import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/database/Repository/PictureRepository.dart';
import 'package:flutter_app/database/database.dart';
import 'package:image_crop/image_crop.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' show join;
import 'package:flutter_app/model/picture.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key key, this.myFile, this.picture}) : super(key: key);
  final File myFile;
  final Picture picture;

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final cropKey = GlobalKey<CropState>();

  File _file;
  Picture picture;

  @override
  Widget build(BuildContext context) {
    _file = widget.myFile;
    picture = widget.picture;
    return MaterialApp(
      home: SafeArea(
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
          child: _buildCroppingImage(),
        ),
      ),
    );
  }

  Widget _buildOpeningImage() {
    return Center(child: _buildOpenImage());
  }

  Widget _buildCroppingImage() {
    return Column(
      children: <Widget>[
        Expanded(
          child: Crop.file(
            _file,
            key: cropKey,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 20.0),
          alignment: AlignmentDirectional.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
                child: Text(
                  'Crop Image',
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.white),
                ),
                onPressed: () => _cropImage(),
              ),
              //_buildOpenImage(),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildOpenImage() {
    return FlatButton(
      child: Text(
        'Open Image',
        style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),
      ),
      onPressed: () => _openImage(),
    );
  }

  Future<void> _openImage() async {
    final file = await ImagePicker.pickImage(source: ImageSource.gallery);
    final sample = await ImageCrop.sampleImage(file: file, preferredSize: 2000);

    setState(() {
      _file = sample;
    });
  }

  Future<void> _cropImage() async {
    final scale = cropKey.currentState.scale;
    final area = cropKey.currentState.area;
    if (area == null) {
      // cannot crop, widget is not setup
      return;
    }

    final file =
        await ImageCrop.cropImage(file: _file, area: area, scale: scale);
    // copy the file to a new path

    picture.url = file.path;
    DatabaseProvider databaseProvider = DatabaseProvider.get;
    PictureRepository pictureRepository =
        new PictureRepository(databaseProvider);
    pictureRepository.update(picture).then((value) {
      Navigator.pop(context, false);
      Navigator.pop(context,false);
    });
  }
}
