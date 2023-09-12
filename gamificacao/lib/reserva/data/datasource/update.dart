import '../../../core/database/database_sqlflite.dart';
import '../model/reserva.dart';

class ReservaUpdateDataSource {
  Future<int> update({required ReservaModel reservaModel}) async {
    final db = await DatabaseSqflite.openDb();
    return await db.update(
      reservaTableName,
      reservaModel.toJson(),
      where: 'reservaId = ?',
      whereArgs: [reservaModel.reservaId],
    );
  }
}
