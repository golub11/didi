import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/Model/Word.dart';
import 'package:untitled/Model/WordDE.dart';
import 'package:untitled/repository/DBProvider.dart';
import 'package:untitled/repository/DataConversion.dart';
import 'package:untitled/constants.dart';
import 'package:http/http.dart' as http;


class RepositoryWordDE{
  DataConversion? helper;
  String table = WORDS_EN_TABLE;

  // Dependency injection
  RepositoryWordEN(DataConversion enableDataConversion){
    helper = enableDataConversion;
  }

  insertWord(Word word){
    DBProvider.db?.insertWord(word);
  }

  deleteWord(Word word){
    DBProvider.db?.deleteWord(word);
  }

  deleteAll(){
    DBProvider.db?.deleteAll(table);
  }

  updateWord(Word word){
    DBProvider.db?.updateWord(word);
  }


  selectAll(){
    Future<List<Word>>? res = DBProvider.db?.selectAll(table, helper!);
    return res;
  }

  selectTop(int n){

    Future<List<Word>>? res = DBProvider.db?.selectTop(table, n, helper!);
    return res;
  }

  selectWord(String word){
    Future<List<Word>>? res = DBProvider.db?.selectWord(table, word, helper!);
    return res;

  }

  fetchDEWord(String word, bool isGerman){
    Future<http.Response>? res = DBProvider.db?.fetchWord(word, isGerman);
    print(" body: : ${res}");
  }


}