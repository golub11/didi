import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Model/Word.dart';

import '../../../constants.dart';

class WordItem extends StatelessWidget {

  WordItem({required this.title, required this.subtitle, required this.english});

  String title;
  String subtitle;
  bool english;

  @override
  Widget build(BuildContext context) {
    String imageSrc = english ? 'assets/images/uk.png' : 'assets/images/germany.png' ;

    return Card(
      child: ListTile(
        leading:  Image(width: 30, height: 30,image: AssetImage(imageSrc)),
        title: Text(title),
        subtitle: Text(subtitle),
        dense: true,
        onTap: () => {},
        trailing: Icon(Icons.assessment, color: kPrimaryColor),
      ),
    );
  }
}