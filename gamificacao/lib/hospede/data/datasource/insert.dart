import '../../../core/database/database_sqlflite.dart';
import '../model/hospede.dart';

class HospedeInsertDataSource {
  Future<int> insert({required HospedeModel hospede}) async {
    final db = await DatabaseSqflite.openDb();
    return await db.insert(
      hospedeTableName,
      hospede.toJson(),
    );
  }
}
