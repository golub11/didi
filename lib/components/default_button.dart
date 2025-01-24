import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.press,
    this.color
  }) : super(key: key);
  final String? text;
  final Function? press;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.screenWidth * 0.15,
        right: SizeConfig.screenWidth * 0.15,
        bottom: getProportionateScreenWidth(40),
      ),
      child: SizedBox(
        width: double.infinity,
        height: getProportionateScreenHeight(56),
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white, shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: color,
          ),
          onPressed: press as void Function()?,
          child: Text(
            text!,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
