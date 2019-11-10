import 'package:flutter_app/database/database.dart';
import 'package:flutter_app/model/picture.dart';

abstract class AbstractPictureRepository {
  DatabaseProvider databaseProvider;

  Future<Picture> insert(Picture picture);

  Future<Picture> update(Picture picture);

  Future<Picture> delete(Picture picture);

  Future<List<Picture>> getPictures();
}
