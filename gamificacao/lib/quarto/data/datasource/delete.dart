import '../../../core/database/database_sqlflite.dart';

class QuartoDeleteDataSource {
  Future<int> delete({required int id}) async {
    final db = await DatabaseSqflite.openDb();
    return await db.delete(
      quartoTableName,
      where: 'quartoId = ?',
      whereArgs: [id],
    );
  }
}
