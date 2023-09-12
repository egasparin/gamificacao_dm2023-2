import '../../../core/database/database_sqlflite.dart';
import '../model/funcionario.dart';

class FuncionarioInsertDataSource {
  Future<int> insert({required FuncionarioModel funcionario}) async {
    final db = await DatabaseSqflite.openDb();
    return await db.insert(
      funcionarioTableName,
      funcionario.toJson(),
    );
  }
}
