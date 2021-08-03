import 'dart:io';

import 'package:news/src/models/news_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class NewsDbProvider {
  late Database db;

  NewsDbProvider() {
    init();
  }

  void init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'database.db');
    db = await openDatabase(path, version: 1,
        onCreate: (Database newDb, int version) {
      newDb.execute("""
          CREATE TABLE NewsItems
          (
                id TEXT PRIMARY KEY,
                title TEXT,
                description TEXT,
                url TEXT,
                author TEXT,
                image TEXT,
                language TEXT,
                List<String> category BLOB,
                published TEXT,
          )
          """);
    });
  }

  fetchItem(int id) async {
    final maps = await db.query(
      "NewsItems",
      columns: null,
      where: "id = ?",
      whereArgs: [id],
    );

    if (maps.length > 0) {
      return NewsModel.fromDb(maps.first);
    }

    return null;
  }

  addItem (item) {
    return db.insert(
      "NewsItems",
      item.toJson(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  clear() {
    return db.delete('NewsItems');
  }

}
  final newsDbProvider = NewsDbProvider();
