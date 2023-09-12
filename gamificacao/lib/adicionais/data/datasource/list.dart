import '../../../core/database/database_sqlflite.dart';
import '../model/adicionais.dart';

class AdicionaisListDataSource {
  Future<List<AdicionaisModel>> getAll() async {
    final db = await DatabaseSqflite.openDb();
    final List<Map<String, dynamic>> maps =
        await db.query(adicionaisTableName);
    return List.generate(maps.length, (i) {
      return AdicionaisModel.fromJson(maps[i]);
    });
  }
}
