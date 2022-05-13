import 'package:untitled/Model/Definition.dart';

class Meaning{
  late List<Definition> definitions;
  late String wordClass;
  late List<String> synonyms;
  late List<String> antonyms;
  late bool isExpanded;

  Meaning(this.definitions, this.wordClass, this.synonyms, this.antonyms, this.isExpanded);
}