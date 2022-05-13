import 'dart:convert';

import 'package:untitled/Model/Definition.dart';
import 'package:untitled/Model/Meaning.dart';
import 'package:untitled/Model/Word.dart';
import 'package:untitled/Model/WordDE.dart';
import 'package:untitled/Model/WordEN.dart';
import 'package:untitled/repository/DBProvider.dart';

// TODO
// parse correctly depending of the API
// and refactor this to not use WordDE and WordEN although to use Word superclass
class DataConversion {
  // English words
  WordEN wordENFromJson(String str) {
    final jsonData = json.decode(str);
    return wordENfromMap(jsonData[0]);
  }

  String wordENToJson(WordEN data) {
    final dyn = wordENToMap(data);
    return json.encode(dyn);
  }
  // TODO develop the second version of _fromMap function
  // to retrieve values from SQL db to object
  WordEN wordENfromMap(Map<String, dynamic> jsonData) {
    var word = jsonData['word'];
    var phonetic = "";
    var audioUrl = "";

    var meanings = List.from(jsonData['meanings'], growable: false);
    var wordClass = "";
    var definitions;
    var synonyms;
    var antonyms;

    List<Meaning>? _meanings = List.empty(growable: true);
    List<Definition>? _definitions;
    List<String>? _synonyms;
    List<String>? _antonyms;

    try {
      if (jsonData['phonetics'] != null) {
        phonetic = getPhoneticandAudio(jsonData)[0];
        audioUrl = getPhoneticandAudio(jsonData)[1];
      }
    } on Exception {
      print("there is no audio for word $word");
    }

    for (int i = 0; i < meanings.length; i++) {
      _definitions = List.empty(growable: true);
      _synonyms = List.empty(growable: true);
      _antonyms = List.empty(growable: true);

      try {
        wordClass = meanings[i]['partOfSpeech'];
      } on Exception {
        print("there is not word class included");
      }

      definitions = List.from(meanings[i]['definitions'], growable: false);
      synonyms = List.from(meanings[i]['synonyms'], growable: false);
      antonyms = List.from(meanings[i]['antonyms'], growable: false);

      for (int j = 0; j < definitions.length; j++) {
        Definition _tmpDefinition;
        var _cDefinition = definitions[j];

        if (_cDefinition['example'] != null) {
          _tmpDefinition = Definition(_cDefinition['definition'], _cDefinition['example']);
        } else {
          _tmpDefinition = Definition(_cDefinition['definition'], "");
        }
        _definitions.add(_tmpDefinition);
      }

      if (synonyms != null) {
        if (synonyms.length != 0) {
            for (int j = 0; j < synonyms.length; j++) {
              var _tmpSynonym = synonyms[j];
              _synonyms.add(_tmpSynonym);
            }
        }
      }

      if (antonyms != null) {
        if (antonyms.length != 0) {
          for (int j = 0; j < antonyms.length; j++) {
            var _tmpAntonym = antonyms[j];
            _antonyms.add(_tmpAntonym);
          }
        }
      }
      _meanings.add(Meaning(_definitions, wordClass, _synonyms, _antonyms, i == 0 ? true : false));
    }

    WordEN wordEN = WordEN(word, phonetic, audioUrl, _meanings, false);

    return wordEN;
  }

  List<String> getPhoneticandAudio(Map<String, dynamic> jsonData) {
    var phonetic = "";
    var audio = "";

    for (var p in jsonData['phonetics']) {
      if (p['text'] != null) {
        if (p['text'] != "" && p['audio'] != null) {
          phonetic = p['text'];
          audio = p['audio'];
        }
      }
    }
    return [phonetic, audio];
  }

  Map<String, dynamic> wordENToMap(data) => {
        "word": data.word,
        "phonetic": data.phonetic,
        "definition": data.definition,
        "type": data.type,
      };

  // Deutche Wörter
  WordDE wordDEFromJson(String str) {
    final jsonData = json.decode(str);
    return wordDEfromMap(jsonData);
  }

  String wordDEToJson(WordDE data) {
    final dyn = wordDEToMap(data);
    return json.encode(dyn);
  }

  WordDE wordDEfromMap(jsonData) =>
      new WordDE(jsonData[0]['word'], jsonData[0]['phonetic'], jsonData[0]['definition'], jsonData[0]['type'], false);

  Map<String, dynamic> wordDEToMap(data) => {
        "word": data.word,
        "phonetic": data.phonetic,
        "definition": data.definition,
        "type": data.type,
      };
}

/* factory WordEN.fromJson(List<dynamic> json) {
    return WordEN(
      word: json[0]['word'],
      phonetic: json[0]['phonetic'],
      definition: json[0]['meaning'][0]['definitions'][0]['definition'],
      type: json[0]['meaning'][0]['partOfSpeech'],
      example: json[0]['meaning'][0]['definitions'][0]['example']
    );
  }*/
