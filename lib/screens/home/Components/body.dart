import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Screens/Home/Components/last_added_words.dart';
import 'package:untitled/Screens/Home/Components/logo.dart';
import 'package:untitled/Screens/home/Components/title_with_more_btn.dart';
import 'package:untitled/components/search_box.dart';
import 'package:untitled/constants.dart';

import '../../../size_config.dart';
import 'header_with_search_box.dart';
import 'horizontal_cards.dart';
import 'horizontal_suggest.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWithSearchBox(size: size),
              SizedBox(height: getProportionateScreenHeight(10)),
              //LogoDidi(100,100),
              //SearchBox(),
              //SizedBox(height: getProportionateScreenWidth(10)),
              TitleWithMoreButton(),
              HorizontalCards(size: size),
              LastAddedWords(),
              //SizedBox(height: getProportionateScreenWidth(30)),
            ],
          ),

        )
    );
  }

}




