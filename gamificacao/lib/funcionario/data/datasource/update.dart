import '../../../core/database/database_sqlflite.dart';
import '../model/funcionario.dart';

class FuncionarioUpdateDataSource {
  Future<int> update({required FuncionarioModel funcionario}) async {
    final db = await DatabaseSqflite.openDb();
    return await db.update(
      funcionarioTableName,
      funcionario.toJson(),
      where: 'funcionarioId = ?',
      whereArgs: [funcionario.funcionarioId],
    );
  }
}
