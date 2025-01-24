import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:untitled/Model/Word.dart';
import 'package:untitled/Model/WordDE.dart';
import 'package:untitled/Model/WordEN.dart';
import 'package:untitled/repository/DataConversion.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class DBProvider {
  DBProvider._privateConstructor();

  static final DBProvider? db = DBProvider._privateConstructor();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), 'didi_database.db');
    // return await openDatabase(path, version: 3, onOpen: (db) {}, onCreate: (Database db, int version) async {
    //   await db.execute(
    //       'CREATE TABLE ' + WORDS_EN_TABLE + '(id INTEGER PRIMARY KEY, word TEXT, phonetic TEXT, audio_url TEXT); ');
    //   await db.execute(
    //       'CREATE TABLE IF NOT EXISTS ' + MEANINGS_EN_TABLE + '(id INTEGER PRIMARY KEY, fk_word_id INTEGER, word_class TEXT, synonyms TEXT, antonyms TEXT); ');
    //   await db.execute(
    //       'CREATE TABLE IF NOT EXISTS ' + DEFINITIONS_EN_TABLE + '(id INTEGER PRIMARY KEY, fk_meaning_id INTEGER, definition TEXT, example TEXT); ');
    //   await db.execute(
    //       'CREATE TABLE ' + WORDS_DE_TABLE + '(id INTEGER PRIMARY KEY, word TEXT, phonetic TEXT, definition TEXT, type TEXT)');
    // });
  }

  insertWord(Word word) async {
    final db = await database;
    var query = "";

    if (word is WordEN) {
      var queryWord = "INSERT INTO " + WORDS_EN_TABLE + "(word, phonetic, audio_url) VALUES (?,?,?)";
      WordEN w = word;

      var queryMeaning = "";
      var queryDefinition = "";

      try {
        int wordId = await db!.rawInsert(queryWord, [w.word, w.phonetic, w.audioUrl]);

        for (int i = 0; i < w.meanings.length; i++) {
          var currentMeaning = w.meanings[i];
          queryMeaning =
              "INSERT INTO " + MEANINGS_EN_TABLE + "(fk_word_id, word_class, synonyms, antonyms) VALUES (?,?,?,?)";

          // prodji kroz sinonime i napravi veliki string pa ga insert u db
          var s = "";
          if (currentMeaning.synonyms.length!=0){
            for(var synonym in currentMeaning.synonyms) {
              s += synonym + ", ";
            }
          }
          print(s);
          print(i);
          var a = "";
          if (currentMeaning.antonyms.length!=0){
            for(var antonym in currentMeaning.antonyms) {
              a += antonym + ", ";
            }
            print(a);
          }

          int meaningId = await db.rawInsert(
              queryMeaning, [wordId, currentMeaning.wordClass,  s, a]);

          for (int j = 0; j < currentMeaning.definitions.length; j++) {
            var currentDefinition = currentMeaning.definitions[j];
            queryDefinition =
                "INSERT INTO " + DEFINITIONS_EN_TABLE + "(fk_meaning_id, definition, example) VALUES (?,?,?)";
            int definitionId = await db
                .rawInsert(queryDefinition, [meaningId, currentDefinition.definition, currentDefinition.example]);
          }
        }
        return wordId;
      } on Exception catch (e) {
        throw "Inserting word into unrecognized table...The object is not familiar by the APP.";
      }
    } else if (word is WordDE) {
      query = "INSERT INTO " + WORDS_EN_TABLE + " (word, phonetic, definition, type) VALUES (?,?,?,?)";
    }
  }

  deleteWord(Word word) async {
    final db = await database;

    var query = "";

    if (word is WordEN) {
      query = "DELETE FROM " + WORDS_EN_TABLE + " WHERE word = ?";
    } else if (word is WordDE) {
      query = "DELETE FROM " + WORDS_DE_TABLE + " WHERE word = ?";
    }

    try {
      var raw = await db!.rawDelete(query, [word.word]);
      return raw;
    } on Exception catch (e) {
      throw "Deleting word from unrecognized table...The object is not familiar by the APP.";
    }
  }

  deleteAll(String table) async {
    // final db = await database;
    final db = await database;
    var query = "";

    if (table == WORDS_EN_TABLE) {
      query = "DELETE * FROM " + WORDS_EN_TABLE;
    } else if (table == WORDS_DE_TABLE) {
      query = "DELETE * FROM " + WORDS_DE_TABLE;
    }

    try {
      db!.rawDelete(query);
    } on Exception catch (e) {
      throw "Deleting ALL words from unrecognized table...The object is not familiar by the APP.";
    }
  }

  // TODO
  // Test whats happens with id since we are autoincrementing it
  // how do we get it
  updateWord(Word word) async {
    final db = await database;
    var query = "";

    if (word is WordEN) {
      query = "UPDATE " + WORDS_EN_TABLE + "  SET word = ?, phonetic = ?, definition = ?, type = ? WHERE id = ?";
    } else if (word is WordDE) {
      query = "UPDATE " + WORDS_DE_TABLE + " SET word = ?, phonetic = ?, definition = ?, type = ? WHERE id = ?";
    }
    try {
      // TODO
      //var res = await db!.rawUpdate(query, [word.word, word.phonetic, word.definition, word.type]);
      //return res;
    } on Exception catch (e) {
      throw "Updating word is not possible. Contact the developer.";
    }
  }

  // void selectAll(String table) {}

  //void selectTop(int n) {}

  Future<List<Word>> selectAll(String table, DataConversion helper) async {
    final db = await database;
    var query = "";

    if (table == WORDS_EN_TABLE) {
      query = "SELECT * FROM " + WORDS_EN_TABLE;
    } else if (table == WORDS_DE_TABLE) {
      query = "SELECT * FROM " + WORDS_DE_TABLE;
    }

    try {
      var res = await db?.rawQuery(query);

      List<Word> maps = res!.isNotEmpty ? res.map((w) => helper.wordENfromMap(w)).toList() : [];

      if (maps.length > 0) {
        return maps;
      }

      return [];
    } on Exception catch (e) {
      throw "Selecting ALL words is not possible...Contact the developer.";
    }
  }

  Future<List<Word>>? selectTop(String table, int n, DataConversion helper) async {
    final db = await database;
    var query = "";

    if (table == WORDS_DE_TABLE) {
      query = "SELECT TOP (?) FROM " + WORDS_EN_TABLE;
    } else if (table == WORDS_DE_TABLE) {
      query = "SELECT TOP (?) FROM " + WORDS_DE_TABLE;
    }

    try {
      var res = await db?.rawQuery(query);

      List<Word> maps = res!.isNotEmpty ? res.map((w) => helper.wordENfromMap(w)).toList() : [];

      if (maps.length > 0) {
        return maps;
      }

      return [];
    } on Exception catch (e) {
      throw "Selecting TOP " + n.toString() + " words is not possible...Contact the developer.";
    }
  }

  selectWord(String table, String word, DataConversion helper) async {
    final db = await database;

    List<Map<String, Object?>>? res = await db?.query(table, where: "word = ?", whereArgs: [word]);

    return res!.isNotEmpty ? res.map((w) => helper.wordENfromMap(w)).toList() : null;
  }

  Future<http.Response> fetchWord(String word, bool isGerman) async {
    Map<String, String> h = {"X-Secret": PONS_API_SECURITY_KEY};
    var response = await http.get(Uri.parse('https://api.pons.com/v1/dictionary?l=deen&q=erwarten'), headers: h);
    return response;
  }
}
