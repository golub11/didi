import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Screens/word_details/word_details_screen.dart';

import '../../size_config.dart';
import 'components/Body.dart';

class VocabularyListScreen extends StatelessWidget{
  static String routeName = "/vocabulary_list_screen";

  @override
  Widget build(BuildContext context) {
    // TODO find out the concept behind this method
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(trailingIcon: Icon(Icons.menu), trailingText: "more"),
      ),
    );
  }
}