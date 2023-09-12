import '../../../core/database/database_sqlflite.dart';

class FuncionarioDeleteDataSource {
  Future<int> delete({required int id}) async {
    final db = await DatabaseSqflite.openDb();
    return await db.delete(
      funcionarioTableName,
      where: 'funcionarioId = ?',
      whereArgs: [id],
    );
  }
}
