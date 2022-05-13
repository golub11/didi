import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/Model/Definition.dart';
import 'package:untitled/Model/Meaning.dart';
import 'package:untitled/Model/Word.dart';

import 'package:untitled/Model/WordEN.dart';
import 'package:untitled/repository/DataConversion.dart';
import 'package:untitled/repository/RepositoryWordEN.dart';
import 'package:untitled/Screens/word_details/components/synonym.dart';
import 'package:untitled/Screens/word_details/components/top_rounded_container.dart';
import 'package:untitled/components/default_button.dart';
import 'package:untitled/components/search_box.dart';
import 'package:untitled/constants.dart';

import 'dart:convert';

import '../../../size_config.dart';
import '../word_details_screen.dart';
import 'antonym.dart';
import 'definition_container.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BodyState();
  }

// setState() TODO
// kada pretrazi novu rec re-trigger widget

}

class _BodyState extends State {
  late Future<WordEN> futureWord;
  late String theWord = "";
  static DataConversion helper = DataConversion();
  RepositoryWordEN rep = RepositoryWordEN(helper);
  var arguments;
  var _data = [];

  Future<WordEN> fetchWord(String word) async {
    // check the status and error_code, syntax of reposnse
    final response = await http.get(Uri.parse(ENGLISH_DICTIONARY_API_URL + word));
    return helper.wordENFromJson(response.body);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, String>{}) as Map;
    if (arguments.length != 0) {
      theWord = arguments['searchedWord'];
      //theWord = 'pigeon';
      print("Arguments su: " + theWord);
      Word w = rep.selectWord(theWord);
      futureWord = fetchWord(theWord);
    }
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Initializing screen size
    //SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;

    // depending of object futureWord's content - show proper display
    return FutureBuilder<WordEN>(
        future: futureWord,
        builder: (BuildContext context, AsyncSnapshot<WordEN> snapshot) {

          print("setovao word u custombar");
          List<Widget> childrenList = [];
          if (snapshot.hasData) {
            var word = snapshot.requireData;

            childrenList.add(Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: SearchBox(),
            ));

            childrenList.add(_buildWordHeader(snapshot));
            childrenList.add(_buildExpansionPanelList(snapshot));


            childrenList.add(DefaultButton(text: "Save",
                color: word.isFavorite? kPrimaryColor : kSecondaryColor,
                press: () {
              setState(() {
                if (!word.isFavorite) {
                  word.isFavorite = true;
                  rep.insertWord(word);
                }
                else {
                  rep.deleteWord(word);
                  word.isFavorite = false;
                }
              });
            }));

            return Container(padding: EdgeInsets.all(10.0), child: ListView(children: childrenList));
          } else if (snapshot.hasError) {
            childrenList.add(const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ));
            childrenList.add(Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            ));
            return ListView(children: childrenList);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget _buildExpansionPanelList(AsyncSnapshot<WordEN> snapshot) {
    List<ExpansionPanel> expansionPanelListChildren = [];

    for (var i = 0; i < snapshot.requireData.meanings.length; i++) {
      Meaning _cMeaning = snapshot.requireData.meanings[i];
      _data.add(_cMeaning);
      expansionPanelListChildren.add(_buildExpansionPanel(_cMeaning, "# " + (i + 1).toString()));
    }

    Widget expansionPanelList = ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: expansionPanelListChildren,
    );
    return expansionPanelList;
  }

  _buildExpansionPanel(Meaning meaning, String meaningNumber) {
    return ExpansionPanel(
        isExpanded: meaning.isExpanded,
        headerBuilder: (BuildContext context, bool isExpanded) {
          return Container(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Row(
                children:[
                  Text(
                  meaningNumber,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                  ),
                  Spacer(),
                  Text(
                  meaning.wordClass,
                  style: TextStyle(fontSize: 14),
                )

            ]
              ),
          );
        },
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          for (var j = 0; j < meaning.definitions.length; j++)
            wordDefinitionWidget(definition: meaning.definitions[j].definition, example: meaning.definitions[j].example)
          ,
          _buildSynonymsContainer(meaning)
        ]));
  }

  Widget _buildSynonymsContainer(Meaning meaning) {
    List<Widget> _widgets = [SizedBox(width: 0,height: 0,)];

    // checking what to build synonyms or antonyms or both
    if(meaning.antonyms.length != 0 || meaning.synonyms.length != 0) {

      if (meaning.synonyms.length != 0) {
        _widgets.add(
            Padding(
                padding: EdgeInsets.only(left: 10, top: 6),
                child: Text(
                  "Similar:",
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700, fontSize: 16),
                  textAlign: TextAlign.center,
                )));
        for (var j = 0; j < meaning.synonyms.length; j++)
          _widgets.add(MySynonymContainer(synonym: meaning.synonyms[j]));
      }


      if (meaning.antonyms.length != 0) {
        _widgets.add(
            Padding(
                padding: EdgeInsets.only(left: 10, top: 6),
                child: Text(
                  "Opposite:",
                  style: TextStyle(color: kSecondaryColor, fontWeight: FontWeight.w700, fontSize: 16),
                  textAlign: TextAlign.center,
                )
            )
        );
        for (var j = 0; j < meaning.antonyms.length; j++)
          _widgets.add(MyAntonymContainer(antonym: meaning.antonyms[j]));
      }

    }
      return
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Wrap(
            alignment: WrapAlignment.center,
            children:  _widgets
          ),
        );

  }

  Row _buildWordHeader(AsyncSnapshot<WordEN> snapshot) {
    AudioPlayer audioPlayer = AudioPlayer();
    return Row(
      children: [
        Container(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              snapshot.requireData.word,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            )),
        SizedBox(width: 8),
        IconButton(onPressed: () async {

            audioPlayer.setVolume(1.5);
            int result = await audioPlayer.play(snapshot.requireData.audioUrl);
            if (result == 1) {
              print("yeah I played music");// success
             }
            },
            icon: Icon(Icons.volume_up_sharp)),
        Container(
          height: 24,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20 / 4),
                child: Text(
                  snapshot.requireData.phonetic,
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  margin: EdgeInsets.only(right: 20 / 4),
                  height: 7,
                  color: kPrimaryColor.withOpacity(0.2),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
