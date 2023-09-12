import '../../../core/database/database_sqlflite.dart';
import '../model/hospede.dart';

class HospedeUpdateDataSource {
  Future<int> update({required HospedeModel hospedeModel}) async {
    final db = await DatabaseSqflite.openDb();
    return await db.update(
      hospedeTableName,
      hospedeModel.toJson(),
      where: 'hospedeId = ?',
      whereArgs: [hospedeModel.hospedeId],
    );
  }
}
