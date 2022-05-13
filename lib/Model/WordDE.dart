import 'package:untitled/Model/Word.dart';

class WordDE extends Word {
  // final int id;
  //String? phonetic;
  //String? definition;
  // final String example;
  //String? type;
  //String? word;
  // final Iterator<String> synonyms;

  WordDE(String w, String p, String d, String y, bool isFav) : super(w, p, isFav);

  //
  // static String cleanJson(String json){
  //   // To do
  //   // clean API response from the German dictionary
  //   return "";
  // }
  // factory WordDE.fromJson(List<dynamic> json) {
  //
  //   return WordDE(
  //       word: json[0]['word'],
  //       phonetic: json[0]['phonetic'],
  //       definition: json[0]['meaning'][0]['definitions'][0]['definition'],
  //       type: json[0]['meaning'][0]['partOfSpeech'],
  //       example: json[0]['meaning'][0]['definitions'][0]['example']
  //   );
  // }
}