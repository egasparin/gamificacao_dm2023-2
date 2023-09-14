import 'package:sqflite/sqflite.dart';

const String hospedeTableName = 'hospedes';
const String funcionarioTableName = 'funcionarios';
const String reservaTableName = 'reserva';
const String quartoTableName = 'quarto';
const String adicionaisTableName = 'adicionais';

class DatabaseSqflite {
  static Future<Database> openDb() async {
    // await deleteDatabase(join(await getDatabasesPath(), 'gamificacao.db'));
    final db = await openDatabase(
      'gamificacao.db',
      version: 1,
      onCreate: (db, version) {
        return createTables(db);
      },
    );
    return db;
  }

  static Future<void> createTables(Database db) async {
    await db.execute('''
      CREATE TABLE $funcionarioTableName (
        funcionarioId INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        sobrenome TEXT,
        cargo TEXT,
        salario TEXT,
        admissao TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE $hospedeTableName (
        hospedeId INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        sobrenome TEXT,
        documento TEXT,
        contato TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE $reservaTableName (
        reservaId INTEGER PRIMARY KEY AUTOINCREMENT,
        dataEntrada TEXT,
        dataSaida TEXT,
        hospedeSelected INTEGER,
        quartoSelected INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE $quartoTableName (
        quartoId INTEGER PRIMARY KEY AUTOINCREMENT,
        numero TEXT,
        tipo TEXT,
        status TEXT,
        preco TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE $adicionaisTableName (
        adicionalId INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao TEXT,
        preco TEXT
      )
    ''');
  }
}
