import '../../../core/database/database_sqlflite.dart';
import '../model/quarto.dart';

class QuartoListDataSource {
  Future<List<QuartoModel>> getAll() async {
    final db = await DatabaseSqflite.openDb();
    final List<Map<String, dynamic>> maps = await db.query(quartoTableName);
    return List.generate(maps.length, (i) {
      return QuartoModel.fromJson(maps[i]);
    });
  }
}
