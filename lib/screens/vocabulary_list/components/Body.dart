import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Model/Word.dart';
import 'package:untitled/Screens/vocabulary_list/components/word_container.dart';

import '../../../constants.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
      boxShadow: [
        BoxShadow(
          offset: Offset(0,10),
          blurRadius: 50,
          color: kPrimaryColor.withOpacity(0.4),
        )
      ],
    ),
      child: ListView(

        children: [
          WordItem(title: "word.word", subtitle: "definition of the word - word.definition", english: true),
          WordItem(title: "word.word", subtitle: "definition of the word - word.definition", english: false),

        ],
      ),
    );
  }
}

