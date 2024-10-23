import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PlatformConverterHelper {
  static final PlatformConverterHelper instance =
      PlatformConverterHelper._init();

  Future get database async => _database ?? await initDatabase();

  PlatformConverterHelper._init();

  static Database? _database;

  Future<Database?> initDatabase() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, "platform.db");

    _database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        String sql = '''
        CREATE TABLE platform(
        name TEXT NOT NULL,
        call REAL NOT NULL,
        chat TEXT NOT NULL,
        image TEXT,
        id INTEGER PRIMARY KEY AUTOINCREMENT ,
        time TEXT,
        date TEXT
        ); ''';
        await db.execute(sql);
      },
    );
    return _database!;
  }

  Future<void> insertDataInPlatform(String name, double call, String chat,
      String image, String time, String date) async {
    Database? db = await database;
    String sql = '''
    INSERT INTO platform
    (name,call,chat,image,time,date) VALUES (?,?,?,?,?,?);''';
    List args = [name, call, chat, image, time, date];
    await db!.rawInsert(sql, args);
  }

  Future<List<Map>> readData() async {
    Database? db = await database;
    String sql = '''
        
    SELECT * FROM platform
    
    ''';
    return await db!.rawQuery(sql);
  }

  Future<void> deleteData(int id) async {
    Database? db = await database;
    String sql = '''
    DELETE FROM platform WHERE id=?
''';
    List args = [id];
    await db!.rawDelete(sql, args);
  }

  Future<void> updateData(
      String name, double call, String chat, String image, int id) async {
    Database? db = await database;
    String sql =
        '''UPDATE converter SET name = ?, call = ?, chat = ?, image = ?  WHERE id = ?''';
    List args = [name, call, chat, image, id];
    await db!.rawUpdate(sql, args);
  }
}
