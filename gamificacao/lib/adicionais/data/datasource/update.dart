import '../../../core/database/database_sqlflite.dart';
import '../model/adicionais.dart';

class AdicionaisUpdateDataSource {
  Future<int> update({required AdicionaisModel adicionais}) async {
    final db = await DatabaseSqflite.openDb();
    return await db.update(
      adicionaisTableName,
      adicionais.toJson(),
      where: 'adicionaisId = ?',
      whereArgs: [adicionais.adicionaisId],
    );
  }
}
