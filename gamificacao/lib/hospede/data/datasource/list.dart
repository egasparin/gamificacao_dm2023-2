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
