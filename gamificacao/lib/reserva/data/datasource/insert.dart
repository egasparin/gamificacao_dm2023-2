import '../../../core/database/database_sqlflite.dart';
import '../model/reserva.dart';

class ReservaInsertDataSource {
  Future<int> insert({required ReservaModel reserva}) async {
    final db = await DatabaseSqflite.openDb();
    return await db.insert(
      reservaTableName,
      reserva.toJson(),
    );
  }
}
