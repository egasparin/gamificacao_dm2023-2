import '../../../core/database/database_sqlflite.dart';
import '../model/hospede.dart';

class HospedeListDataSource {
  Future<List<HospedeModel>> getAll() async {
    final db = await DatabaseSqflite.openDb();
    final List<Map<String, dynamic>> maps = await db.query(hospedeTableName);
    return List.generate(maps.length, (i) {
      return HospedeModel.fromJson(maps[i]);
    });
  }
}

class HospedeGetIdDataSource {
  Future get({required int id}) async {
    final db = await DatabaseSqflite.openDb();
    final maps = await db.query(
      hospedeTableName,
      where: 'hospedeId = ?',
      whereArgs: [id],
    );
    return maps;
  }
}
