import '../../../core/database/database_sqlflite.dart';
import '../model/quarto.dart';

class QuartoInsertDataSource {
  Future<int> insert({required QuartoModel quarto}) async {
    final db = await DatabaseSqflite.openDb();
    return await db.insert(
      quartoTableName,
      quarto.toJson(),
    );
  }
}
