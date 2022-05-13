import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class MyAntonymContainer extends StatelessWidget {
  MyAntonymContainer({required this.antonym});

  String antonym;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 10, left: 10),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          border: Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Padding(

          padding: const EdgeInsets.all(6.0),
          child: Text(antonym, style: TextStyle(color: Colors.white),),
        ));
  }
}
