import '../../../core/database/database_sqlflite.dart';

class ReservaDeleteDataSource {
  Future<int> delete({required int id}) async {
    final db = await DatabaseSqflite.openDb();
    return await db.delete(
      reservaTableName,
      where: 'reservaId = ?',
      whereArgs: [id],
    );
  }
}
