import '../../../core/database/database_sqlflite.dart';
import '../model/funcionario.dart';

class FuncionarioListDataSource {
  Future<List<FuncionarioModel>> getAll() async {
    final db = await DatabaseSqflite.openDb();
    final List<Map<String, dynamic>> maps =
        await db.query(funcionarioTableName);
    return List.generate(maps.length, (i) {
      return FuncionarioModel.fromJson(maps[i]);
    });
  }
}
