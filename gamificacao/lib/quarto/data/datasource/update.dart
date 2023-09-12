import '../../../core/database/database_sqlflite.dart';
import '../model/quarto.dart';

class QuartoUpdateDataSource {
  Future<int> update({required QuartoModel quartoModel}) async {
    final db = await DatabaseSqflite.openDb();
    return await db.update(
      quartoTableName,
      quartoModel.toJson(),
      where: 'quartoId = ?',
      whereArgs: [quartoModel.quartoId],
    );
  }
}
