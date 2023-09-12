import '../../../core/database/database_sqlflite.dart';
import '../model/reserva.dart';

class ReservaListDataSource {
  Future<List<ReservaModel>> getAll() async {
    final db = await DatabaseSqflite.openDb();
    final List<Map<String, dynamic>> maps = await db.query(reservaTableName);
    return List.generate(maps.length, (i) {
      return ReservaModel.fromJson(maps[i]);
    });
  }
}
