import 'package:flutter_app/database/database.dart';
import 'package:flutter_app/model/picture.dart';
import '../Dao/pictureDao.dart';
import 'AbstractPictureRepository.dart';

class PictureRepository implements AbstractPictureRepository {
  final dao = PictureDao();

  @override
  DatabaseProvider databaseProvider;

  PictureRepository(this.databaseProvider);

  @override
  Future<Picture> delete(Picture picture) async {
    final db = await databaseProvider.db();
    await db.delete(dao.tableName,
        where: dao.columnId + " = ?", whereArgs: [picture.id]);
    return picture;
  }

  @override
  Future<Picture> insert(Picture picture) async {
    final db = await databaseProvider.db();
    picture.id = await db.insert(dao.tableName, dao.toMap(picture));
    return picture;
  }

  @override
  Future<Picture> update(Picture picture) async {
    final db = await databaseProvider.db();
    await db.update(dao.tableName, dao.toMap(picture),
        where: dao.columnId + " = ?", whereArgs: [picture.id]);
    return picture;
  }

  @override
  Future<List<Picture>> getPictures() async {
    final db = await databaseProvider.db();
    List<Map> maps = await db.query(dao.tableName);
    return dao.fromList(maps);
  }
}
