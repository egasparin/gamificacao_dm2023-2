import '../../../core/database/database_sqlflite.dart';

class AdicionaisDeleteDataSource {
  Future<int> delete({required int id}) async {
    final db = await DatabaseSqflite.openDb();
    return await db.delete(
      adicionaisTableName,
      where: 'adicionaisId = ?',
      whereArgs: [id],
    );
  }
}
