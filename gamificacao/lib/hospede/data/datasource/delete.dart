import '../../../core/database/database_sqlflite.dart';

class HospedeDeleteDataSource {
  Future<int> delete({required int id}) async {
    final db = await DatabaseSqflite.openDb();
    return await db.delete(
      hospedeTableName,
      where: 'funcionarioId = ?',
      whereArgs: [id],
    );
  }
}
