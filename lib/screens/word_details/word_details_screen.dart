import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/Model/Word.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/Model/WordEN.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/repository/DataConversion.dart';
import 'package:untitled/repository/RepositoryWordEN.dart';
import '../../size_config.dart';
import 'components/body.dart';



class WordDetailsScreen extends StatelessWidget {
  static String routeName = "/word_details";



  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(trailingIcon: Icon(Icons.book_outlined), trailingText: "Save it"),
      ),
    );
  }
}

class CustomAppBar extends StatefulWidget {
  CustomAppBar({required this.trailingIcon, required this.trailingText});

  static _CustomAppBarState? of(BuildContext context) =>
      context.findAncestorStateOfType<_CustomAppBarState>();

  Icon trailingIcon;
  String trailingText;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  late WordEN _wordEN;

  set word(WordEN value) => setState(() {
    _wordEN = value;
  });
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);


  static DataConversion helper = DataConversion();
  RepositoryWordEN rep = RepositoryWordEN(helper);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(40),
              width: getProportionateScreenWidth(40),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  primary: kPrimaryColor,
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.zero,
                ),
                onPressed: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back_ios),
              ),
            ),
            Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildIfNotFavorite(widget){
    return <Widget>[
      Text(
        widget.trailingText,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),
      ),
      const SizedBox(width: 5),
      widget.trailingIcon
    ];
  }

  _buildIfFavorite(){
    return <Widget>[
      Text(
        "Saved!",
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),
      ),
      const SizedBox(width: 5),
      Icon(Icons.book, color: kPrimaryColor)
    ];
  }


}
