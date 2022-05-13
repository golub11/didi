import 'package:flutter/material.dart';
import 'package:untitled/Screens/word_details/components/synonym.dart';

import '../../../constants.dart';

class wordDefinitionWidget extends StatelessWidget {
  wordDefinitionWidget({required this.definition, required this.example});

  String definition;
  String example;

  @override
  Widget build(BuildContext context) {
    return Column( children: [
      // go through every element of definitions and make array of the customized Widget objects
      definitionAndExample(definition, example),

    ],
        );
  }

  Padding definitionAndExample(definition, example) => Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
          children: [
        Text(
          definition,
          style: TextStyle(color: kSecondaryColor, fontWeight: FontWeight.w300),
        ),
        SizedBox(height: 6),
        example != "" ? Text(example, style: TextStyle(fontSize: 16)) : SizedBox(width: 0,height: 0),
        SizedBox(height: 18)
      ]));
}
