import '../../../core/database/database_sqlflite.dart';
import '../model/adicionais.dart';

class AdicionaisInsertDataSource {
  Future<int> insert({required AdicionaisModel adicionais}) async {
    final db = await DatabaseSqflite.openDb();
    return await db.insert(
      adicionaisTableName,
      adicionais.toJson(),
    );
  }
}
