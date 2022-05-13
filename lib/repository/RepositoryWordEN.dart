
import 'package:untitled/Model/Word.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/repository/DBProvider.dart';
import 'package:untitled/repository/DataConversion.dart';
import 'package:http/http.dart' as http;

class RepositoryWordEN{
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
    var res = DBProvider.db?.selectWord(table, word, helper!);
    return res;
    }

    fetchENWord(String word, bool isGerman){
      Future<http.Response>? res = DBProvider.db?.fetchWord(word, isGerman);
      print(" body: : ${res}");
    }


}


