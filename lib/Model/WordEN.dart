import 'dart:convert';

import 'dart:io';
import 'Meaning.dart';
import 'Word.dart';


class WordEN extends Word {
  //String? word;
  late String audioUrl;

  //late Uri? audioUri;
  late List<Meaning> meanings;
  
  // final String example;
  //String? type;

  WordEN(String w, String p, String url,  List<Meaning> meanings, bool isFav) : super(w, p, isFav){
    this.audioUrl = url;
    this.meanings = meanings;
  } 


}