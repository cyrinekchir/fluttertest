import 'abstractDao.dart';
import 'package:flutter_app/model/picture.dart';

class PictureDao implements Dao<Picture> {
  final tableName = 'picture';
  final columnId = 'id';
  final _columnUrl = 'url';
  final _columnDateTime = 'date_time';

  @override
  String get createTableQuery =>
      "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY,"
      " $_columnUrl TEXT,"
      " $_columnDateTime TEXT)";

  @override
  Picture fromMap(Map<String, dynamic> query) {
    Picture picture = Picture();
    picture.id = query[columnId];
    picture.url = query[_columnUrl];
    picture.dateTime = query[_columnDateTime];
    return picture;
  }

  @override
  Map<String, dynamic> toMap(Picture picture) {
    return <String, dynamic>{
      _columnUrl: picture.url,
      _columnDateTime: picture.dateTime
    };
  }

  @override
  List<Picture> fromList(List<Map<String, dynamic>> query) {
    List<Picture> pictures = List<Picture>();
    for (Map map in query) {
      pictures.add(fromMap(map));
    }
    return pictures;
  }
}
