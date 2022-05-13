
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:untitled/size_config.dart';

final String WORDS_EN_TABLE = "words_en";

final String DEFINITIONS_EN_TABLE = "definitions_en";
final String MEANINGS_EN_TABLE = "meanings_en";


final String WORDS_DE_TABLE = "words_de";

final String DATABASE_NAME = "didi_database.db";

final String PONS_API_SECURITY_KEY = "ce16a72afeb4a1702ea87e88c49ee69049bf4d42aea7ccb4e34acf5dada5232b";
final String COLLINS_API_SECURITY_KEY = "IE6gUYR5wy9DumyOY8GlidbyNMgf12yjpdyqehz2dJrHtY9F1wBMBIxfFwDLAeP9";

final String ENGLISH_DICTIONARY_API_URL = "https://api.dictionaryapi.dev/api/v2/entries/en/";

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

//TODO
// Snackbar widget za dodatu rec


// Future<WordEN> fetchWord() async {
//   final response = await http
//       .get(Uri.parse('https://api.pons.com/v1/dictionary?l=deen&q=erwarten'), headers: {
//     'X-Secret' : GERMAN_DICT_KEY_HEADER
//   });
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     print(":asdasd");
//     print(jsonDecode(response.body));
//     //return WordEN.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }
//
// Future<WordDE> fetchWordDE() async {
//
//   final response = await http
//       .get(Uri.parse('https://api.pons.com/v1/dictionary?l=deen&q=erwarten'), headers: {
//     'X-Secret' : GERMAN_DICT_KEY_HEADER
//   });
//
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     print("znaci Deutsch version!");
//     print(jsonDecode(response.body));
//     //return WordDE.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }
//
